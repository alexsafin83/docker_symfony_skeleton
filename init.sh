#!/bin/sh

reset () {
  if [ -f ./docker/docker-compose.dev.yaml.dist ]; then
    mv ./docker/docker-compose.dev.yaml.dist ./docker/docker-compose.dev.yaml
  fi

  if [ -f ./docker/docker-compose.yaml.dist ]; then
    mv ./docker/docker-compose.yaml.dist ./docker/docker-compose.yaml
  fi
}

reset;

read -p "Please enter your git.user.name:" username
read -p "Please enter your git.user.email:" useremail
echo "Git user name is $username"
echo "Git user email is $useremail"


git_user_name=$username git_user_email=$useremail envsubst < ./docker/docker-compose.dev.yaml > ./docker/docker-compose.dev.tmp
mv ./docker/docker-compose.dev.yaml ./docker/docker-compose.dev.yaml.dist
mv ./docker/docker-compose.dev.tmp ./docker/docker-compose.dev.yaml

git_user_name=$username git_user_email=$useremail envsubst < ./docker/docker-compose.yaml > ./docker/docker-compose.tmp
mv ./docker/docker-compose.yaml ./docker/docker-compose.yaml.dist
mv ./docker/docker-compose.tmp ./docker/docker-compose.yaml

# create symfony skeleton
echo "calling symfony local:new ..."
./symfony.sh local:new --dir symfonytmp

# move previously created source code and clean up
rm -rf ./symfonytmp/.git
rm -f ./symfonytmp/.gitignore
mv ./symfonytmp/* ./
mv ./symfonytmp/.* ./
rm -rf ./symfonytmp


. ./shellStyle
echo -e "${BoldIntensityGreen}Done!\n"
echo -e "Have fun using symfony app at"
echo -e "${tab}http://localhost:8080/ ${Neutral}"