#!/bin/sh
set -e

export LANG=en_US.UTF-8
cd Example

gem install cocoapods -v '0.32.1'
pod install
