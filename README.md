<img align="right" src="https://raw.github.com/cliffano/packer-certilizer/master/avatar.jpg" alt="Avatar"/>

[![Build Status](https://github.com/cliffano/packer-certilizer/workflows/CI/badge.svg)](https://github.com/cliffano/packer-certilizer/actions?query=workflow%3ACI)
[![Security Status](https://snyk.io/test/github/cliffano/packer-certilizer/badge.svg)](https://snyk.io/test/github/cliffano/packer-certilizer)
[![Published Version](https://img.shields.io/docker/v/cliffano/certilizer.svg)](https://hub.docker.com/r/cliffano/certilizer/)
[![Docker Pulls Count](https://img.shields.io/docker/pulls/cliffano/certilizer.svg)](https://hub.docker.com/r/cliffano/certilizer/)

Packer Certilizer
--------------

Packer Certilizer is a Packer builder of machine image for running [Certilizer](https://github.com/cliffano/certilizer) SSL/TLS certificates reporting tool.

| Packer Certilizer Version | Certilizer Version | Python Version | Alpine Version |
|---------------------------|--------------------|----------------|----------------|
| 1.0.0                     | 1.0.0              | 3.12           | 3.22           |
| 0.12.0                    | 0.12.0             | 3.11.5         | 3.18           |
| 0.11.0                    | 0.11.0             | 3.11.5         | 3.18           |
| 0.10.0                    | 0.10.3             | 3.11.5         | 3.18           |

Installation
------------

Pull certilizer Docker image from Docker Hub:

    docker pull cliffano/certilizer

Or alternatively, you can create the Docker image:

    git clone https://github.com/cliffano/packer-certilizer
    cd packer-certilizer
    make build-docker

An image with `cliffano/certilizer` repository and `latest` tag should show up:

    haku> docker images

    REPOSITORY                           TAG                 IMAGE ID       CREATED          SIZE
    cliffano/certilizer                  0.12.1-pre.0        50f465597fd9   23 minutes ago   695MB
    cliffano/certilizer                  latest              50f465597fd9   23 minutes ago   695MB

Usage
-----

Simply run a container using cliffano/certilizer image:

    docker run \
      --rm \
      --workdir /opt/workspace \
      -v /var/run/docker.sock:/var/run/docker.sock \
      -v $(pwd):/opt/workspace \
      -i -t cliffano/certilizer