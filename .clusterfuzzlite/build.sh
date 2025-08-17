PROJECT_NAME=workflow-test

mvn package

CURRENT_VERSION=$(mvn help:evaluate -Dexpression=project.version -q -DforceStdout)
cp "target/${PROJECT_NAME}-${CURRENT_VERSION}.jar" $OUT/${PROJECT_NAME}.jar

PROJECT_JARS="${PROJECT_NAME}.jar"

BUILD_CLASSPATH=$(echo $PROJECT_JARS | xargs printf -- "$OUT/%s:"):$JAZZER_API_PATH
RUNTIME_CLASSPATH=$(echo $PROJECT_JARS | xargs printf -- "\$this_dir/%s:"):\$this_dir

for fuzzer in $(find $SRC -name '*Fuzzer.java'); do
    fuzzer_basename=$(basename -s .java $fuzzer)
    javac -cp $BUILD_CLASSPATH $fuzzer
    cp $SRC/$fuzzer_basename.class $OUT/

    # Create an execution wrapper that executes Jazzer with the correct arguments.
    echo "#!/bin/sh
# LLVMFuzzerTestOneInput for fuzzer detection.
this_dir=\$(dirname \"\$0\")
LD_LIBRARY_PATH=\"$JVM_LD_LIBRARY_PATH\":\$this_dir \
\$this_dir/jazzer_driver --agent_path=\$this_dir/jazzer_agent_deploy.jar \
--cp=$RUNTIME_CLASSPATH \
--target_class=$fuzzer_basename \
--jvm_args=\"-Xmx2048m:-Djava.awt.headless=true\" \
\$@" > $OUT/$fuzzer_basename
    chmod +x $OUT/$fuzzer_basename
done