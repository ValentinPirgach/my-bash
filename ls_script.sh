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
echo "${green}${bold}Done! Now we are on $(pwd)${normal}${reset}"
echo "${green}${bold}This is content of '$(pwd)' directory${normal}${reset}"
printf "\n"

echo "${green}${bold}Simple: ${normal}${reset}"
ls

printf "\n"

echo "${green}${bold}Reverse order: ${normal}${reset}"
ls -r

printf "\n"

echo "${green}${bold}With subdirectories order (last 50):${normal}${reset}"
ls -R | head -50

printf "\n"

echo "${green}${bold}With hidden files (last 50):${normal}${reset}"
ls -R -a | head -50

printf "\n"

echo "${green}${bold}With hidden file sizes (last 50):${normal}${reset}"
ls -Rlah | head -50

printf "\n"

echo "${green}${bold}Sorted by file size (last 50):${normal}${reset}"
ls -RlahS | head -50

printf "\n"

echo "${green}${bold}Directories in current directory:${normal}${reset}"
ls -d */

printf "\n"

echo "${green}${bold}Sorted by created date:${normal}${reset}"
ls -tU

printf "\n"

echo "${green}${bold}Sorted by modified date:${normal}${reset}"
ls -t

printf "\n"

echo "${green}${bold}Files which has second vowel letter${normal}${reset}"
echo "${green}${bold}Jump to Study dir to see the files${normal}${reset}"

cd Study

ls *.* | grep -e '^.\{1\}[aoueyi]'

printf "\n"

echo "${green}${bold}Writing info to the file dirlist.txt${normal}${reset}"
ls -lah > dirlist.txt

printf "\n"

echo "${green}${bold}Contents of dirlist.txt${normal}${reset}"
pwd
cat dirlist.txt
