FROM python:3.6-buster
LABEL maintainer="Kitware, Inc. <kitware@kitware.com>"

# Set environment to support Unicode: http://click.pocoo.org/5/python3/#python-3-surrogate-handling
ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

# Install NodeJS
RUN \
  curl -sL https://deb.nodesource.com/setup_12.x | bash - && \
  apt-get install --assume-yes nodejs && \
  apt-get clean && \
  rm --recursive --force /var/lib/apt/lists/*

COPY . /girder/

# TODO: install as editable?
# TODO: install some plugins?
RUN pip install --no-cache-dir /girder

RUN \
  girder build && \
  rm --recursive --force \
    /root/.npm \
    /usr/local/lib/python*/site-packages/girder/web_client/node_modules

# Add a config file, to bind the server to all network interfaces inside the container
RUN \
  mkdir $HOME/.girder && \
  echo '[global]\nserver.socket_host = "0.0.0.0"\n' > $HOME/.girder/girder.cfg

EXPOSE 8080
WORKDIR /girder
CMD ["girder", "serve"]
