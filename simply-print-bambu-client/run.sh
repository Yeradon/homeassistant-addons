#!/usr/bin/with-contenv bashio

# Load bashio libraries
bashio::log.info "Starting Simply Print Bambu Lab client..."

# Check if Python is available
if ! command -v python3 &> /dev/null; then
    bashio::log.error "Python3 is not installed!"
    exit 1
fi

# Check if the module is installed
if ! python3 -c "import simplyprint_bambu_lab" &> /dev/null; then
    bashio::log.error "Simply Print Bambu Lab client is not installed!"
    exit 1
fi

# Start the Simply Print Bambu Lab client
bashio::log.info "Starting Simply Print Bambu Lab client..."
exec python3 -m simplyprint_bambu_lab 