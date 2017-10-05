#!/bin/bash

if [ "$1" == "--debug" ]
then
  set -x
  trap read debug
fi

bold=`tput bold`
normal=`tput sgr0`
red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`


echo "${green}${bold}Go to HOME with short command:${reset}${normal}"
cd ~

printf "\n"

echo "${green}${bold}Go to previous dir:${reset}${normal}"
cd -

printf "\n"

echo "${green}${bold}Go Home again:${reset}${normal}"
cd ~

printf "\n"

echo "${green}${bold}Go to level up:${reset}${normal}"
cd ../

printf "\n"

echo "${green}${bold}Go to /tmp:${reset}${normal}"
cd `whoami`/tmp

printf "\n"

echo "${green}${bold}Go to /usr/local/bin/${reset}${normal}"
cd /usr/local/bin/

printf "\n"

echo "${green}${bold}Go to 2 levels up${reset}${normal}"
cd ../../

printf "\n"
