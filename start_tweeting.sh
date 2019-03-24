#!/bin/bash

# This is a program that sets up a repository for tweeting commits!


twitter_consumer_key=$1
twitter_consumer_secret=$2
twitter_access_token=$3
twitter_access_token_secret=$4
REPOSITORY_PATH=$5

# tilde expansion for the case when it exists 
# https://stackoverflow.com/questions/3963716/how-to-manually-expand-a-special-variable-ex-tilde-in-bash
REPOSITORY_PATH="${REPOSITORY_PATH/#\~/$HOME}"

echo "This script will tweet out your commits for "$REPOSITORY_PATH""




echo "Placing access keys & tokens in python script"

cp post_commit_hook_template.py post_commit_hook_autogen.py 

sed -i -e "s|{{YOUR_VALUE_CKEY}}|"$twitter_consumer_key"|g" post_commit_hook_autogen.py

sed -i -e "s|{{YOUR_VALUE_CSECRET}}|"$twitter_consumer_secret"|g" post_commit_hook_autogen.py

sed -i -e "s|{{YOUR_VALUE_ATOKEN}}|"$twitter_access_token"|g" post_commit_hook_autogen.py

sed -i -e "s|{{YOUR_VALUE_ATOKENSECRET}}|"$twitter_access_token_secret"|g" post_commit_hook_autogen.py


echo "Specifying repository path in post commit hook"

cp post-commit_template post-commit

sed -i -e "s|{{MY_REPO_PATH}}|${REPOSITORY_PATH}|g" post-commit

echo "Moving python script and post commit bash to repository"

sudo mv post-commit "${REPOSITORY_PATH}.git/hooks/"
sudo mv post_commit_hook_autogen.py "${REPOSITORY_PATH}.git/hooks/"

# delete residual artifacts
rm post-commit-e
rm post_commit_hook_autogen.py-e

echo "Making post commit bash script executable"

sudo chmod a+x "${REPOSITORY_PATH}.git/hooks/post-commit"

echo "Every Tweet From "${REPOSITORY_PATH}" will now be tweeted out!">&2