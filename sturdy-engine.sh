#!/bin/bash

# sturdy-engine.sh
# Version 0.1
# Rey Dhuny
#
#
# ABOUT
# =====
#
# Collect links, allow description, automagically create newsletter that can be
# copy and pasted on a weekly basis


# pandoc -f markdown index.md > index.html

# Get the OS flavour (eg. Linux or Darwin)
function getOS() {
  OS=`uname`
}


# Check the prerequisite software is installed
function checkDependencies() {
  which pandoc
  # if which command was successful then
  if [ $? -eq 0 ]; then
    echo "pandoc is installed, proceeding"
  else
    echo "pandoc doesn't seem to be installed"
    if [ ${OS} = "Darwin" ]; then
      echo "Why not run \`brew install pandoc\`?"
    else
      echo "Why not run \`apt-get install pandoc\`?"
    fi
    exit
  fi
}

function createNewPost() {
  echo "Enter the link" && read LINK
}

function checkLink() {
  # http://stackoverflow.com/a/3184819
  regex="(https?|ftp|file)://[-A-Za-z0-9\+&@#/%?=~_|!:,.;]*[-A-Za-z0-9\+&@#/%=~_|]"
  if [[ ${LINK} =~ ${regex} ]]
  then 
      echo "Link valid"
  else
      echo "Link not valid"
  fi
}



trap EXIT




# getOS
# checkDependencies
createNewPost
checkLink
# enterDescription
# getArchiveLink
# convertToMarkdown
# appendToNewsLetter

