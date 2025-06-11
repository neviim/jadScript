#!/bin/bash
# Simple script to send a message to a Discord channel using a bot token
# Usage: ./send_discord_message.sh "Your message here"

set -euo pipefail

ENV_FILE=".env"
if [ ! -f "$ENV_FILE" ]; then
  echo "File $ENV_FILE not found." >&2
  exit 1
fi

# Load variables from .env
set -a
source "$ENV_FILE"
set +a

if [ -z "${DISCORD_TOKEN:-}" ] || [ -z "${DISCORD_CHANNEL_ID:-}" ]; then
  echo "DISCORD_TOKEN or DISCORD_CHANNEL_ID not set in $ENV_FILE" >&2
  exit 1
fi

MESSAGE="$*"
if [ -z "$MESSAGE" ]; then
  echo "Usage: $0 MESSAGE" >&2
  exit 1
fi

JSON=$(jq -n --arg content "$MESSAGE" '{content: $content}')

curl -s -X POST \
  "https://discord.com/api/v10/channels/$DISCORD_CHANNEL_ID/messages" \
  -H "Authorization: Bot $DISCORD_TOKEN" \
  -H "Content-Type: application/json" \
  -d "$JSON" | jq '.'
