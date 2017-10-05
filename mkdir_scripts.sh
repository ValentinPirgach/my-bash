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

echo "${green}${bold}Jump to the root directory ($HOME)${normal}${reset}"
cd $HOME

printf "\n"

echo "${green}${bold}Create dir linux_lab1${normal}${reset}"
mkdir -p linux_lab1
cd linux_lab1

printf "\n"

echo "${green}${bold}Copy dirlist.txt ${normal}${reset}"
cp ~/Study/dirlist.txt .

printf "\n"

echo "${green}${bold}Remove dirlist.txt from study ${normal}${reset}"
rm -f ~/Study/dirlist.txt

printf "\n"
