#!/bin/sh
# Regenerate TaylorKangBeckResume.pdf from resume_main.tex.
# Builds in a temp dir so .aux/.log/.out files stay out of the repo.
set -e

cd "$(dirname "$0")"
BUILD_DIR=/tmp/resbuild
mkdir -p "$BUILD_DIR"

xelatex -interaction=nonstopmode -halt-on-error -output-directory="$BUILD_DIR" resume_main.tex > "$BUILD_DIR/build.log" \
  || { tail -20 "$BUILD_DIR/build.log"; echo "Build failed; full log: $BUILD_DIR/build.log"; exit 1; }

cp "$BUILD_DIR/resume_main.pdf" TaylorKangBeckResume.pdf
echo "Wrote TaylorKangBeckResume.pdf"
