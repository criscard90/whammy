#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"
faust -o /tmp/whammy_v1.cpp whammy_v1.dsp
printf '\nGenerated: /tmp/whammy_v1.cpp\n'
