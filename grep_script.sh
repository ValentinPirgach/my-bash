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

echo "${green}${bold}Read from file and grep 'бер' dirlist.txt:${reset}${normal}"
cat dirlist.txt | grep 'бер' > grep_month_name.txt

echo "${green}${bold}Content of grep_month_name.txt:${reset}${normal}"
cat grep_month_name.txt

printf "\n"

echo "${green}${bold}Read from file and grep not 'бер' grep_other_monthes.txt:${reset}${normal}"
cat dirlist.txt | grep -v 'бер' > grep_other_monthes.txt

printf "\n"

echo "${green}${bold}Content of grep_other_monthes.txt:${reset}${normal}"
cat grep_other_monthes.txt

printf "\n"

echo "${green}${bold}Create grep dir and move to it previous files${reset}${normal}"
mkdir -p grep
mv grep_month_name.txt grep_other_monthes.txt ./grep

printf "\n"

echo "${green}${bold}Go to the linux_lab1 ${reset}${normal}"
cd ~/linux_lab1
echo "${green}${bold}Create file with name stud${reset}${normal}"
touch this_is_files_with_stud_name.txt

echo "${green}${bold}Find all lines with substring stud${reset}${normal}"
ls | grep stud

printf "\n"
