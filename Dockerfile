# Build Stage
FROM --platform=linux/amd64 ubuntu:20.04 as builder

## Install build dependencies.
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y vim less man wget tar git gzip unzip make cmake software-properties-common curl
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y clang
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y libgl1-mesa-dev
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y ocl-icd-opencl-dev
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y xorg-dev

ADD . /gst
WORKDIR /gst/build
RUN cmake ..
RUN make -j8
