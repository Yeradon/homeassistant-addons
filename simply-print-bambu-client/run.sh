#!/usr/bin/with-contenv bashio
# Check if Python is available
if ! command -v python3 &> /dev/null; then
    bashio::log.error "Python3 is not installed!"
    exit 1
fi

# Create symlink from data directory to SimplyPrint config directory
bashio::log.info "Setting up configuration directory..."
ln -sf /data /root/.config/SimplyPrint

# Start the Simply Print Bambu Lab client
bashio::log.info "Starting Simply Print Bambu Lab client..."
exec simplyprint_bambu_lab