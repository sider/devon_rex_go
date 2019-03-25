FROM quay.io/actcat/devon_rex_base:1.2.1

ENV GO_VERSION 1.8

# Install go from binary distributions. https://golang.org/dl/
RUN curl -sSL https://storage.googleapis.com/golang/go${GO_VERSION}.linux-amd64.tar.gz \
  | tar -C /usr/local -xz

RUN add-apt-repository ppa:masterminds/glide \
  && apt-get update \
  && apt-get install glide \
  && rm -rf /var/lib/apt/lists/*

ENV GOROOT=/usr/local/go \
    GOPATH=/root/go
ENV PATH $PATH:$GOROOT/bin:$GOPATH/bin
