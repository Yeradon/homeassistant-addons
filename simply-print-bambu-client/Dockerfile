ARG BUILD_FROM
ARG BUILD_FROM_arm64
ARG BUILD_FROM_armv7
ARG BUILD_FROM_armhf
ARG BUILD_FROM_i386

FROM --platform=$BUILDPLATFORM $BUILD_FROM as base-amd64
FROM --platform=$BUILDPLATFORM $BUILD_FROM_arm64 as base-arm64
FROM --platform=$BUILDPLATFORM $BUILD_FROM_armv7 as base-armv7
FROM --platform=$BUILDPLATFORM $BUILD_FROM_armhf as base-armhf
FROM --platform=$BUILDPLATFORM $BUILD_FROM_i386 as base-i386

FROM base-${TARGETARCH} as final

# Add labels
LABEL \
    io.hass.name="Simply Print Bambu Lab Client" \
    io.hass.description="A Home Assistant addon for the Simply Print Bambu Lab client" \
    io.hass.version="1.0.0" \
    io.hass.type="addon" \
    io.hass.arch="armhf|aarch64|i386|amd64|armv7"

# Install required packages
RUN \
    apk add --no-cache \
        python3 \
        py3-pip

# Install Simply Print Bambu Lab client
RUN pip3 install simply-print-bambu-client

# Create directory for configuration
RUN mkdir -p /data

# Copy run script
COPY run.sh /
RUN chmod a+x /run.sh

# Expose the port
EXPOSE 8000

# Start the application
CMD [ "/run.sh" ] 