# Silencer - turn down the internet

Silencer is an extension for Google Chrome that allows you to mute terms, phrases, hashtags or people on Twitter and Facebook.

It is currently in its early stages and is always rapidly evolving.

## Installation Instructions

1. Do `git clone git@github.com:zackshapiro/silencer.git`
2. Go to `chrome://extensions`, make sure Developer Mode is checked
3. Click `Load unpacked extension` and navigate to the cloned repo, wherever you stored it
4. You only need to navigate into the Silencer directory and press select for Chrome to load the extension
5. Any time you make a change to the code make sure you go to your tab with `chrome://extensions` open and refresh to get the latest code

## Other notes
* To auto-compile `.coffee` files into `.js` files, in your terminal navigate to `/Silencer/src` and type `coffee -cw .` This will auto compile CofeeScript files into JavaScript files when you save. It will also show you any indent errors or reasons the CoffeeScript file couldn't be saved
* You have to develop in the master branch, as far as I can tell. Chrome doesn't seem to recognize code that's in a branch that you're actively working on
* The latest production build of Silencer can be found [here](https://chrome.google.com/webstore/detail/silencer/liddmepmaofgllnbdbepbcgfgclcelno?utm_source=chrome-ntp-icon)

#### crafted with love by [Zack Shapiro](http://twitter.com/zackshapiro)

*(This can be anything you want it to be)*