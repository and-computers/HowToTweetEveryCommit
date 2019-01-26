#!/bin/bash

# This is a program that stops your repository from tweeting commits!

echo -n "Enter the Path/to/your/repository (autocomplete enabled & must end in slash) and press [ENTER]: "
read -e REPOSITORY_PATH

# tilde expansion for the case when it exists 
# https://stackoverflow.com/questions/3963716/how-to-manually-expand-a-special-variable-ex-tilde-in-bash
REPOSITORY_PATH="${REPOSITORY_PATH/#\~/$HOME}"

# the line that needs to be commented out to stop tweeting
TWEETING_LINE="status = api.update_status(status=tweet_str)"
echo "commenting out the line that does the tweeting"
sed -i -e "s|${TWEETING_LINE}|#${TWEETING_LINE}|g" "${REPOSITORY_PATH}.git/hooks/post_commit_hook_autogen.py"