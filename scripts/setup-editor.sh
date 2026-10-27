#!/usr/bin/env bash
set -euo pipefail
echo "Checking editing prerequisites..."
for tool in node npm git python3; do command -v "$tool" || true; done
if ! command -v ffmpeg >/dev/null 2>&1; then
  sudo apt-get update
  sudo apt-get install -y ffmpeg
fi
ffmpeg -version | head -1
echo "Installing local Whisper (Python package)..."
python3 -m venv .venv
. .venv/bin/activate
python -m pip install --upgrade pip
python -m pip install openai-whisper
python -c 'import whisper; print("Whisper import OK")'
echo "HyperFrames is not installed automatically. Review its upstream README before running third-party setup."
echo "Setup complete. Review README-cloud-editor.md."
