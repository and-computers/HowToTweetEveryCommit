#!/bin/bash

# This is a program that sets up a repository for tweeting commits!

friends="/var/tmp/michel/friends"

echo "Hello, "$USER""  


echo -n "Enter the Path/to/your/repository (autocomplete enabled) and press [ENTER]: "
read -e REPOSITORY_PATH

echo "This script will tweet out your commits for "$REPOSITORY_PATH""

echo -n "Enter your Twitter consumer key and press [ENTER]: "
read twitter_consumer_key
echo -n "Enter your Twitter consumer secret and press [ENTER]: "
read twitter_consumer_secret

echo -n "Enter your Twitter access token and press [ENTER]: "
read twitter_access_token

echo -n "Enter your Twitter access token secret and press [ENTER]: "
read twitter_access_token_secret

echo "Placing access keys & tokens into python script"

cp post_commit_hook_template.py post_commit_hook_autogen.py 

sed -i -e "s/{{YOUR_VALUE_CKEY}}/"$twitter_consumer_key"/g" post_commit_hook_autogen.py

sed -i -e "s/{{YOUR_VALUE_CSECRET}}/"$twitter_consumer_secret"/g" post_commit_hook_autogen.py

sed -i -e "s/{{YOUR_VALUE_ATOKEN}}/"$twitter_access_token"/g" post_commit_hook_autogen.py

sed -i -e "s/{{YOUR_VALUE_ATOKENSECRET}}/"$twitter_access_token_secret"/g" post_commit_hook_autogen.py


echo "Specifying repository path in post commit hook"

cp post-commit-template post-commit

sed -i -e "s/{{REPOSTIORY_PATH}}/"$REPOSTIORY_PATH"/g" post-commit


echo "Moving python script and post commit bash to repository"

mv post-commit ""$REPOSTIORY_PATH"/.git/hooks/"
mv post_commit_hook_autogen.py ""$REPOSTIORY_PATH"/.git/hooks/"

echo "Making post commit bash script executable"

sudo chmod a+x ""$REPOSTIORY_PATH"/.git/hooks/post-commit"

echo "Every Tweet From "$REPOSITORY_PATH" will now be tweeted out!"