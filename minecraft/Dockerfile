ARG REGISTRY
FROM $REGISTRY/debian:buster-slim
RUN apt-get update && \
    apt-get -y install --no-install-recommends openjdk-11-jre-headless && \
	rm -rf /var/lib/apt/lists/*
RUN useradd --create-home --home /var/lib/minecraft --shell /bin/bash minecraft
ARG DIST=server.jar
ARG URL=https://launcher.mojang.com/v1/objects/35139deedbd5182953cf1caa23835da59ca3d7cd/server.jar
ARG SHA512=2807168800da30e6e58a22fc9f1981b58be6ba986d12dc138c19013269fcf51976db21a0488c3a95468e4f8016646db3a9966ac2065f6950ba9b733056df47bd
RUN mkdir -p /usr/local/lib/minecraft
RUN wget -O $DIST $URL && \
    echo "expected SHA512=$(sha512sum $DIST)" && \
    echo "$SHA512  $DIST" | sha512sum -c - && \
    mv $DIST /usr/local/lib/minecraft/server.jar
USER minecraft
WORKDIR /var/lib/minecraft
RUN echo eula=true > eula.txt
CMD ["java", "-Xmx1024M", "-Xms1024M", "-jar", "/usr/local/lib/minecraft/server.jar", "nogui"]
