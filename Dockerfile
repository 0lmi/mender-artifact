FROM golang:1.18 as builder
RUN apt-get update && apt-get install -qyy liblzma-dev libssl-dev
RUN mkdir -p /go/src/github.com/mendersoftware/mender-artifact
WORKDIR /go/src/github.com/mendersoftware/mender-artifact
ADD ./ .
RUN make build
RUN make install
ENTRYPOINT [ "/go/bin/mender-artifact" ]
