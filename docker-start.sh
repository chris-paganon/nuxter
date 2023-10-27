docker compose \
  -f docker-compose.yml \
  -f vue-ai/umami-compose.yml \
  -f vue-ai/apps-compose.yml \
  -f vue-ai/db-compose.yml \
  up --force-recreate