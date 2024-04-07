#!/bin/sh

rm -rf docs
flutter clean
flutter build web
cp -r build/web docs