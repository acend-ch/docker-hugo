FROM ubuntu:18.04

ARG HUGO_VERSION=0.70.0

ENV HUGO_VERSION $HUGO_VERSION

# Install Git - required for Hugo GitInfo
#RUN apk --no-cache add git nodejs npm libstdc++

RUN apt update && apt install -y wget git curl

RUN curl -sL https://deb.nodesource.com/setup_14.x | sh
RUN apt install -y nodejs


# Download and install Hugo
RUN mkdir /usr/local/hugo \
  && wget -O /tmp/hugo.tar.gz https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_Linux-64bit.tar.gz \
  && tar xzf /tmp/hugo.tar.gz -C /usr/local/hugo/ \
  && ln -s /usr/local/hugo/hugo /usr/local/bin/hugo \
  && rm /tmp/hugo.tar.gz
RUN npm install -g autoprefixer postcss-cli

CMD ["hugo", "version"]
