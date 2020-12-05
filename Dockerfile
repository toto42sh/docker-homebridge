FROM node:12.18.3-alpine

ENV HOMEBRIDGE_VERSION="1.2." \
    HOMEBRIDGE_HUE_VERSION="0.12.16" \
    HOMEBRIDGE_HTTP_TEMPERATURE_SENSOR_VERSION="1.0.9" \
    HOMEBRIDGE_PHILIPS_HUE_SYNC_VERSION="0.7.4" \
    HOMEBRIDGE_PIHOLE_VERSION="0.3.1" \
    HOMEBRIDGE_RPI_VERSION="1.2.1" \
    HOMEBRIDGE_SONOS_VERSION="0.4.0" \
    HOMEBRIDGE_WEATHER_VERSION="1.12.4"

ENV NPM_ARGS="--global --quiet"

# https://github.com/homebridge/homebridge
RUN npm install ${NPM_ARGS} \
        --unsafe-perm \
        homebridge@${HOMEBRIDGE_VERSION}

# https://github.com/ebaauw/homebridge-hue
RUN npm install ${NPM_ARGS} \
        homebridge-hue@${HOMEBRIDGE_HUE_VERSION}

# https://github.com/Supereg/homebridge-http-temperature-sensor
RUN npm install ${NPM_ARGS} \
        homebridge-http-temperature-sensor@${HOMEBRIDGE_HTTP_TEMPERATURE_SENSOR_VERSION}

# https://github.com/lukasroegner/homebridge-philips-hue-sync-box
RUN npm install ${NPM_ARGS} \
        homebridge-philips-hue-sync-box@${HOMEBRIDGE_PHILIPS_HUE_SYNC_VERSION}

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
