docker network create vue-ai_production_app_caddy
docker network create vue-ai_staging_app_caddy
docker network create vue-ai_production_db_caddy
docker network create vue-ai_staging_db_caddy
docker network create vue-ai_umami_caddy

docker compose up --force-recreate -d
docker compose -f vue-ai/vue-ai-compose.yml up --force-recreate -d