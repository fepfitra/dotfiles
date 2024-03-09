#!/bin/sh

cat ./config.base "./config.$(uname -n)" > ./config
