#!/bin/sh

# Setup the application
./bin/setup

echo 'Setup complete, starting Rails server...'

# Start the Rails server in the background
./bin/server &

# Wait for Rails server to be fully up (using the dynamic port)
echo "Waiting for Rails server to be up on port ${PORT:-5000}..."
until curl --silent --head http://localhost:${PORT:-5000} | grep "200 OK" > /dev/null; do
    echo "Waiting for Rails server to be ready..."
    sleep 1
done

echo 'Rails server is up, running CSS build ...'
yarn build:css

echo 'Loading vacabularies ...'
rake rdt:add_vocabularies

wait