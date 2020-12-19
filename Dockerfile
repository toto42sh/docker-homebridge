FROM node:14-alpine

ENV NPM_ARGS="--global --quiet"

# https://github.com/homebridge/homebridge
# https://www.npmjs.com/package/homebridge
ENV HOMEBRIDGE_VERSION="1.1.7"

RUN npm install ${NPM_ARGS} \
        --unsafe-perm \
        homebridge@${HOMEBRIDGE_VERSION}

# https://github.com/ebaauw/homebridge-hue
# https://www.npmjs.com/package/homebridge-hue
ARG HOMEBRIDGE_HUE_VERSION="0.12.12"

RUN npm install ${NPM_ARGS} \
        homebridge-hue@${HOMEBRIDGE_HUE_VERSION}

# https://github.com/Supereg/homebridge-http-temperature-sensor
# https://www.npmjs.com/package/homebridge-http-temperature-sensor
ARG HOMEBRIDGE_HTTP_TEMPERATURE_SENSOR_VERSION="1.0.9"

RUN npm install ${NPM_ARGS} \
        homebridge-http-temperature-sensor@${HOMEBRIDGE_HTTP_TEMPERATURE_SENSOR_VERSION}

# https://github.com/lukasroegner/homebridge-philips-hue-sync-box
# https://www.npmjs.com/package/homebridge-philips-hue-sync-box
ARG HOMEBRIDGE_PHILIPS_HUE_SYNC_VERSION="0.7.4"

RUN npm install ${NPM_ARGS} \
        homebridge-philips-hue-sync-box@${HOMEBRIDGE_PHILIPS_HUE_SYNC_VERSION}

# https://github.com/arendruni/homebridge-pihole
# https://www.npmjs.com/package/homebridge-pihole
ARG HOMEBRIDGE_PIHOLE_VERSION="0.3.1"

RUN npm install ${NPM_ARGS} \
        homebridge-pihole@${HOMEBRIDGE_PIHOLE_VERSION}

# https://github.com/ebaauw/homebridge-rpi
# https://www.npmjs.com/package/homebridge-rpi
ARG HOMEBRIDGE_RPI_VERSION="1.2.4"

RUN npm install ${NPM_ARGS} \
        homebridge-rpi@${HOMEBRIDGE_RPI_VERSION}

# https://github.com/nfarina/homebridge-sonos
# https://www.npmjs.com/package/homebridge-sonos
ARG HOMEBRIDGE_SONOS_VERSION="0.4.0"

RUN npm install ${NPM_ARGS} \
        homebridge-sonos@${HOMEBRIDGE_SONOS_VERSION}

# https://github.com/werthdavid/homebridge-weather
# https://www.npmjs.com/package/homebridge-weather
ARG HOMEBRIDGE_WEATHER_VERSION="1.12.4"

RUN npm install ${NPM_ARGS} \
        homebridge-weather@${HOMEBRIDGE_WEATHER_VERSION}

WORKDIR /homebridge

VOLUME /homebridge

ENTRYPOINT [ "homebridge" ]

CMD [ "--color", "--user-storage-path", "/homebridge" ]
# EOF
