docker network create vue-ai_caddy_network
docker compose up --force-recreate -d
docker compose -f vue-ai/vue-ai-compose.yml up --force-recreate -d