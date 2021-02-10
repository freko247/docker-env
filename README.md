# docker-env
Manage your development environment(s) in a docker container

## INSTALL

Run this command to install docker-env to `~/.docker-env`. Your `.zshrc` will be updated with a line that sources `~/.docker-env/.docker-envrc`.
```bash
curl --output docker-env-setup.sh -k -L https://raw.githubusercontent.com/freko247/docker-env/master/setup.sh && chmod 755 docker-env-setup.sh && ./docker-env-setup.sh && rm docker-env-setup.sh
```

Restart your terminal emulator or reload your profile to make the `docker-env-build` and other command available.

## BUILD

```bash
docker-env-build <environment_name>
```

You need to have a `requirements.txt` file in your current working directory. This file will be used when installing Python dependencies.

### Overrides

This is a key feature with docker-env. A list of commands can be specified in a file named `.docker-env-overrides` any command in this list will be overridden and used from inside the container.

The structure of the file should be one command per line, no arguments are allowed.

## SET ENVIRONMENT

```bash
docker-env-set <environment_name>
```

This sets/activates the specified environment and activates the override of the commands set in the `.docker-env-overrides` file.
