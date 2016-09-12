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

# The location of the folder where all the magic happens
WORKSPACE_FOLDER=/tmp/sturdy-engine



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

function createTimestamp() {
 TIMESTAMP=`date +%d%m%y-%H%M%S`
}

function readLink() {
  echo "Enter the link" && read LINK
}

function checkLink() {
  # http://stackoverflow.com/a/3184819
  regex="(https?|ftp|file)://[-A-Za-z0-9\+&@#/%?=~_|!:,.;]*[-A-Za-z0-9\+&@#/%=~_|]"
  if [[ ${LINK} =~ ${regex} ]]
  then 
    echo "Seems to be a valid link, proceeding"
  else
    echo "Link doesn't seem to be valid"
    exit
  fi
}

function createWorkspace() {
  mkdir ${WORKSPACE_FOLDER}
}

function enterDescription() {
  
  POST="post-${TIMESTAMP}"

  echo "${LINK}" > ${WORKSPACE_FOLDER}/${POST}

  vim ${WORKSPACE_FOLDER}/${POST}

}

function destroyWorkspace() {
  rm -rf ${WORKSPACE_FOLDER}
}


# trap destroyWorkspace EXIT




getOS
checkDependencies
createTimestamp
readLink
checkLink
createWorkspace
enterDescription
# enterDescription
# getArchiveLink
# convertToMarkdown
# appendToNewsLetter


