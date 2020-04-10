FROM alpine:3.10

ARG HUGO_VERSION=0.60.1

ENV HUGO_VERSION $HUGO_VERSION

# Install Git - required for Hugo GitInfo
RUN apk --no-cache add git

# Download and install Hugo
RUN mkdir /usr/local/hugo \
  && wget -O /tmp/hugo.tar.gz https://github.com/spf13/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_linux-64bit.tar.gz \
  && tar xzf /tmp/hugo.tar.gz -C /usr/local/hugo/ \
  && ln -s /usr/local/hugo/hugo /usr/local/bin/hugo \
  && rm /tmp/hugo.tar.gz

CMD ["hugo", "version"]
