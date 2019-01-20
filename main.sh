#!/bin/bash

# This is a program that sets up a repository for tweeting commits!

friends="/var/tmp/michel/friends"

echo "Hello, "$USER".  This script will tweet out your commits for "$REPOSITORY""

echo -n "Enter your Twitter consumer key and press [ENTER]: "
read twitter_consumer_key
echo -n "Enter your Twitter consumer secret and press [ENTER]: "
read twitter_consumer_secret

echo -n "Enter your Twitter access token and press [ENTER]: "
read twitter_access_token

echo -n "Enter your Twitter access token secret and press [ENTER]: "
read twitter_access_token_secret

echo