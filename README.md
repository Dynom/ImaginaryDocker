[![Docker Build Statu](https://img.shields.io/docker/build/dynom/imaginarydocker.svg?style=flat-square)](https://hub.docker.com/r/dynom/imaginarydocker/tags/)  [![Image size](https://images.microbadger.com/badges/image/dynom/imaginarydocker.svg)](https://hub.docker.com/r/dynom/imaginarydocker/tags/)  [![Latest version](https://images.microbadger.com/badges/version/dynom/imaginarydocker.svg)](https://hub.docker.com/r/dynom/imaginarydocker/tags/)


# Introduction
This repository manages a docker image that pins on specific versions of [libvips](https://github.com/jcupitt/libvips) and [Imaginary](https://github.com/h2non/imaginary).

Current versions:
* Go 1.8.3
* libvips 8.5.5
* Imaginary 1.0.0 (bimg v1.0.9)
* Ubuntu (latest stable releases, look at the Docker image tag's to pick a specific release)

_Note: Higher versions isn't necessarily better! Test the image thoroughly first. There have been several regression problems in the past, in terms of memory leaks in libvips_

# Tags
For an up-to-date list, see: https://hub.docker.com/r/dynom/imaginarydocker/

* xenial-v1.0.3 (based on Ubuntu Xenial, LTS)
* trusty-v1.0.4 (based on Ubuntu Trusty)

# Versions
## v1.0.4
* Updated Imaginary to 1.0.0 (bimg v1.0.9)

## v1.0.3
* Updated libvips to 8.5.5
* Updated Imaginary to 0.1.31 (bimg v1.0.8)

## v1.0.2
* Same as v1.0.1, but changed the build to produce a smaller images size.

## v1.0.1
* Go 1.8.1
* libvips 8.5.4
* Imaginary 0.1.30
* Ubuntu trusty (latest stable)

## v1.0.0
* Go 1.6
* libvips 8.5.4
* Imaginary 0.1.30
* Ubuntu trusty (latest stable)

# Goals
* To have more fine-grained control over the versions

## Non goals
* To build the smallest possible image. Significantly reducing it will be a lot of work to maintain
* To have a major coverage in version numbers. If you need a specific combination, fork, define and build


# Instructions

```
$ docker run --rm -it dynom/imaginarydocker:v1.0.0 -h
imaginary 0.1.30

Usage:
  imaginary -p 80
  imaginary -cors -gzip
  imaginary -concurrency 10
  ...
```

_Note: If you specify a different port, be sure to set it as an environmental variable. The Dockerfile defines a `PORT` that takes precedence over Imaginary's `-p` flag._
