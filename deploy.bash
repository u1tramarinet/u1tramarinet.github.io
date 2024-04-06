#!/bin/bash

rm -rf docs
flutter build web
cp -r build/web docs