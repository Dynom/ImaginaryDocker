FROM ubuntu:trusty

# libvips version to use
ENV LIBVIPS_VERSION="8.5.4"

# Go version to use
ENV GOLANG_VERSION 1.8.1
ENV GOPATH /go
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH

RUN \

  # Install dependencies
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    automake build-essential curl \
    gobject-introspection gtk-doc-tools libglib2.0-dev libjpeg-turbo8-dev libpng12-dev \
    libwebp-dev libtiff5-dev libgif-dev libexif-dev libxml2-dev libpoppler-glib-dev \
    swig libmagickwand-dev libpango1.0-dev libmatio-dev libopenslide-dev libcfitsio3-dev \
    libgsf-1-dev fftw3-dev liborc-0.4-dev librsvg2-dev \
    gcc git libc6-dev make && \

  # Build libvips
  cd /tmp && \
  curl -OL https://github.com/jcupitt/libvips/releases/download/v${LIBVIPS_VERSION}/vips-${LIBVIPS_VERSION}.tar.gz && \
  tar zvxf vips-${LIBVIPS_VERSION}.tar.gz && \
  cd /tmp/vips-${LIBVIPS_VERSION} && \
  ./configure --enable-debug=no --without-python $1 && \
  make && \
  make install && \
  ldconfig  && \

  # Build Go, gcc (cgo)
  curl -L -o golang.tar.gz https://golang.org/dl/go${GOLANG_VERSION}.linux-amd64.tar.gz && \
  tar -C /usr/local -xzf golang.tar.gz && \
  rm golang.tar.gz && \
  mkdir -p "${GOPATH}/src" "${GOPATH}/bin" && \
  chmod -R 777 "${GOPATH}" && \

  # Clean up
  apt-get remove -y curl automake build-essential && \
  apt-get autoremove -y && \
  apt-get autoclean && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR $GOPATH

# Fetch the latest version of the package
RUN go get -u golang.org/x/net/context
RUN go get -u github.com/h2non/imaginary

# Server port to listen
ENV PORT 9000

# Expose the server TCP port
EXPOSE 9000

# Run the outyet command by default when the container starts.
ENTRYPOINT ["/go/bin/imaginary"]
