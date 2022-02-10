# DEPLOY

Experimenting with strategies with building and deploying rails app as container image via private registry

# Environment

## Setup
```bash
scripts/clone_repositories.sh
```

## Run development

```bash
scripts/development_up.sh
```

## Build base

```bash
scripts/base_build.sh --no-cache
BASE_TAG=latest make base_tag
```

## Publish base

```bash
BASE_TAG=1.x make base_tag
BASE_TAG=1.x make base_push
```

## Build

```bash
scripts/production_build.sh --build-arg BASE_TAG=latest --no-cache
BUILD_TAG=latest make build_tag
```

## Publish build

```bash
BUILD_TAG=1.x make build_tag
BUILD_TAG=1.x make build_push
```

## Run production

```bash
BUILD_TAG=latest make build_tag
BUILD_TAG=latest scripts/production_up.sh
```

# References

## Docker
- https://stackoverflow.com/questions/32230577/how-do-i-define-the-name-of-image-built-with-docker-compose
- https://docs.docker.com/compose/environment-variables/
- https://faun.pub/set-current-host-user-for-docker-container-4e521cef9ffc
- https://github.com/firewalld/firewalld/issues/461
- https://docs.docker.com/network/iptables/

## Bash
- https://stackoverflow.com/questions/35385962/arrays-in-a-posix-compliant-shell

## Rails
- http://blog.siami.fr/diving-in-rails-the-request-handling
- https://coolrequest.dev/2021/12/13/docker_image_rails_part2.html
- https://stackoverflow.com/questions/3181746/what-is-the-replacement-for-actioncontrollerbase-relative-url-root
- https://apidock.com/rails/Rails/groups/class
- https://ieftimov.com/post/docker-compose-stray-pids-rails-beyond/

## Bundle

- https://stackoverflow.com/questions/35429837/docker-compose-port-mapping
- https://medium.com/magnetis-backstage/how-to-cache-bundle-install-with-docker-7bed453a5800
- https://stackoverflow.com/questions/62070585/how-to-install-new-gems-in-a-rails-docker-image-without-rebuilding-it
- https://dev.to/k_penguin_sato/cache-rails-gems-using-docker-compose-3o3f
- https://github.com/sass/sassc-ruby/issues/189
- https://dev.to/kolide/how-to-migrate-a-rails-6-app-from-sass-rails-to-cssbundling-rails-4l41
