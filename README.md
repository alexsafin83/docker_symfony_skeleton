# docker_symfony_skeleton
Project skeleton to start a project from scratch, using PHP and symfony framework with ready to use docker set up

## What you will get
- PHP 8.4.3
- apache web server
- Symfony framework
- Symfony-cli

# Requirements
Go for it, if you have a working bash or a Linux OS.
You must be able to execute .sh scripts

# How and where to start
### Initialization
There is no initialization routine yet necessary.
To initialize a project you will use the script `symfony.sh` or `composer.sh`
### Using Symfony.sh
Symfony.sh is a symfony cli running in a docker container.\
You use it just like the stock symfony cli by calling the script
```
$ ./symfony.sh
```

Therefore, to create a symfony project you will call
```
$ ./symfony.sh project:init
```

### Other ways
Alternatively you can use composer to create your symfony framework based project.

#### Create a composer.json
The interactive way: call the init command from composer
```
$ ./composer.sh init
```
Or just do it manually by adding a composer.json file.

