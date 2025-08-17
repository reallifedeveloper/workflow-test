FROM gcr.io/oss-fuzz-base/base-builder-jvm
RUN apt-get update && apt-get install -y openjdk-21-jdk && apt-get install -y maven
RUN export JAVA_21_HOME="/usr/lib/jvm/openjdk-21"
RUN mkdir ~/.m2
RUN ln -s $SRC/project-to-test/.clusterfuzzlite/toolchains.xml ~/.m2

COPY . $SRC/project-to-test
WORKDIR $SRC/project-to-test
COPY ./.clusterfuzzlite/build.sh $SRC/
