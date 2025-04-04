#!/bin/sh

# Setup the application
./bin/setup

echo 'Setup complete, starting server...'

# Start the Rails server
./bin/server
