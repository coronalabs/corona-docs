
# Implementing Ads

CORONA_CORE_PRODUCT supports multiple plugins that allow you to show in-app advertising. These plugins all basically work the same way, however there are subtle differences you have to pay close attention to. 

## Basic Concepts

There are some common concepts for all ad providers. Let's start with dashboard setup.

Each ad provider has a dashboard that you have to create an account for, set up your apps and then get various identifiers for... and they are all different. Following their guides and documentation will help you get set up on their platform.

You will need to create an "App" for each app/game you're going to implement ads for. In almost every case, within their dashboard you will define separate apps for the iOS version and the Android version. The ad providers will target iOS specific ads to iOS apps and Android specific ads to Android apps, so it makes sense if you're building for both platforms you will have two applications even though you will only have one CORONA_CORE_PRODUCT app. 

Each vendor may use a different identifier for this, but for the purpose of this tutorial, we will refer to this as an "AppId". It will be a string. The string could be all numbers, code with hex digits, or a long string with symbols in it. To CORONA_CORE_PRODUCT these will all be strings.

Next, you will most likely have to define what types of ads you want to show, such as banner ads, interstitial, or rewarded video ads. Depending on your app design, there may be times where you need to have multiple ads of the same type that are tracked separately. For instance, you might offer two rewards in your game for watching a rewarded video. Each reward has a different amount like 10 coins for one rewarded video and 5 gems for another. 

You need to set up different values that your app needs to process. Because of this, each separately tracked ad placement will have its own identifier. This may be called a PlacementId, or and adUnitId or some other term. For this tutorial, we will refer them as `PlacementId`. Like the `AppId`, these may look like numbers, but they are all treated as strings in CORONA_CORE_PRODUCT. NOTE: The code in this tutorial uses `adUnitId` since it uses AdMob as the implementation example.

These placements go with the app. If you have both an iOS app and an Android app and each app has three placements, you will have two `AppId`s and six `PlacementId`s.

In your code you will need to test to see what platform you're on and initialize your plugin using the appropriate IDs for each placement. 

## build.settings

Every plugin must be included in your `build.settings` file. You should be able to copy and paste the code from the plugin's documentation page and put it into your `build.settings` file. For instance to include AdMob, you would add this block to your build.settings

``````lua
settings =
{
    plugins =
    {
        ["plugin.admob"] =
        {
            publisherId = "com.coronalabs"
        },
    },
}
``````

If you want to also include Chartboost, you would do:

``````lua
settings =
{
    plugins =
    {
        ["plugin.admob"] =
        {
            publisherId = "com.coronalabs"
        },
        ["plugin.chartboost"] =
        {
            publisherId = "com.coronalabs"
        },
    },
}
``````

Of course, this is only part of your `build.settings` file and you would add this plugin block in with the other sub-tables in the settings table.

## Requiring the plugin

In every module where you need to call the advertising plugin you will need to require the plugin. Near the top of each `.lua` file simply do:

``````lua
local admob = require( "plugin.admob" )
``````

This will make the plugin available to that module. Keep in mind that with Lua, plugin modules are only physically required and loaded once. When required in other modules, you're just setting up a link to the already required module.

## Initializing the plugin

Before you can initialize the plugin, you have to understand a few basic concepts.

First, initialization doesn't happen right away. Because initialization makes networking calls, it takes time to complete. You don't want your app to freeze while this process happens, so the initialization actually happens in the background and control is returned to your app immediately. This means you __cannot__ make other plugin API calls until initialization is complete. 

Initialization should only happen once. This is best done in `main.lua`, but for more advanced setups, you could create a module to hold your advertising code and require that module in `main.lua`, but for most, you will do all of this in `main.lua`.

### The adListener function

Every plugin supports a listener or call-back function that executes whenever an ad event occurs. These events could be things like letting you know you the plugin has completed initialization, when an ad was successfully loaded, or if a rewarded video view was completed. Each plugin will have different names for these __phases__ that you can test against in this listener function.

You will only have one function to handle all of these events. The basic listener function will look like this (using AdMob as an example)

``````lua
-- AdMob listener function
local function adListener( event )
    local json = require( "json" )
    print("Ad event: ")
    print( json.prettify( event ) )
 
    if ( event.phase == "init" ) then  -- Successful initialization
        print( event.provider )
    elseif ( event.phase == "loaded" ) then -- Ads were loaded
    elseif ( event.phase == "reward" ) then -- A rewarded video was completed
    end
