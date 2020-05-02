FROM node:12

ENV DEBIAN_FRONTEND="noninteractive"

ENV HOMEBRIDGE_VERSION="1.0.4" \
    HOMEBRIDGE_CONFIG_VERSION="4.17.1" \
    HOMEBRIDGE_HUE_VERSION="0.11.64" \
    HOMEBRIDGE_HUE_SYNC_VERSION="0.3.0" \
    HOMEBRIDGE_PIHOLE_VERSION="0.2.0" \
    HOMEBRIDGE_RPI_VERSION="1.0.4" \
    HOMEBRIDGE_SONOS_VERSION="0.3.1" \
    HOMEBRIDGE_WEATHER_VERSION="1.12.2"

ENV NPM_ARGS="--global --quiet"

# https://github.com/homebridge/homebridge
RUN npm install ${NPM_ARGS} \
        --unsafe-perm \
        homebridge@${HOMEBRIDGE_VERSION}

# https://github.com/ebaauw/homebridge-hue
RUN npm install ${NPM_ARGS} \
        homebridge-hue@${HOMEBRIDGE_HUE_VERSION}

# https://github.com/lukasroegner/homebridge-philips-hue-sync-box
RUN npm install ${NPM_ARGS} \
        homebridge-philips-hue-sync-box@${HOMEBRIDGE_HUE_SYNC_VERSION}

# https://github.com/arendruni/homebridge-pihole
RUN npm install ${NPM_ARGS} \
        homebridge-pihole@${HOMEBRIDGE_PIHOLE_VERSION}

# https://github.com/ebaauw/homebridge-rpi
RUN npm install ${NPM_ARGS} \
        homebridge-rpi@${HOMEBRIDGE_RPI_VERSION}

# https://github.com/nfarina/homebridge-sonos
RUN npm install ${NPM_ARGS} \
        homebridge-sonos@${HOMEBRIDGE_SONOS_VERSION}

# https://github.com/werthdavid/homebridge-weather
RUN npm install ${NPM_ARGS} \
        homebridge-weather@${HOMEBRIDGE_WEATHER_VERSION}

WORKDIR /homebridge

VOLUME /homebridge

ENTRYPOINT [ "homebridge" ]

CMD [ "--color", "--user-storage-path", "/homebridge" ]
# EOF
