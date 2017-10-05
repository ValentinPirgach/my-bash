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

cd $HOME/Study

echo "${green}${bold}Find all files is system with bash in filename (with find command, last 20):${reset}${normal}"
find / -name '*bash*' | head -20

printf "\n"

echo "${green}${bold}Find all files is system with bash in filename (with locate command):${reset}${normal}"
locate *bash*

printf "\n"

echo "${green}${bold}Find all files last day changed :${reset}${normal}"
find / -mtime 1 | head -20

printf "\n"

echo "${green}${bold}Find all hard links in current! dir:${reset}${normal}"
find / -xdev -maxdepth 1

printf "\n"

echo "${green}${bold}Change promt greeting (add hostname):${reset}${normal}"
PS1='${hostname} ${ret_status} %{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)'

printf "\n"

echo "${green}${bold}Remove manyfiles!:${reset}${normal}"

rm -rf ~/linux_lab1/manyfiles
ls ~/linux_lab1

printf "\n"
