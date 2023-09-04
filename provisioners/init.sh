#!/bin/sh
set -o errexit
set -o nounset

# based on https://github.com/scipy/scipy/issues/9481#issuecomment-565184118
apk --no-cache add lapack libstdc++
apk --no-cache add --virtual .builddeps g++ gcc gfortran musl-dev lapack-dev

apk add py3-setuptools
apk add ansible
