#!/usr/bin/env bash
# escreve “Lorem ipsum” continuamente em um arquivo .log para demonstrar o tail

LOG_FILE="lorem.log"

# Se o arquivo não existir, cria-o
if [[ ! -f "$LOG_FILE" ]]; then
  touch "$LOG_FILE"
fi

LOREM_TEXT="Lorem ipsum dolor sit amet, consectetur adipiscing elit."

while true; do
  echo "$LOREM_TEXT" >> "$LOG_FILE"
  sleep 2
done
