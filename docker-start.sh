docker network create vue-ai_production_app_caddy
docker network create vue-ai_staging_app_caddy
docker network create vue-ai_production_db_caddy
docker network create vue-ai_staging_db_caddy
docker network create vue-ai_umami_caddy

docker compose up --force-recreate -d
docker compose -f vue-ai/vue-ai-compose.yml up --build --remove-orphans

# TODO: Add a new file for deployments
# To deploy: use docker compose --p "project-name-blue" up & docker compose --p "project-name-green" up (or --project-name) to make a blue-green deployment. Maybe a similar simple solution here: https://www.tines.com/blog/simple-zero-downtime-deploys-with-nginx-and-docker-compose
# Still need to figure out how Caddy interacts with that though.

# Alternatively: use docker swarm or Traefik apparently has features that may integrate better with docker (aka labels)