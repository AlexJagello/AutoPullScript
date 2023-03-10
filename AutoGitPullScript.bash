#!/usr/bin/env bash

RED='\033[0;31m'
GREEN='\033[0;32m'
LIGHTGREEN='\033[0;92m'
YELLOW='\033[0;33m'
PURPLE='\033[0;35m'  
NC='\033[0m' # No Color

function gitPull {

cd $1
statusFolder=$(cd $1 2>&1) 
if [[ $statusFolder == *"No such file"* ]] 
then
   statusFull="${RED}No such folder.         ${NC}"
else


   statusFull=$(git pull)
   echo -e "${PURPLE}GET ALL COMMITS FROM: ${NC}" 
   echo $1


   if [[ $statusFull == *"files changed"* ]] || [[ $statusFull == *"file changed"* ]] || [[ $statusFull == *"insertion"* ]] || [[ $statusFull == *"insertions"* ]]|| [[ $statusFull == *"deletion"* ]] || [[ $statusFull == *"deletions"* ]];
   then
      statusFull="${LIGHTGREEN}Pulled.                 ${NC}"
   elif [[ $statusFull == *"Updating"* ]];
   then
      statusFull="${YELLOW}Unstashed objects exist.${NC}"
   elif [[ $statusFull == *"conflict"* ]];
   then
      statusFull="${YELLOW}Merge conflict.         ${NC}"
   elif [[ $statusFull == "" ]];
   then
      statusFull="${RED}Unknown error.          ${NC}"
   elif [[ $statusFull == *"Already up to date."* ]];
   then
      statusFull="${GREEN}Already up to date.     ${NC}"
   fi
fi




echo -e "$statusFull"
echo "_______________________________________________________________"
echo "_______________________________________________________________"
echo ""
echo ""
}


function FindGitRepos
{
  echo "Looking for all git repositories..."
  folders=$(find -name '.git' -type d)
  folders=${folders//'/.git'/$''}
  folders=${folders//'./'/"${1}/"}
  echo -e "${YELLOW}${folders}${NC}"
}


echo "Script start"
currentPath=$(realpath .)

outputStatus="" 

if [[ ! -s repos.txt ]]; then
   FindGitRepos "${currentPath}"
   echo -e "${folders}" >> repos.txt
fi

filename='repos.txt'

n=1

while read line; do
gitPull $val1 ${line}
n=$((n+1))

outputStatus+="|  "
outputStatus+=${statusFull}
outputStatus+="    |    "
outputStatus+=${line}
outputStatus+="\n"

done < $filename


echo "+------------------------------+------------------------------------------------------------------------------------"
echo -e "${outputStatus::-2}"
echo "+------------------------------+------------------------------------------------------------------------------------"

echo "Script end. Press ENTER to exit"
read varname
