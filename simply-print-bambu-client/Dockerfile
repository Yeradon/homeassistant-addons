ARG BUILD_FROM
# renovate: datasource=pypi depName=simplyprint-bambu-lab
FROM $BUILD_FROM

# Add labels
LABEL \
    io.hass.name="Simply Print Bambu Lab Client" \
    io.hass.description="Simply Print Bambu Lab Client for Home Assistant" \
    io.hass.version="1.0.0"

# Install requirements for add-on and build dependencies
RUN \
    apk add --no-cache \
        python3 \
        py3-pip \
        gcc \
        g++ \
        make \
        musl-dev \
        linux-headers \
        python3-dev \
        libffi \
        pkgconf

# Install Simply Print Bambu Lab client
RUN pip3 install simplyprint-bambu-lab==1.0.0b68

# Verify the package is installed
RUN python3 -c "import simplyprint_bambu_lab; print('Package installed successfully')"

# Remove build dependencies to reduce image size
RUN apk del gcc g++ make musl-dev linux-headers python3-dev libffi pkgconf

# Create directory for configuration
RUN mkdir -p /root/.config/SimplyPrint

# Copy run script
COPY run.sh /
RUN chmod a+x /run.sh

# Expose port
EXPOSE 8080

# Start the add-on
CMD [ "/run.sh" ] 