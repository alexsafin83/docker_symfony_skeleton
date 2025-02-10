# 1. docker symfony starter kit
Starter kit to start a symfony project from scratch, using PHP and symfony framework with ready to use docker set up.\
The main goal is to provide a working development environment. This means, all the configuration and all the scripts
provided here, are not meant to be used in a productive environment (so far).

## What you will get
- PHP 8.4.3 with/without xdebug
- apache web server
- Symfony framework
- Symfony-cli

# 2. Requirements
Go for it, if you have a working bash or a Linux OS.
You must be able to execute .sh scripts. Also docker & docker-compose should be installed.

# 3. How and where to start
### Initialization
To initialize your project, you will use the script `symfony.sh` or `composer.sh`

### Using Symfony.sh
Symfony.sh is a symfony cli running in a docker container.\
You use it just like the stock symfony cli by calling the script
```
$ ./symfony.sh
```

Therefore, to create a symfony project you will call
```
$ ./symfony.sh local:new
```

### Other ways
Alternatively you can use composer to create your symfony framework based project.

#### Create a composer.json
The interactive way: call the init command from composer
```
$ ./composer.sh init
```
Or just do it manually by adding a composer.json file.

### Start container
#### In development mode
```
$ docker compose -f ./docker/docker-compose.dev.yaml up -d
```
These options are active in development mode:
- xdebug
- xdebug.mode
- display_errors
- log_errors
- memory_limit
- and some more (see in docker/php/config/php.dev.ini)


#### In production mode
```
$ docker compose -f ./docker/docker-compose.yaml up -d
```