#!/bin/bash

FLUTTER_DIR="$HOME/.flutter"
PUB_CACHE_DIR="$HOME/.pub-cache"

if [ ! -d "$FLUTTER_DIR" ]; then
  echo "🚀 Installing Flutter SDK..."
  git clone https://github.com/flutter/flutter.git --branch stable --depth 1 $FLUTTER_DIR
else
  echo "⚡ Using cached Flutter SDK"
fi

export PATH="$PATH:$FLUTTER_DIR/bin"
export PUB_CACHE=$PUB_CACHE_DIR

flutter --version
flutter precache
flutter config --enable-web
flutter pub get
flutter build web --release