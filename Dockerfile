FROM quay.io/actcat/devon_rex_base:1.3.3

ENV GO_VERSION 1.8

# Install go from binary distributions. https://golang.org/dl/
RUN curl -sSL https://storage.googleapis.com/golang/go${GO_VERSION}.linux-amd64.tar.gz \
  | tar -C /usr/local -xz

RUN add-apt-repository ppa:masterminds/glide \
  && apt-get update \
  && apt-get install glide \
  && rm -rf /var/lib/apt/lists/*

ENV GOROOT=/usr/local/go \
    GOPATH=$RUNNER_USER_HOME/go
ENV PATH $PATH:$GOROOT/bin:$GOPATH/bin

# Edit secure_path to include PATH required by Go
USER root
RUN sed -i -e '/secure_path/d' /etc/sudoers && \
    echo "Defaults secure_path=\"$GEM_HOME/bin:/usr/local/bin:/usr/bin:/bin:$GOROOT/bin:$GOPATH/bin\"" >> /etc/sudoers
