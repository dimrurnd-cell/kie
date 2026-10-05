#!/bin/bash
# Ставит VelsVisual CLI (https://github.com/nick-vels/VelsVisual) в начале каждой сессии.
set -uo pipefail

if ! command -v velsvisual >/dev/null 2>&1; then
  npm install -g velsvisual >/dev/null 2>&1 \
    || npm install -g github:nick-vels/VelsVisual >/dev/null 2>&1 \
    || { echo "velsvisual: установка не удалась" >&2; exit 0; }
fi

if [ -z "${KIE_API_KEY:-}" ] && [ ! -f "$HOME/.velsvisual/config.json" ]; then
  echo "velsvisual установлен, но KIE_API_KEY не задан — добавьте его в переменные окружения." >&2
fi
exit 0
