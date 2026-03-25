#!/bin/bash

# Define cache directories
FLUTTER_DIR=".vercel/flutter"
PUB_CACHE_DIR=".vercel/pub-cache"

# Install Flutter only if not cached
if [ ! -d "$FLUTTER_DIR" ]; then
  echo "🚀 Installing Flutter SDK..."
  git clone https://github.com/flutter/flutter.git --branch stable --depth 1 $FLUTTER_DIR
else
  echo "⚡ Using cached Flutter SDK"
fi

# Set PATH
export PATH="$PATH:`pwd`/$FLUTTER_DIR/bin"

# Cache pub dependencies
export PUB_CACHE=$PUB_CACHE_DIR

# Debug (optional but useful)
flutter --version

# Setup
flutter precache
flutter config --enable-web

# Dependencies
flutter pub get

# Build
flutter build web --release