end
``````

### Calling .init()

Once you have your core listener function written, you can then call the plugin's `.init()` method. These methods will usually require you to pass __the address of your listener function__, your `AppId` and additional other parameters like test mode, GDPR consent and other options.

Because the ad provider likely requires different `AppIds` for different platforms your code should probably do something like:

``````lua
local myAppId = "your_Android_AppId"
local myInterstitialAdUnitId = "YOUR_ANDROID_ADMOB_INTERSTITAL_AD_UNIT_ID"
local myBannerAdUnitId = "YOUR_ANDROID_ADMOB_BANNER_AD_UNIT_ID"
local myRewardedAdUnitId = "YOUR_ANDROID_ADMOB_REWARDED_AD_UNIT_ID"

if "ios" == system.getInfo("platform") then
    myAppId = "your_iOS_AppId"
    myInterstitialAdUnitId = "YOUR_IOS_ADMOB_INTERSTITAL_AD_UNIT_ID"
    myBannerAdUnitId = "YOUR_IOS_ADMOB_BANNER_AD_UNIT_ID"
    myRewardedAdUnitId = "YOUR_IOS_ADMOB_REWARDED_AD_UNIT_ID"
end

admob.init( adListener, { appId = myAppId, testMode = true } )

``````

<div class="docs-tip-outer docs-tip-color-alert">
<div class="docs-tip-inner-left">
<div class="fa fa-exclamation-circle" style="font-size: 35px;"></div>
</div>
<div class="docs-tip-inner-right">

__NOTE:__ You should always enable `testMode` while testing your app. Several ad providers will cancel your account if you test against live ads!

</div>
</div>

At this point, a request to initialize the plugin will be complete with the proper `appId`s. Your `adListener` function will get called when the plugin finishes initializing. Until you get this event, you cannot make any additional calls to the plugin.

Notice the code also setup variables to hold our placement ID's (`adUnitId` for AdMob)

## Loading ads

Large format ads, such as interstitial ads or video-based ads need to be pre-loaded before you can show them. This is because it takes time to download the ad from the provider's servers. 

Part of your responsibility as an app developer using advertising is to use the advertising wisely. Ad best practices are beyond the scope of this tutorial, but it's important that pre-loading ads or caching ads be discussed at this point. If you view [this blog post](https://blog.appodeal.com/whats-display-rate/) from Appodeal, it talks about one of the problems of pre-loading or caching ads. 

If you always pre-load an ad, but you don't give your user a chance to view it until the user has completed, for example, five levels of your game, many users may not get to level five for some time. In situations like this, preloading an ad when your app starts is wasteful of your advertiser's ads. If you plan to have a User Interface (UI) button that lets the user view a rewarded video, for instance, you can pre-load the video when your app starts.

The code below uses an example of pre-loading on app start. Since you cannot load an ad before the plugin is initialized, you can use the `init` event as a signal that you can load your ads. Look at this modified `adListener` function:

``````lua
-- AdMob listener function
local function adListener( event )
    local json = require( "json" )
    print("Ad event: ")
    print( json.prettify( event ) )
 
    if ( event.phase == "init" ) then  -- Successful initialization
        print( event.provider )
        admob.load( "interstitial", { adUnitId = myInterstitialAdUnitId, hasUserConsent = true } )
        admob.load( "banner", { adUnitId = myBannerAdUnitId, hasUserConsent = true } )
        admob.load( "rewardedVideo", { adUnitId = myRewardedAdUnitId, hasUserConsent = true } )
	elseif event.phase == "failed" then
		if event.type == "banner" then
			-- Put your ad loading failover code here
			-- The most common failure reason is lack of ads to show, so simply try and load another ad
			-- You don't want to do this over and over. Eventually you should give up or try after a longer period of time
		elseif event.type == "interstitial" then
			-- Put your ad loading failover code here
		elseif event.type == "rewardedVideo" then
			-- Put your ad loading failover code here
		end
    elseif ( event.phase == "displayed" ) then -- Ads were loaded
        if event.type == "interstitial" then
            admob.load( "interstitial", { adUnitId = myInterstitialAdUnitId, hasUserConsent = true } )
        elseif event.type == "rewardedVideo" then
            admob.load( "rewardedVideo", { adUnitId = myRewardedAdUnitId, hasUserConsent = true } )
        end
    elseif ( event.phase == "reward" ) then -- A rewarded video was completed
    end
