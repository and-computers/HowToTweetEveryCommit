# HowToTweetEveryCommit
have you ever wanted to lose all of your followers by tweeting every single commit message to the world? 

adapted from: https://gist.github.com/kylefrost/f3841e76749dc64f4b5e

changed to do the actual twitter post in python using `Tweepy` because the oauth-sign and http-post install from tar.gz was giving me problems and python is just easier. hopefully this makes it a bit more usable for someone else. enjoy!



1. Get your developer tokens from https://apps.twitter.com/ and make sure your permissions are set to "Read and Write"

![get_dev_tokens](http://g.recordit.co/VlZUSa77T2.gif)
https://www.slickremix.com/docs/how-to-get-api-keys-and-tokens-for-twitter/

1a. Paste the 4 keys into the `post_commit_hook.py` in the section below.

```python
def main():
  # Get these values from https://apps.twitter.com/
  # See more detailed instructions in the README.md
  cfg = { 
    "consumer_key"        : "YOUR VALUE",
    "consumer_secret"     : "YOUR VALUE",
    "access_token"        : "YOUR VALUE",
    "access_token_secret" : "YOUR VALUE" 
    }
```




2. Install dependency (its just `tweepy`), run `pip install -r requirements.txt`

3. Go to the local repository that you want to have commits tweeted from and find the `.git` folder. Note that most operating systems have folders that start with "." hidden. To unhide folders on Mac OSX press `Command+Shift+.`

![unhide_hidden_folders](http://g.recordit.co/vgQZDrphXW.gif)

4. Place the 2 files `post-commit` and `post_commit_hook.py` from this repository into the `your_repo/.git/hooks/` directory

5. Make the `post-commit` file executable by running `chmod a+x post-commit` from within `your_repo/.git/hooks/` directory


![make_executable_gif](http://g.recordit.co/dnz5eR4t6V.gif)


6. Edit lines 5 and 28 in `post-commit` file to point to your repository's local directory and repository's git/hooks directory respectively. See below for an example of what your edits might look like:

```
Line 5: export PATH=$PATH:~/Desktop/Code/MyCodeRepository/.git/hooks

Line 28: python ~/Desktop/Code/MyCodeRepository/.git/hooks/post_commit_hook.py $tweet
```
