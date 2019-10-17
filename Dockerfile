FROM thomasweise/docker-texlive-full

RUN apt-get -y update && \
    apt-get -yq install biber && \
    apt-get -yq install make && \
    apt-get autoclean && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /home