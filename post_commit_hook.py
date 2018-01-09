import tweepy
import sys

"""
ADAPTED FROM: http://nodotcom.org/python-twitter-tutorial.html
"""

def get_api(cfg):
  auth = tweepy.OAuthHandler(cfg['consumer_key'], cfg['consumer_secret'])
  auth.set_access_token(cfg['access_token'], cfg['access_token_secret'])
  return tweepy.API(auth)

def main():
  # Get these values from https://apps.twitter.com/
  # See more detailed instructions in the README.md
  cfg = { 
    "consumer_key"        : "YOUR VALUE",
    "consumer_secret"     : "YOUR VALUE",
    "access_token"        : "YOUR VALUE",
    "access_token_secret" : "YOUR VALUE" 
    }

  tweet_str = sys.argv[1]

  api = get_api(cfg)
  status = api.update_status(status=tweet_str) 

if __name__ == "__main__":
  main()