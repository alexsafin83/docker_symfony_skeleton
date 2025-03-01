# docker symfony starter kit
Starter kit to start a symfony project from scratch, using PHP and symfony framework with ready to use docker set up.\
The main goal is to provide a working development environment. This means, all the configuration and all the scripts
provided here, are not meant to be used in a productive environment (so far).

## 1. What you will get
- PHP 8.4.3 with/without xdebug
- apache web server
- Symfony framework (>=7.2.3)
- Symfony-cli

## 2. Requirements
Go for it, if you have a working bash or a Linux OS.
You must be able to execute .sh scripts. Also docker & docker-compose should be installed.

## 3. How and where to start
### Initialization
To initialize your project, you will use the script `init.sh`

```
$ ./init.sh
```

This will ask you for your git config (name, email) because the symfony cli needs it.\
Then it will 
- add entered data in docker-compose.dev.yaml and docker.compose.yaml (and create their backups)
- call `$ symfony local:new` in the corresponding container to create a new source code base
- move created source code into correct path

#### You shall ignore this success message (at the end the source code is on another path):
```
 [OK] Your project is now ready in /var/www/html/symfonytmp
```
### Other ways
Alternatively you can use composer to create your symfony based project.

#### Create a composer.json
The interactive way: call the init command from composer
```
$ ./composer.sh init
```
Or just do it manually by adding a composer.json file.

### Start/stop container
#### In development mode
```
$ docker compose -f ./docker/docker-compose.dev.yaml up -d
OR
$ docker compose -f ./docker/docker-compose.dev.yaml down
```
These options are changed in development mode:
- xdebug
- xdebug.mode
- display_errors
- log_errors
- memory_limit
- and some more (see in docker/php/config/php.dev.ini)

## 4. Urls

### Entry url (not final)
http://localhost:8080/

## 5. Production mode

### Configuration
Change value of 'serverName' in `docker/docker-compose.yaml` to your server name

### Start/stop container
```
$ docker compose -f ./docker/docker-compose.yaml up -d
OR
$ docker compose -f ./docker/docker-compose.yaml up
OR
$ docker compose -f ./docker/docker-compose.yaml down
```

## 6. FAQ

#### 6.1 What to do, if I want to get new updates from this template project into my repository?

First, add template's repo url: 
```
git remote add template git@github.com:alexsafin83/docker_symfony_starter_kit.git
```
Then fetch all:
```
git fetch --all --no-tags
```
And finally merge develop (or respectively master) branch from template into your project
```
git merge template/develop --allow-unrelated-histories
```
Have fun merging conflicts ;)

