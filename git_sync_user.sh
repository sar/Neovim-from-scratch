#!/bin/bash

github_user=sar

repos=$(curl -s https://api.github.com/users/$github_user/repos?per_page=1000 | grep -o '"name":[^,]*' | awk -F ':' '{print $2}' | sed 's/\"//g')

for repo in $repos; do
    if [[ $repo == *.nvim ]]; then
        if [ -d "$repo" ]; then
            cd $repo
            printf '[git]::pull_repo::%s' "$repo"
            git pull
            cd ..
        else
            printf '[git]::clone::%s' "$repo"
            git clone https://github.com/$github_user/$repo.git
        fi
    fi
done
