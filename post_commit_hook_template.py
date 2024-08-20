import tweepy
import sys

"""
ADAPTED FROM: http://nodotcom.org/python-twitter-tutorial.html
"""


def get_api_client(config_dict: dict) -> tweepy.Client:
    """Get api client from tweepy for v2 api endpoints
    Args:
        config_dict (dict[str,str]): a dictionary with keys needed to auth
        specifically consumer_key, consumer_secret, access_token, access_token_secret
    """
    return tweepy.Client(**config_dict)


def main():
    # Get these values from https://apps.twitter.com/
    # See more detailed instructions in the README.md
    cfg = {
        "consumer_key": "{{YOUR_VALUE_CKEY}}",
        "consumer_secret": "{{YOUR_VALUE_CSECRET}}",
        "access_token": "{{YOUR_VALUE_ATOKEN}}",
        "access_token_secret": "{{YOUR_VALUE_ATOKENSECRET}}"
    }

    tweet = ""
    for arg in sys.argv[1:]:
        tweet += " " + arg

    twitter_client = get_api_client(config_dict=cfg)
    status = twitter_client.create_tweet(text=tweet)

if __name__ == "__main__":
    main()
