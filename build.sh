#!/bin/sh
# Regenerate resume PDFs from their .tex sources.
# Builds in a temp dir so .aux/.log/.out files stay out of the repo.
set -e

cd "$(dirname "$0")"
BUILD_DIR=/tmp/resbuild
mkdir -p "$BUILD_DIR"

build() {
  xelatex -interaction=nonstopmode -halt-on-error -output-directory="$BUILD_DIR" "$1.tex" > "$BUILD_DIR/build.log" \
    || { tail -20 "$BUILD_DIR/build.log"; echo "Build of $1 failed; full log: $BUILD_DIR/build.log"; exit 1; }
  cp "$BUILD_DIR/$1.pdf" "$2"
  echo "Wrote $2"
}

build resume_main TaylorKangBeckResume.pdf
build resume_ai_safety TaylorKangBeckResume_AISafety.pdf