end
``````

This will only load one ad (of each type) once. Some plugins may automatically preload the first ad. After this ad is shown, you must load the next ad before you show it. If your plugin supports it, you can look for an `event.phase` that indicates the ad was successfully shown. This will vary between plugin providers. For AdMob you can use the `event.phase` of `displayed` to let you know you can load the next ad. See how the `adListener` function is doing quite a bit of work for you.

You will notice that there isn't an attempt to load banner ads after they have been displayed. Most ad providers will rotate banner ads based on a schedule and therefore will load the next ad to be shown for you. Some ad providers will hide a showing banner ad if you try to load a new one while the current one is showing.

If an ad type fails to load, you will get an `event.phase` of "failed". You can use this opportunity to attempt to load an ad from another plugin (i.e. set up your own ad waterfall.) You could also use a timer to wait for a few seconds and see if your primary ad provider has a new ad available. 

Setting up a waterfall system or a timed ad-reload system is beyond the scope of this tutorial.  

## Showing Ads

Showing ads, from a code perspective is very easy. But something that requires considerably more thought from an app design perspective. The hard question is "When should you show ads?"

### Banner ads

Many developers feel that showing banner ads during game play makes sense, rotating them periodically to generate more ad views. Depending on the game type, this can be a bad, wasteful use of advertising. Abuse of showing banner ads at a time when your users will not engage with them is one reason why the payout rate (eCPM) for these ads is so low.

If your game is one where the user is focused on play and looking at and interacting with the ad will cause them to fail at the game, or perform poorly, they __will not__ interrupt their play to interact with the ad. This is a bad time to show a banner ad. 

For example, in a card game like Solitaire, there are no time constraints on the user, so showing a banner ad during play is okay, but for a game like an endless runner, or a platformer game, the player will be focused on game play and they will not interact with your banner ad. Most games fall into this type of play. It's okay to show banner ads on menu screens, high score screens, next level screens or any time there is no time pressure on the user.

Assuming you're using Composer for scene management, in your scene where you want the banner ad to show up, simply add this to the `did` phase in the `scene:show()` function:

``````lua
function scene:show( event )
    if "did" == event.phase then
		local adTimer = nil
		local adShowAttempts = 10
		local function showAd()
			if adTimer then 
				timer.cancel( adTimer )
			end
			adShowAttempts = adShowAttempts - 1
			if adShowAttempts <= 0 then 
				return
			end
			if not admob.isLoaded( "banner" ) then
				adTimer = timer.performWithDelay( 500, showAd )
			else
				admob.show( "banner", { y = "bottom" } )
			end
		end
		adTimer = timer.performWithDelay( 100, showAd )
    end
end    
   
function scene:hide( event )
    if "will" == event.phase then
        admob.hide()
    end
end
``````
This will also automatically hide the banner ad when the scene terminates. 

If you're using your own scene control, you can use similar code in your own framework.

Let's break down the code a little bit. In a typical use case, you may want to show a banner ad on your menu. Normally, you want to get the menu on screen as quickly as possible. Since plugin initialization takes time and executes in the background, it's very likely you will get your menu on screen before the plugin finishes initialization. This code uses the completion of the initialization to load the first set of ads, which also will take time.

You may not be able to show the ad immediately upon showing your menu. It's more practical to test to see if the ad is ready to be shown and then call the [admob.show()][plugin/admob/show.html] API when the ad is ready.

Because of low fill rates or other reasons, you may not get an ad to show. You don't want to continuously check to see if the ad is ready. The above code will use a brief timer (100ms delay) to call a function that will attempt to show the ad. This gives the plugin time to initialize however it will only check a limited number of times before giving up.


### Interstitial ads

Interstitial ads are full screen ads. You will never want to show one of these during game play. These are good to show in between your game play and your next level/game over screen. However, if your game is one where play may only last a few seconds, then you may not want to show an ad every time the game is over. You may only want to show an ad every five times, for instance. 

There isn't a hard set rule on how long you should wait between showing an interstitial ad. You don't want to annoy the user to a point they remove your app. It's a balancing act. 

