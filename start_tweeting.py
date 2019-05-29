
import configparser
import os
import subprocess
import sys
# from tkinter import filedialog
from tkinter import Tk, filedialog
"""
work on py2 and py3 by mapping
input to raw_input
"""
try:
    input = raw_input
except NameError:
    pass

cfg = configparser.ConfigParser()
cfg.read('.profiles.ini')
# catch the no argument passed situation
try:
    whoami = sys.argv[1]
except IndexError:
    print("Using Default configuration")
    whoami = "default"

# parse lambda configuration parameters
CONFIG_PARAMS = {}
for config_tuple in cfg.items(whoami):
    name = config_tuple[0]
    val = config_tuple[1]
    CONFIG_PARAMS[name.upper()] = val


root = Tk()
root.withdraw()
REPOSITORY_PATH = filedialog.askdirectory(title="Select Repository to Tweet From")
root.destroy()
if not REPOSITORY_PATH:
    print("Must enter a repository path")
else:
    REPOSITORY_PATH = REPOSITORY_PATH if REPOSITORY_PATH.endswith(os.sep) else REPOSITORY_PATH + os.sep
    bashCommand = "bash start_tweeting.sh {ck} {csk} {at} {ats} {rp}".format(
        ck=CONFIG_PARAMS['CONSUMER_KEY'],
        csk=CONFIG_PARAMS['CONSUMER_SECRET'],
        at=CONFIG_PARAMS['ACCESS_TOKEN'],
        ats=CONFIG_PARAMS['ACCESS_TOKEN_SECRET'],
        rp=REPOSITORY_PATH
    )
    process = subprocess.Popen(bashCommand.split(), stdout=subprocess.PIPE)
    output, error = process.communicate()
    if error:
        print(error)
