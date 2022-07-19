# How to use a ```userChrome.css``` theme
1. Type ```about:config``` into your URL bar. Click on the I accept the risk button if you're shown a warning.
1. Seach for ```toolkit.legacyUserProfileCustomizations.stylesheets```,
	 ```layers.acceleration.force-enabled```, ```gfx.webrender.all``` and
	 ```svg.context-properties.content.enabled and``` set them to ```true```.
1. Go to your profile folder ```$HOME/.mozilla/firefox/######.default-release/```
1. If it doesn't exist already create a folder called chrome.
1. Copy your desired ```userChrome.css``` into that folder.
