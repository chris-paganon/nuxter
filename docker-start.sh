docker network create vue-tools-ai_production_caddy_nuxt_app
docker network create vue-tools-ai_staging_caddy_nuxt_app
docker network create vue-tools-ai_production_caddy_pb_db
docker network create vue-tools-ai_staging_caddy_pb_db
docker network create vue-tools-ai_umami_caddy

docker compose up --force-recreate -d
docker compose -f vue-tools-ai/vue-tools-ai-production-compose.yml up --build --remove-orphans -d
docker compose -f vue-tools-ai/vue-tools-ai-staging-compose.yml up --build --remove-orphans -d

# TODO: Add a new file for deployments
# To deploy: use docker compose --p "project-name-blue" up & docker compose --p "project-name-green" up (or --project-name) to make a blue-green deployment. Maybe a similar simple solution here: https://www.tines.com/blog/simple-zero-downtime-deploys-with-nginx-and-docker-compose
# Still need to figure out how Caddy interacts with that though.

# Alternatively: use docker swarm or Traefik apparently has features that may integrate better with docker (aka labels)