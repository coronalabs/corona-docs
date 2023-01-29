# Setting Up and Using URL Schemes

This guide is heavily based on an old [blog post](https://web.archive.org/web/20160506183953/https://coronalabs.com/blog/2011/12/22/using-app-url-schemes-in-ios/) and forums posts about creating integrating URL Scheme into your iOS and Android Apps. Note that Android URL Schemes are set up through __Intent Filters__, but for simplicity, this guide will refer to them as URL Schemes. Also, this guide will not cover __App Links__ or launching your app with website URLs.

## What are URL Schemes

Simply put, URL Schemes allow your application to be opened from another application. They usually take the form like `mycoolappname://MyCustomString`. Modern iOS versions will enable you to open URLs Scheme in Safari. For Android, you may need to use a 3rd party tool like [Deep Link Tester](https://play.google.com/store/apps/details?id=org.thewheatfield.android.deeplinks). Note that Url Scheme should use lowercase letters.


## Sample build.settings

For iOS you need to define your url schemes in the `CFBundleURLScheme` and for Android an `Intent Filter` needs to be define in your apps `build.settings` similar to the sample code below.

``````lua
settings = {
	orientation = {
		default = { "portrait" }
	},
	iphone = {
		plist = {
			UIApplicationExitsOnSuspend = false,
			CFBundleURLTypes =
			{
				{
					CFBundleURLSchemes =
					{
						"fb1234567890", -- example scheme for facebook
						"mycoolappscheme", -- example second scheme
					}
				}
			}
		}
	},
	android = {
		intentFilters = {
			 {
				 label = "Optional Title Goes Here",
			 		actions = { "android.intent.action.VIEW" },
					categories = { "android.intent.category.DEFAULT", "android.intent.category.BROWSABLE", },
					data = { scheme = "mycoolappscheme" },
				},
				-- You can add more intent filters here.
		 },
	},

}
``````


## Handling Cold Open

A “cold launch” is when your app is neither in the foreground, nor is it suspended; it is completely closed. If your app is launched using a URL scheme, then here is how you would get the URL string that was used to launch your apps __main.lua__:

``````lua
local launchArgs = ...
local launchURL
if launchArgs and launchArgs.url then
	launchURL = launchArgs.url
end
print( launchURL ) -- output: mycoolappscheme://MyCustomString
``````

The example above assumes your app has mycoolappscheme registered as a URL scheme, and that the user launched the app using the following URL string: mycoolappscheme://MyCustomString
In the example above, if the user launches the app normally (not with an url scheme), then the value of launchURL will be nil.


## Handling Warm Open

If your app is already opened but not in the foreground, it is considered “suspended”. When your app is launched with a URL scheme while it is suspended, you can get the URL used to launch your app using a System Event Listener. Here’s an example:

``````lua
local launchURL
local function onSystemEvent( event )
	if event.type == "applicationOpen" and event.url then
		launchURL = event.url
		print( launchURL ) -- output: mycoolappscheme://MyCustomString
	end
end
Runtime:addEventListener( "system", onSystemEvent )
``````


## Handling Both


You could simply combine the two examples above and everything would be just fine, but I recommend putting your code in a function, and just calling the function from the two different places. Here’s an example of how you could do that:


``````lua
local launchArgs = ...
local function printURL( url )
	print( url ) -- output: mycoolappscheme://MyCustomString
end
if launchArgs and launchArgs.url then
	printURL( launchArgs.url )
end
local function onSystemEvent( event )
	if event.type == "applicationOpen" and event.url then
		printURL( event.url )
	end
end
Runtime:addEventListener( "system", onSystemEvent )
``````

## Checking if an URL Scheme

To check if an app URL Scheme can be opened via [system.openURL()][api.library.system.openURL] see [system.canOpenURL()][api.library.system.canOpenURL].
