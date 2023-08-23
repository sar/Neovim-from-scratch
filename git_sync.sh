#!/bin/sh

clr_g='\033[0;32m'
clr_def='\033[0m'
git_plugins="./git_plugins"
git_src="https://github.com"
repos=$(cat git_plugins)
cd .nvim/

for repo in $repos
do
    repo_=${repo#*/}
    if [ ! -d "./$repo_" ]; then
        echo "${clr_g}git::clone $git_src/$repo${clr_def}"
        git clone "$git_src/$repo"
    fi
    cd $repo_
    echo "${clr_g}git::sync $repo_${clr_def}"
    git remote -v
    #git pull
    git branch
    cd ..
done

