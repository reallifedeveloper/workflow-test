FROM gcr.io/oss-fuzz-base/base-builder-jvm
RUN apt-get update && apt-get install -y openjdk-21-jdk && apt-get install -y maven
RUN mvn -Dtoolchain.file=$HOME/.m2/toolchains.xml toolchains:generate-jdk-toolchains-xml

COPY . $SRC/project-to-test
WORKDIR $SRC/project-to-test
COPY ./.clusterfuzzlite/build.sh $SRC/
