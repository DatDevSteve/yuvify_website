#!/bin/bash

git clone https://github.com/flutter/flutter.git --branch stable --depth 1

export PATH="$PATH:`pwd`/flutter/bin"

flutter precache
flutter config --enable-web
flutter pub get
flutter build web --release