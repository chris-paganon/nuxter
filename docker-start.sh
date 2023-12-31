docker network create vue-ai-tools_production_caddy_nuxt_app
docker network create vue-ai-tools_staging_caddy_nuxt_app
docker network create vue-ai-tools_production_caddy_pb_db
docker network create vue-ai-tools_staging_caddy_pb_db
docker network create vue-ai-tools_umami_caddy

docker compose up --force-recreate -d
cd ./vue-ai-tools/

docker compose -f .\nuxter-config\nuxter-base-compose.yml --env-file .\nuxter-config\production.env -p vue-ai-tools-production --project-directory ./ up --build --remove-orphans -d
docker compose -f .\nuxter-config\nuxter-base-compose.yml --env-file .\nuxter-config\staging.env -p vue-ai-tools-staging --project-directory ./ up --build --remove-orphans -d

cd ../../

# TODO: Add a new file for deployments
# To deploy: use docker compose --p "project-name-blue" up & docker compose --p "project-name-green" up (or --project-name) to make a blue-green deployment. Maybe a similar simple solution here: https://www.tines.com/blog/simple-zero-downtime-deploys-with-nginx-and-docker-compose
# Still need to figure out how Caddy interacts with that though.

# Alternatively: use docker swarm or Traefik apparently has features that may integrate better with docker (aka labels)

# Example command to restart a single container for deployment:
# docker compose -f vue-ai-tools/vue-ai-tools-staging-compose.yml up --build --no-deps -d nuxt-app

# Example to deploy a new version of the app with zero downtime (untested):
# docker rename vue-ai-tools-production-nuxt-app vue-ai-tools-production-nuxt-app-green
# docker compose -f base/nuxt-app-compose.yml -p vue-ai-tools-production-blue --env-file vue-ai-tools/production.env up
# docker compose -f vue-ai-tools/vue-ai-tools-staging-compose.yml up --build --no-deps -d nuxt-app
# docker rename vue-ai-tools-production-nuxt-app vue-ai-tools-production-nuxt-app-blue
# docker rename vue-ai-tools-production-nuxt-app-green vue-ai-tools-production-nuxt-app
# docker compose down vue-ai-tools-production-blue

# Alternatively, we can run this (untested):
# docker compose -f base/nuxt-app-compose.yml -p vue-ai-tools-production-blue --env-file vue-ai-tools/production.env up
# To make it work, this line "container_name: ${APP_NAME}-${APP_ENV}-nuxt-app" in nuxt-app-compose.yml needs a way to set a new name for the temporary container, otherwise it will fail because the container already exists. This is why we rename containers above.
# Then we would run blue-green deployment similar to above.