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
cd linux_lab1

printf "\n"

echo "${green}${bold}Create dir manyfiles${normal}${reset}"
mkdir -p manyfiles

printf "\n"

echo "${green}${bold}Jump to manyfiles${normal}${reset}"
cd manyfiles

printf "\n"

echo "${green}${bold}Create 100 files with names: a1 ... a100${normal}${reset}"
for i in `seq 1 100`;
do
  touch a$i
done

printf "\n"

echo "${green}${bold}Create dir manyfiles10 and manyfiles30 ${red}(WTF??? O_o for WHAT??) ${normal}${reset}"
mkdir -p manyfiles10
mkdir -p manyfiles30

printf "\n"

echo "${green}${bold}Move to manyfiles1 a1 .. a10 ${normal}${reset}"
mkdir -p manyfiles1

for i in $( ls ); do
  fl="$(echo $i | head -c 1)"
  num="${i//[^0-9]/}"

  if [ $num -le 10 ] && [ $fl = "a" ]
  then
    mv $i manyfiles1/$i
  fi
done

echo "${green}${bold}Content of manyfiles1: ${normal}${reset}"
ls manyfiles1

printf "\n"
printf "\n"

echo "${green}${bold}Copy to manyfiles2 file with item number % 5 ${normal}${reset}"
mkdir -p manyfiles2

for i in $( ls ); do
  fl="$(echo $i | head -c 1)"
  num="${i//[^0-9]/}"

  if [ $(($num % 5)) -eq 0 ] && [ $fl = "a" ]
  then
    cp $i manyfiles2/$i
  fi
done

echo "${green}${bold}Content of manyfiles2: ${normal}${reset}"
ls manyfiles2

printf "\n"
printf "\n"

echo "${green}${bold}From manyfiles remove files with item number % 2 ${normal}${reset}"
mkdir -p manyfiles2

for i in $( ls ); do
  fl="$(echo $i | head -c 1)"
  num="${i//[^0-9]/}"

  if [ $(($num % 2)) -eq 0 ] && [ $fl = "a" ]
  then
    rm $i
  fi
done

echo "${green}${bold}Content of manyfiles: ${normal}${reset}"
ls

printf "\n"


echo "${green}${bold}Create manyfiles3 as a copy of manyfiles1 ${normal}${reset}"
cp -R manyfiles1 manyfiles3
ls

echo "${green}${bold}Remove manyfiles1${normal}${reset}"
rm -rf manyfiles1
ls

printf "\n"

echo "${green}${bold}Create Toppler with files: high11 and low11${normal}${reset}"
mkdir -p Toppler
touch Toppler/high11
touch Toppler/low11

echo "${green}${bold}Copy high11 and low11 to /tmp${normal}${reset}"
cp Toppler/high11 Toppler/low11 ~/tmp

printf "\n"

echo "${green}${bold}move these files into Home dir${normal}${reset}"
mv Toppler/high11 Toppler/low11 $HOME
ls $HOME

printf "\n"

echo "${green}${bold}Copy Toppler into /tmp${normal}${reset}"
cp -r Toppler ~/tmp
ls ~/tmp

printf "\n"

echo "${green}${bold}Rename Toppler in /tmp to Roller${normal}${reset}"
mv ~/tmp/Toppler ~/tmp/Roller
ls ~/tmp

printf "\n"

echo "${green}${bold}Copy Roller into Home with progress${normal}${reset}"
pv ~/tmp/Roller $HOME
