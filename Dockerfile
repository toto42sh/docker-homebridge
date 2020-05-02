FROM node:12

ENV DEBIAN_FRONTEND="noninteractive"

ENV HOMEBRIDGE_VERSION="1.0.4" \
    HOMEBRIDBE_CONFIG_VERSION="4.17.1" \
    HOMEBRIDBE_HUE_VERSION="0.11.64" \
    HOMEBRIDBE_HUE_SYNC_VERSION="0.3.0" \
    HOMEBRIDBE_PIHOLE_VERSION="0.2.0" \
    HOMEBRIDBE_RPI_VERSION="1.0.4" \
    HOMEBRIDBE_SONOS_VERSION="0.3.1"

ENV NPM_ARGS="--global --quiet"

# https://github.com/homebridge/homebridge
RUN npm install \
        ${NPM_ARGS} \
        --unsafe-perm \
        homebridge@${HOMEBRIDGE_VERSION}

# https://github.com/oznu/homebridge-config-ui-x
# RUN npm install \
#         ${NPM_ARGS} \
#         --unsafe-perm \
#         homebridge-config-ui-x@${HOMEBRIDGE_CONFIG_VERSION}

# https://github.com/ebaauw/homebridge-hue
RUN npm install \
        ${NPM_ARGS} \
        homebridge-hue@${HOMEBRIDBE_HUE_VERSION}

# https://github.com/lukasroegner/homebridge-philips-hue-sync-box
RUN npm install \
        ${NPM_ARGS} \
        homebridge-philips-hue-sync-box@${HOMEBRIDBE_HUE_SYNC_VERSION}

# https://github.com/arendruni/homebridge-pihole
RUN npm install \
        ${NPM_ARGS} \
        homebridge-pihole@${HOMEBRIDBE_PIHOLE_VERSION}

# https://github.com/ebaauw/homebridge-rpi
RUN npm install \
        ${NPM_ARGS} \
        homebridge-rpi@${HOMEBRIDBE_RPI_VERSION}

# https://github.com/nfarina/homebridge-sonos
# RUN npm install \
#         ${NPM_ARGS} \
#         homebridge-sonos@${HOMEBRIDBE_SONOS_VERSION}

WORKDIR /homebridge

VOLUME /homebridge

ENTRYPOINT [ "homebridge" ]

CMD [ "--color", "--user-storage-path", "/homebridge" ]
# EOF
