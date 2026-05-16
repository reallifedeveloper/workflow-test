FROM gcr.io/oss-fuzz-base/base-builder-jvm
RUN apt-get update && apt-get install -y openjdk-21-jdk && apt-get install -y maven
ENV JAVA_17_HOME="/usr/lib/jvm/java-17-openjdk-amd64"
ENV JAVA_21_HOME="/usr/lib/jvm/java-21-openjdk-amd64"
RUN mkdir ~/.m2
RUN ln -s $SRC/project-to-test/.clusterfuzzlite/toolchains.xml ~/.m2
# RUN mvn -Dtoolchain.file=$HOME/.m2/toolchains.xml toolchains:generate-jdk-toolchains-xml
# RUN ln -s ~/.m2/discovered-jdk-toolchains-cache.xml ~/.m2/toolchains.xml
# ENTRYPOINT env

COPY . $SRC/project-to-test
WORKDIR $SRC/project-to-test
COPY ./.clusterfuzzlite/build.sh $SRC/
