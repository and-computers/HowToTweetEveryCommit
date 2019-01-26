# HowToTweetEveryCommit
have you ever wanted to lose all of your followers by tweeting every single commit message to the world? 

adapted from: https://gist.github.com/kylefrost/f3841e76749dc64f4b5e

changed to do the actual twitter post in python using `Tweepy` because the oauth-sign and http-post install from tar.gz was giving me problems and python is just easier. hopefully this makes it a bit more usable for someone else. enjoy!

--------------------------------------------------------------------------

## Get To Tweeting

1. Get your developer tokens from https://apps.twitter.com/ and make sure your permissions are set to "Read and Write"

![get_dev_tokens](http://g.recordit.co/VlZUSa77T2.gif)
https://www.slickremix.com/docs/how-to-get-api-keys-and-tokens-for-twitter/

2. Run `bash start_tweeting.sh` to execute the script

3. Supply the information when prompted.
	- The path to the repository you want to tweet commits for
	- The twitter api consumer key
	- The twitter api consumer secret
	- The twitter api access token
	- The twitter api access token secret

4. Install dependency (its just `tweepy`), run `pip install -r requirements.txt`

--------------------------------------------------------------------------


## Verify it Worked

- Go to the local repository that you selected to tweet from and find the `.git` folder. Note that most operating systems have folders that start with "." hidden. To unhide folders on Mac OSX press `Command+Shift+.`

![unhide_hidden_folders](http://g.recordit.co/vgQZDrphXW.gif)

- Look for 2 files named `post-commit` and `post_commit_hook_autogen.py` in the repository's git hooks directory: `your_repo/.git/hooks/` 

- Open the `post_commit_hook_autogen.py` file and verify that the Twitter API credentials you supplied are present in the config dictionary.

```python
def main():
  """
  Get these values from https://apps.twitter.com/
  See more detailed instructions in the README.md
  """
  cfg = { 
    "consumer_key"        : "some-random-str-thing",
    "consumer_secret"     : "and-another-one-but-secretive",
    "access_token"        : "a-long-string-too",
    "access_token_secret" : "a-secretive-long-string" 
    }
```

--------------------------------------------------------------------------

## When You Get Tired or Your Follower Count Goes Down to 0

Run the following command:

`bash stop_tweeting.sh` 

Supply the path to the repository that you had previously tweeted from.

--------------------------------------------------------------------------

## Contributing

Its still pretty early but if you have suggestions, thoughts, feedback, criticism, etc feel free to open a PR or submit an Issue. 

Thanks in advance :blush:

--------------------------------------------------------------------------

#### Donating

If ya feeling generous, hollr @ the kid :heart:

https://www.paypal.me/hijodelsol

**BTC: 3EbMygEoo8gqgPHxmqa631ZVSwgWaoCj3m**

**ETH: 0x2F2604AA943dB4E7257636793F38dD3B1808A9e7**

**LTC: MQVgzNDgw43YzyUg3XmH3jQ7L8ndVswmN3**
