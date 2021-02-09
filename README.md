# docker-env
Manage your development environment(s) in a docker container

## INSTALL

Run this command to install docker-env to `~/.docker-env`. Your `.zshrc` will be updated with a line that sources `~/.docker-env/.docker-envrc`.
```bash
curl --output docker-env-setup.sh -k -L https://raw.githubusercontent.com/freko247/docker-env/master/setup.sh && chmod 755 docker-env-setup.sh && ./docker-env-setup.sh && rm docker-env-setup.sh
```

## BUILD
```bash
docker-env-build
```

## USE

```docker-env python --version``` will get the python version on the container

```black``` will run the Python code formatter from the container on the current working directory.
