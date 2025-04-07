#!/bin/sh

# Clear Rails cache
bin/rails tmp:clear

# Setup the application
./bin/setup

echo 'Setup complete, starting server...'

# Start the Rails server
./bin/server
