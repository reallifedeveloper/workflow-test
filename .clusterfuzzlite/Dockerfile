FROM gcr.io/oss-fuzz-base/base-builder-jvm
RUN apt-get update && apt-get install -y openjdk-21-jdk && apt-get install -y maven
COPY . $SRC/workflow-test
WORKDIR $SRC/workflow-test
COPY ./.clusterfuzzlite/build.sh $SRC/
