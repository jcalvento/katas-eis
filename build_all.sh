#!/usr/bin/env sh
set -e
bundle install
cd char_counter
bundle exec rake
cd ../tenis/
bundle exec rake