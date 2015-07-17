#!/bin/bash

VERSION="1.0";
COMMAND_OR_PROJECT_NAME=$1;
PROJECT_NAME=$2;
KIT_URL="https://github.com/DevTips/DevTips-Starter-Kit.git";
KIT_GULP_URL="https://github.com/mriverodorta/DevTips-Starter-Kit.git";
KIT_NAME_SASS="DevTips-Starter-Kit";
KIT_NAME_JEKYLL="Jekyll-Starter-Kit";
KIT_NAME_GULP="Gulp-Starter-Kit";

# Count how many times this script has been used
hit() {
  curl --silent -m 1 -X HEAD http://maikelrivero.com:2020
}
# Count how many times this script has been used
head() {
  echo "DevTips Starter Kit CLI";
  echo "-----------------------";
}

# echo "Project name: $projectName" ;
if [[ -z "$COMMAND_OR_PROJECT_NAME" ]]; then
  head;
  echo "Creating project on $KIT_NAME_SASS folder";
  git clone $KIT_URL;
  cd $KIT_NAME_SASS;
  rm -rf .git;
  hit;
  echo 'Project ready';
  exit;
fi
if [ -z "$PROJECT_NAME" ] && [ ! -z "$COMMAND_OR_PROJECT_NAME" ]; then
  head;
  echo "Creating project on $COMMAND_OR_PROJECT_NAME folder";
  git clone $KIT_URL $COMMAND_OR_PROJECT_NAME;
  cd $COMMAND_OR_PROJECT_NAME;
  rm -rf .git;
  hit;
  echo 'Project ready';
  exit;
fi

case $COMMAND_OR_PROJECT_NAME in
  -v )
    echo "ECHO devtips cli version $VERSION"
    exit;;
  -version )
    echo "ECHO devtips cli version $VERSION"
    exit;;
  -h )
    echo " The Devtips CLI is a simple tool for create new";
    echo " projects based on the DevTips-Starter-Kit";
    echo " -----------------------------------------------";
    echo " Usage:";
    echo "  devtips [option|project-name] project-name";
    echo " Options";
    echo " -sass         Create a project with the default Devtips-Starter-Kit";
    echo " -jekyll       Create a project with the jekyll version of the Devtips-Starter-Kit";
    echo " -gulp         Create a Gulp based project with the Devtips-Starter-Kit";
    echo " -h|-help      Show this help message";
    echo " -v|-version   Show the version of the Devtips CLI";
    echo " Example";
    echo " devtips -gulp new-project";
    echo "     Will create a new folder named \"new-project\"";
    echo "     with the gulp structure of Devtips-Starter-Kit";
    exit;;
  -help )
    echo " The Devtips CLI is a simple tool for create new";
    echo " projects based on the DevTips-Starter-Kit";
    echo " -----------------------------------------------";
    echo " Usage:";
    echo "  devtips [option|project-name] project-name";
    echo " Options";
    echo " -sass         Create a project with the default Devtips-Starter-Kit";
    echo " -jekyll       Create a project with the jekyll version of the Devtips-Starter-Kit";
    echo " -gulp         Create a Gulp based project with the Devtips-Starter-Kit";
    echo " -h|-help      Show this help message";
    echo " -v|-version   Show the version of the Devtips CLI";
    echo " Example";
    echo " devtips -gulp new-project";
    echo "     Will create a new folder named \"new-project\"";
    echo "     with the gulp structure of Devtips-Starter-Kit";
    exit;;
  -sass )
    head;
    echo "Creating project on $PROJECT_NAME folder";
    git clone $KIT_URL $PROJECT_NAME;
    cd $PROJECT_NAME;
    rm -rf .git;
    hit;
    echo 'Project ready';
    exit;;
  -jekyll )
    head;
    echo "Creating project on $PROJECT_NAME folder";
    git clone -b $KIT_NAME_JEKYLL --single-branch $KIT_URL $PROJECT_NAME;
    cd $PROJECT_NAME;
    rm -rf .git;
    hit;
    echo 'Project ready';
    exit;;
  -gulp )
    head;
    echo "Creating project on $PROJECT_NAME folder";
    git clone -b $KIT_NAME_GULP --single-branch $KIT_GULP_URL $PROJECT_NAME;
    cd $PROJECT_NAME;
    rm -rf .git;
    hit;
    echo 'Project ready';
    exit;;
  * )
    echo 'Option' $COMMAND_OR_PROJECT_NAME 'not recognized';;
esac
