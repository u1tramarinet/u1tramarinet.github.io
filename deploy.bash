#!/bin/bash

rm -rf docs
flutter clean
flutter build web --release
cp -r build/web docs