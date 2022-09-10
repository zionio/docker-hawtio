# Docker Hawtio

![GitHub](https://img.shields.io/github/license/zionio/docker-hawtio)

Simple standalone image for Hawtio web console (https://hawt.io)

## Introduction

Dockerfile to build a standalone image for [Hawtio](https://hawt.io) web console.

- [Installation](#installation)
- [Quick Start](#quick-start)
- [Variables](#variables)
- [License](#license)


## Installation

Automated builds are available on [Dockerhub](https://hub.docker.com/r/znio/hawtio).

```bash
docker pull znio/hawtio:2.15.1
```

You can also pull the `latest` tag which is built from the repository

```bash
docker pull znio/hawtio:latest
```

You can build your own image locally with docker `--build-arg` and specific `RELEASE` (default == `latest`)

```bash
docker build --build-arg RELEASE=2.15.1 -t hawtio:2.15.1 github.com/zionio/docker-hawtio#main
```

## Quick Start

The quickest way to get started is using [docker-compose](https://docs.docker.com/compose/).

```bash
curl -O https://raw.githubusercontent.com/zionio/docker-hawtio/main/docker-compose.yml
```

and start Hawtio using:

```bash
docker-compose up
```

Alternatively, you can always manually launch the container with Docker.

```bash
docker run --rm -it -p 8080:8080 znio/hawtio:latest
```

and point your browser to `http://localhost:8080/hawtio`


## Variables

You can add `java` options with `HAWTIO_JAVA_OPTS` variable.

With docker

```bash
docker run --rm -it -p 8080:8080 -e HAWTIO_JAVA_OPTS="-Dhawtio.proxyDisableCertificateValidation=true" znio/hawtio:latest
```

Or editing [docker-compose.yml](docker-compose.yml) file

```yaml
version: "3.8"
services:
  hawtio:
    container_name: hawtio
    image: znio/hawtio:latest
    ports:
      - '8080:8080'
    environment:
      - HAWTIO_JAVA_OPTS=
          -Dhawtio.proxyDisableCertificateValidation=true
          -Dhawtio.authenticationEnabled=false
```

the following variables are set by default:

* `-Dhawtio.proxyDisableCertificateValidation=true`
* `-Dhawtio.authenticationEnabled=false`

## License

This project is licensed under [Apache License, Version 2.0](LICENSE.txt).
