#!/usr/bin/env bash
# SPDX-License-Identifier: Apache-2.0
set -euo pipefail
cd "$(dirname "$0")"
out="${1:-../../build/native/linux-x64}"
mkdir -p "$out"
cc -std=c11 -fPIC -shared -O2 -Wall -Wextra -Wno-unused-parameter \
  minigui_gtk.c -o "$out/libminigui_gtk.so" \
  $(pkg-config --cflags --libs gtk+-3.0 gtksourceview-4 webkit2gtk-4.1 ayatana-appindicator3-0.1) -lm
