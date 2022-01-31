#!/bin/bash
mv "$1" "$(mktemp --dry-run XXXXXXXX.eml)"
