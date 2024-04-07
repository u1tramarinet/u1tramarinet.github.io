#!/bin/sh

flutter clean
flutter pub get
flutter gen-l10n
flutter build web --web-renderer html --release