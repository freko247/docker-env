# docker-env
Manage your development environment(s) in a docker container

## INSTALL

Run this command to install docker-env to `~/.docker-env`. Your `.zshrc` will be updated with a line that sources `~/.docker-env/.docker-envrc`.
```bash
curl --output docker-env-setup.sh -k -L https://raw.githubusercontent.com/freko247/docker-env/master/setup.sh && chmod 755 docker-env-setup.sh && ./docker-env-setup.sh && rm docker-env-setup.sh
```

Restart your terminal emulator or reload your profile to make the `docker-env-build` and other command available.

## OVERRIDES

This is a key feature with docker-env. It is possible to override any local command, so that it is run from the container.

As an example it is possible to override the commands `ls`, `vim`, or `python` so that they run on the container instead of on the host.

A list of commands can be specified in a file named `.docker-env-overrides` any command in this list will be overridden and used from inside the container.

The structure of the file should be one command per line, no arguments are allowed.

Apply new overrides running the `docker-env-command`, see more information in the COMMANDS section.

The command `docker-env-add` can be used to add new overrides, see more information in the COMMANDS section 

## COMMANDS

### docker-env-build
Build a fresh environment or update an existing one

A `requirements.txt` file in your current working directory is required. This file will be used when installing Python dependencies.

Create a new environment using a repository name
```bash
docker-env-build
```

Specify an environment name
```bash
docker-env-build <environment_name>
```

### docker-env-set
Set/activate the specified environment and override the commands set in the `.docker-env-overrides` file.

Automatically use a repository name as environment name
```bash
docker-env-set
```

Specific environment name
```bash
docker-env-set <environment_name>
```

### docker-env-delete
Delete an environment

```bash
docker-env-delete <environment-name>
```

### docker-env-add
Add a requirement to the environment. This will add a new line to `requirements.txt` and rebuild the environment. If a second argument '--override' is given, then an override will also be created automatically.

Only add requirement
```bash
docker-env-add django
```

Add requirement and override the commands
```bash
docker-env-add black --override
```

