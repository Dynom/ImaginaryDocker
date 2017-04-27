# Introduction
This repository manages a docker image that pins on specific versions of [libvips](https://github.com/jcupitt/libvips) and [Imaginary](https://github.com/h2non/imaginary).

Current versions:
* Go 1.8.1
* libvips 8.5.4
* Imaginary 0.1.30
* Ubuntu trusty (latest stable)

_Note: Higher versions isn't necessarily better! Test the image thoroughly first. There have been several regression problems in the past, in terms of memory leaks in libvips_

# Tags
* xenial-v1.0.1 (based on Ubuntu Xenial, LTS)
* trusty-v1.0.1 (based on Ubuntu Trusty)

# Versions
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
* To build the smallest possible image. Currently the size is around 900MiB, which is enormous. However, significantly reducing it will be a lot of work
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