Interstitial ads pay significantly better than banner ads. You should consider using these in your game where possible.

It makes sense to show the ad when you go to your end of game scene, next level scene, etc. You can do this in the `scene:show()` function once the scene is on the screen.

``````lua
function scene:show( event )
    if "did" == event.phase then
		local adTimer = nil
		local adShowAttempts = 10
		local function showAd()
			if adTimer then 
				timer.cancel( adTimer )
			end
			adShowAttempts = adShowAttempts - 1
			if adShowAttempts <= 0 then 
				return
			end
			if not admob.isLoaded( "interstitial" ) then
				adTimer = timer.performWithDelay( 500, showAd )
			else
				admob.show( "interstitial" )
			end
		end
		adTimer = timer.performWithDelay( 100, showAd )
    end
end
``````

The user has to take an action to close the interstitial ad to get back to the app, so you don't need to do anything to hide the ad. You can implement similar tests to verify the ad is loaded before calling the show function


### Video ads

Video ads are like interstitial ads in that they are full screen and fully interrupt the user experience. You should consider showing these in the same places you would show an interstitial ad. In fact, for many ad plugins interstitial ads may be video ads. They would follow the same usage rules for showing ads as interstitial types.

### Rewarded video ads

Rewarded video ads are a special type of video ad where the user can earn some in-game reward for viewing these type of ads. Instead of ads that interrupt the game flow, like interstitial ads, these ads are generally tied to a button in your UI.

Maybe your button shows an icon for a video and a number of coins. When the user interacts with the video and watches it to completion then they will receive the reward.

__Important__ almost every ad provider that supports rewarded video will handle this part differently. In some cases, you may just get an event saying the reward was completed and it's up to your app to grant the reward. 

Another provider may let you setup multiple rewarded video placements that have different values. That is watch video placement A and get 50 coins, watch video placement B and get 10 gems. In this case, your event that you get in your `adListener` may tell you the amount and type of reward to give.

Other providers may require you to have a web server setup where you have a web script that the ad provider can call to record the reward and then when you get an event saying the rewarded video was complete, you can check with your server to get the amount and type of reward. This all should be documented on the ad provider's website.

In AdMob's case, there are no server requirements, but you will get an event "reward" that contains information about the reward. You will get a member in the event table called `event.data` that contains a JSON string that can be converted to a Lua table for your use. Consider these changes to the `adListener` function:

``````lua
-- AdMob listener function
local function adListener( event )
    local json = require( "json" )
    print("Ad event: ")
    print( json.prettify( event ) )
 
    if ( event.phase == "init" ) then  -- Successful initialization
        print( event.provider )
        admob.load( "interstitial", { adUnitId = myInterstitialAdUnitId, hasUserConsent = true } )
        admob.load( "banner", { adUnitId = myBannerAdUnitId, hasUserConsent = true } )
        admob.load( "rewardedVideo", { adUnitId = myRewardedAdUnitId, hasUserConsent = true } )
	elseif event.phase == "failed" then
		if event.type == "banner" then
			-- Put your ad loading failover code here
			-- The most common failure reason is lack of ads to show, so simply try and load another ad
			-- You don't want to do this over and over. Eventually you should give up or try after a longer period of time
		elseif event.type == "interstitial" then
			-- Put your ad loading failover code here
		elseif event.type == "rewardedVideo" then
			-- Put your ad loading failover code here
		end
    elseif ( event.phase == "displayed" ) then -- Ads were loaded
        if event.type == "interstitial" then
            admob.load( "interstitial", { adUnitId = myInterstitialAdUnitId, hasUserConsent = true } )
        elseif event.type == "rewardedVideo" then
            admob.load( "rewardedVideo", { adUnitId = myRewardedAdUnitId, hasUserConsent = true } )
        end
    elseif ( event.phase == "reward" ) then -- A rewarded video was completed
        local data = json.decode( event.data )
        local rewardAmount = data.rewardAmount
        local rewardItem = data.rewardItem
        -- code to give these to your user
    end
end
``````

Going into how to give these rewards to your user is beyond the scope of this tutorial.

To show the rewarded video, create a button in your user interface in whatever button method you like (i.e., [widget.newButton()][api.library.widget.newButton], [display.newImageRect()][api.library.display.newImageRect] with a `touch` or `tap` listener, etc.) and in the function that handles the button interaction, call the `.show()` function.

