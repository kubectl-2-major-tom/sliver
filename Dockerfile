FROM ubuntu:latest

WORKDIR /root/
SHELL ["/bin/bash", "-c"]
ENV SLIVER_GPG_KEY_ID="4449039C"
ENV SLIVER_SERVER="sliver-server_linux"
ENV SLIVER_CLIENT="sliver-client_linux"
ENV SLIVER_ROOT_DIR="/var/run/sliver"

RUN apt update &&\
    DEBIAN_FRONTEND=noninteractive apt install -yqq \
        gpg \
        curl \
        build-essential \
        git \
        mingw-w64 \
        binutils-mingw-w64 \
        g++-mingw-w64

RUN echo $'-----BEGIN PGP PUBLIC KEY BLOCK-----\n\
\n\
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\n\
=lxj2\n\
-----END PGP PUBLIC KEY BLOCK-----' | gpg --import

RUN for URL in $(curl -s "https://api.github.com/repos/BishopFox/sliver/releases/latest" | awk -F '"' '/browser_download_url/{print $4}' | grep '_linux' ); do curl --silent -L "$URL" --output "$(basename "$URL")"; done

# Signature verification
RUN gpg --default-key "$SLIVER_GPG_KEY_ID" --verify "/root/$SLIVER_SERVER.sig" "/root/$SLIVER_SERVER" && \
    gpg --default-key "$SLIVER_GPG_KEY_ID" --verify "/root/$SLIVER_CLIENT.sig" "/root/$SLIVER_CLIENT"

RUN mv "/root/$SLIVER_SERVER" /opt/sliver-server && \
    chmod 755 /opt/sliver-server && \
    /opt/sliver-server unpack --force

RUN chmod 755 "/root/$SLIVER_CLIENT" && \
    cp -vv "/root/$SLIVER_CLIENT" /usr/local/bin/sliver-client && \
    ln -sf /usr/local/bin/sliver-client /usr/local/bin/sliver && \
    chmod 755 /usr/local/bin/sliver

# Generating operator configs ...
RUN mkdir -p "${SLIVER_ROOT_DIR}/configs" && \
    /opt/sliver-server operator --name root --lhost localhost --save "${SLIVER_ROOT_DIR}/configs" && \
    mkdir /root/.sliver-client && \
    chown -R root:root /root/.sliver-client/

ENTRYPOINT [ "/opt/sliver-server" ]
