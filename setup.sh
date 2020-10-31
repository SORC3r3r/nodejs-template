#!/usr/bin/env bash

echo "- Removing node_modules and dist folders"
echo "- Install and build service"
find . -name "node_modules" -exec rm -rf '{}' +
find . -name "dist" -exec rm -rf '{}' +
npm install
npm run build
npm outdated
echo "Service installed successfully."
echo "Run 'npm start' to start the application!"
