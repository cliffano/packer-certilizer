<img align="right" src="https://raw.github.com/cliffano/packer-certilizer/master/avatar.jpg" alt="Avatar"/>

[![Build Status](https://github.com/cliffano/packer-certilizer/workflows/CI/badge.svg)](https://github.com/cliffano/packer-certilizer/actions?query=workflow%3ACI)
[![Docker Pulls Count](https://img.shields.io/docker/pulls/cliffano/certilizer.svg)](https://hub.docker.com/r/cliffano/certilizer/)
[![Security Status](https://snyk.io/test/github/cliffano/packer-certilizer/badge.svg)](https://snyk.io/test/github/cliffano/packer-certilizer)

Packer Certilizer
--------------

Packer Certilizer is a Packer builder of machine image for running [Certilizer](https://github.com/cliffano/certilizer) SSL/TLS certificates reporting tool.

| Packer Certilizer Version | Certilizer Version | Python Version | Alpine Version |
|---------------------------|--------------------|----------------|----------------|
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

    REPOSITORY                                       TAG                 IMAGE ID            CREATED             SIZE
    cliffano/certilizer                         0.9.0-pre.0                            2147033a2dae   9 hours ago     1.15GB
    cliffano/certilizer                         latest                                 2147033a2dae   9 hours ago     1.15GB

Usage
-----

Simply run a container using cliffano/certilizer image:

    docker run \
      --rm \
      --workdir /opt/workspace \
      -v /var/run/docker.sock:/var/run/docker.sock \
      -v $(pwd):/opt/workspace \
      -i -t cliffano/certilizer