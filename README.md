# HowToTweetEveryCommit
have you ever wanted to lose all of your followers by tweeting every single commit message to the world? based off: https://gist.github.com/kylefrost/f3841e76749dc64f4b5e


1. Get your developer tokens from https://apps.twitter.com/

2. Install dependency (its just tweepy), run `pip install -r requirements.txt`

3. Go to the local repository that you want to have commits tweeted from and find the `.git` folder. Note that most operating systems have folders that start with "." hidden. To unhide folders on Mac OSX press `Command+Shift+.`

4. Place the 2 files `post-commit` and `post_commit_hook.py` from this repository into the `your_repo/.git/hooks/` directory

5. Make the `post-commit` file executable by running `chmod a+x post-commit` from within `your_repo/.git/hooks/` directory

6. Edit lines 5 and 28 in `post-commit` file to point to your repository's local directory and repository's git/hooks directory respectively. See below for an example of what your edits might look like:

```
Line 5: export PATH=$PATH:~/Desktop/Code/MyCodeRepository/.git/hooks

Line 28: python ~/Desktop/Code/MyCodeRepository/.git/hooks/post_commit_hook.py $tweet
```