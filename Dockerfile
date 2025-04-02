FROM ubuntu:latest

WORKDIR /root/whitelabel-marketplace

RUN apt update && apt install -y git curl vim \
    tar gpg gcc imagemagick \
    make zlib1g zlib1g-dev libffi-dev libyaml-dev

RUN git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.15.0 && \
    export ASDF_DIR=$HOME/.asdf && \
    . $HOME/.asdf/asdf.sh 

ENV PATH="$PATH:/root/.asdf/bin"

COPY . .

# Set ASDF environment variables
ENV ASDF_DIR=/root/.asdf
ENV PATH="$ASDF_DIR/bin:$ASDF_DIR/shims:$PATH"

RUN asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby.git
RUN asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
RUN asdf plugin-add yarn && asdf install yarn latest
RUN asdf install

RUN chmod +x bin/setup

ENTRYPOINT ["tail", "-f", "/dev/null"]