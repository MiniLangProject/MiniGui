#!/usr/bin/env bash
# SPDX-License-Identifier: Apache-2.0
set -euo pipefail
root="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$root"
compiler="../MiniLangCompilerPy/mlc_win64.py"
if [[ $# -gt 0 ]]; then compiler="$1"; fi
out="$root/tests/tmp/cross-platform"
mkdir -p "$out"
compile() {
  if [[ "$compiler" == *.py ]]; then python3 "$compiler" "$@"; else "$compiler" "$@"; fi
}
bash native/linux/build.sh
cp build/native/linux-x64/libminigui_gtk.so "$out/"
cc -std=c11 -O1 -g tests/minigui/linux_backend_test.c -o "$out/linux-backend-test" \
  $(pkg-config --cflags --libs gtk+-3.0 gtksourceview-4 webkit2gtk-4.1 ayatana-appindicator3-0.1)
GDK_BACKEND=x11 LIBGL_ALWAYS_SOFTWARE=1 xvfb-run -a "$out/linux-backend-test"
compile tests/minigui/cross_platform_smoke.ml "$out/cross-smoke" --target linux-x64 -I . -I ../MiniLangCompilerPy
GDK_BACKEND=x11 LIBGL_ALWAYS_SOFTWARE=1 xvfb-run -a "$out/cross-smoke"
compile tools/minigui.ml "$out/minigui" --target linux-x64 -I . -I ../MiniLangCompilerPy
for example in hello-gui customer-form control-gallery advanced-controls; do
  "$out/minigui" build "examples/$example/app.mson" --target linux-x64 \
    --compiler "$compiler" --library-dir . --output "$out/$example"
  set +e
  GDK_BACKEND=x11 LIBGL_ALWAYS_SOFTWARE=1 timeout 3s xvfb-run -a "$out/$example" > "$out/$example.log" 2>&1
  status=$?
  set -e
  if [[ $status != 124 ]] || grep -Eq 'Error occured|CRITICAL|Segmentation fault' "$out/$example.log"; then
    cat "$out/$example.log"
    echo "FAIL: $example startup (status $status)" >&2
    exit 1
  fi
  echo "PASS: $example native Linux build and startup"
done
echo "MiniGui Linux tests OK"
