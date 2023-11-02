ARG TAG=latest
FROM mageai/mageai:${TAG}

# Add Debian Bullseye repository
RUN echo 'deb http://deb.debian.org/debian bullseye main' > /etc/apt/sources.list.d/bullseye.list

ENV JAVA_HOME="/usr/lib/jvm/java-11-openjdk-amd64/"

# Install OpenJRE 11
RUN apt-get update -y \
    && apt-get install --no-install-recommends -y openjdk-11-jre-headless \
    && rm /etc/apt/sources.list.d/bullseye.list

RUN python -m pip install pyspark