``````lua
local function handleRewardedVideoButton( event )
    if "began" == event.phase then -- touch type event
        admob.show( "rewardedVideo" )
    end
    return true
end
``````

You should consider also testing to see if the ad is available before presenting the UI button to the user.

To learn more about rewarded ads and implementation strategies [view this article from AppsFlyer](https://www.appsflyer.com/blog/videos/rewarded-video-ad-monetization/).

## Debugging ads

Because ad plugins only work on Android and iOS devices, you can only test them on a real device. Live Builds can help with the building and testing phase, but unless you're on a Mac and still have the Simulator's console log reading your device's console log, you can't get information from the device to see what's going on.

If you're on a Mac, you can just have CORONA_CORE_PRODUCT install the app to your device that's tethered via USB as long as you don't close the "build complete" dialog box. Messages from your device and app will show in the CORONA_CORE_PRODUCT console log. If you close that dialog or you do not have a Mac, then you have to use other tools to watch the device's console log.

For iOS, you can use Xcode's `Devices & Simulators` window and watch the device's console log. For Android, you can install a command line tool called `adb` or Android Debug Bridge. How to install `adb` is beyond the scope of this tutorial as is learning how to run it on your computer. There are plenty of general tutorials on the Internet for setting this up.

Assuming you can now see the device's console log, what are you looking for?

All ad plugin providers return information with each event they generate: information like the `phase` of the event, if it's an error or not, a text response as to what any errors were about, and more information.

The easiest way for you to learn what's going on with your app is to read this information. This is done simply by printing out the contents of the event table. CORONA_CORE_PRODUCT offers a very simple API call that lets you easily dump the contents of any table. If you look at the beginning of the `adListener()` function you will find this code:

``````lua
-- AdMob listener function
local function adListener( event )
    local json = require( "json" )
    print("Ad event: ")
    print( json.prettify( event ) )
end
``````

This includes the JSON library. You can of course move the line that requires the library to the top of your `main.lua` or if you're already including it, you can skip it here. The magic happens on the second print statement.

Using the [json.prettify][api.library.json.prettify] function along with a print statement, CORONA_CORE_PRODUCT will take the Lua table, convert it to a JSON string for you and then print the JSON string in a very readable format. You should get something that looks like:
``````lua
Nexus 9: {
Nexus 9:   "data":"{"errorMsg":"No Ads Available","errorCode":3,"adUnitId":"ca-app-pub-xxxxxxxxxxxxxxxxx/xxxxxxxxxxx"}",
Nexus 9:   "name":"adsRequest",
Nexus 9:   "phase":"failed",
Nexus 9:   "provider":"admob",
Nexus 9:   "response":"loadFailed",
Nexus 9:   "type":"rewardedVideo",
Nexus 9:   "isError":false
Nexus 9: }
``````

You can see what the `event.phase` is. Did you get a `loaded` event? Did you get a `reward` event? You also get an `event.response` event. Does it tell you there are no ads available? Does it tell you that you have a configuration problem? Armed with this output, if you can't solve the problem on your own, you now have information that you can copy and paste into a forum message asking the community for help.

This is a critical step that many people trying to implement ads fail to look at. When you post to the forums asking "I implemented XYZ ad plugin correctly and I'm not getting ads, what is wrong?", it is impossible to answer your question without a copy of your code and console log output showing these important print statements.

## Conclusion

Implementing ads has a lot of moving parts between the ad provider portal setup, the minimum implementation code and of course your ad placement. But through some patience and understanding your apps flow, you can build a successful monetization plan in your app or game.

Just remember: Don't annoy your users. Don't waste your advertisers inventory. Don't violate the stores' guidelines by building an app that's more ads than content or other violations [that can get you banned](https://blog.appodeal.com/how-do-i-keep-app-from-getting-banned/). To get more context on these concepts look at [this article from GameAnalytics](https://gameanalytics.com/blog/popular-mobile-game-ad-formats.html) and scroll down to the "The 5 Essentials Of Running Ads In Mobile Games" section. 

Don't hesitate to ask for help. We have a great community of developers who are willing to help you out in [forums](https://forums.solar2d.com/) and [Discord](https://discord.com/invite/Abf5V9G).

