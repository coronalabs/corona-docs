# Implementing Game Leaderboards

Implementing __leaderboards__ is an activity which many developers want to understand so that they can include them among their game features. Corona supports various services for managing leaderboards including [Google Play Games Services][plugin.gpgs] and [Apple Game Center][plugin.gameNetwork-apple].

This tutorial will outline one way of setting up your game to use both <nobr>Google Play Games Services</nobr> __and__ <nobr>Apple Game Center</nobr>.

<div class="guide-notebox">
<div class="notebox-title">Note</div>

This tutorial does not outline setting up your game(s) in iTunes&nbsp;Connect or Google&nbsp;Play. Please refer to the many online resources for those instructions.

</div>


## Collecting Information

### Google

For <nobr>Google Play Games Services</nobr>, you will need to gather various details from the [Google Play Developer Console](https://console.developers.google.com/), including:

1. Your __license&nbsp;key__, a very long string found within the developer console.

2. Your <nobr>__Google Play Games App ID__</nobr>.

3. The string that identifies your leaderboard&nbsp;&mdash; this looks something like `CgkA8kb12jK0onOQBg`.

Keep record of all this information since you'll need to provide it to your Corona app.

### Apple

Apple Game Center also requires you to gather some information for your app code. When you create a leaderboard, you'll be asked to give it a unique name. It's recommended that you follow the <nobr>reverse-domain</nobr> naming scheme such as `com.yourdomain.yourgame.leaderboardname`. Make a note of this since you'll need to specify it within your Corona app.


## Project Settings

For each respective service, you'll need to include the information gathered above within specific areas of your Corona project.

### Google

Details on the necessary [Google Play Games Services][plugin.gpgs] settings can be found in the [documentation][plugin.gpgs], but here's an overview on the necessary aspects:

1. Implement Google app licensing as outlined [here][api.library.licensing] and sign the `.apk` with a private key as outlined [here][guide.distribution.androidBuild#signrelease].

2. Ensure that you have enabled both __Drive&nbsp;API__ and <nobr>__Google Play Developer API__</nobr> within the [Google Play Developer Console](https://console.developers.google.com/).

3. Add an entry into the `plugins` table of `build.settings` for the <nobr>Google Play Games Services</nobr> plugin:

<div class="code-indent">

``````{ brush="lua" gutter="false" first-line="1" highlight="[5,6,7,8,9]" }
settings = {

	plugins =
	{
		["plugin.gpgs.v2"] =
		{
			publisherId = "com.coronalabs",
			supportedPlatforms = { android=true }
		},
	},
}
``````

</div>

4. Specify the <nobr>Google Play Games App ID</nobr> in the `android` table of `build.settings` as the `googlePlayGamesAppId` key:

<div class="code-indent">

``````{ brush="lua" gutter="false" first-line="1" highlight="[5]" }
settings = {

	android =
	{
		googlePlayGamesAppId = "YOUR_APPLICATION_ID",
	},
}
``````

</div>

### Apple

[Apple Game Center][plugin.gameNetwork-apple] is a bit easier&nbsp;&mdash; basically, just include the plugin within the `plugins` table of `build.settings` as follows:

``````{ brush="lua" gutter="false" first-line="1" highlight="[5,6,7,8]" }
settings =
{
	plugins =
	{
		["CoronaProvider.gameNetwork.apple"] =
		{
			publisherId = "com.coronalabs"
		},
	},
}
``````


## Data Module

In the [Goodbye Globals!][tutorial.basics.globals] tutorial, we outlined how to use a __data&nbsp;module__ to share information between scenes and modules. This technique will be used again to store the various game networking plugin handles used in this tutorial.

1. To begin, create a new blank Lua file named `globalData.lua` and save it to your project directory. Inside, include the following lines:

<div class="code-indent">

``````{ brush="lua" gutter="true" first-line="1" }
-- Pseudo-global space
local M = {}

return M
``````

</div>

2. Now, in the `main.lua` file, `require()` the data module and add two variables to its table, `globalData.gpgs` and `globalData.gameCenter`, both initially set to `nil`. These will hold the plugin handles for later use.

<div class="code-indent">

``````{ brush="lua" gutter="true" first-line="1" }
local globalData = require( "globalData" )
local json = require( "json" )

globalData.gpgs = nil
globalData.gameCenter = nil
``````

<div class="docs-tip-outer">
<div class="docs-tip-inner-left">
<div class="fa fa-cog"></div>
</div>
<div class="docs-tip-inner-right">

Note that we also `require()` the [JSON][api.library.json] library. This is not essential for all implementations, but we'll use JSON in this tutorial to output game network response data to the console.

</div>
</div>

</div>

## Platform Detection

Next, let's test to see what platform the user is on. If it's an Android device, we'll `require()` <nobr>Google Play Games Services</nobr>; if&nbsp;iOS, we'll `require()` <nobr>Apple Game Center</nobr>. Note that each respective inclusion is stored in the `globalData` handles configured above.

``````{ brush="lua" gutter="true" first-line="1" highlight="[7,8,9,10,11,12,13,14]" }
local globalData = require( "globalData" )
local json = require( "json" )

globalData.gpgs = nil
globalData.gameCenter = nil

local platform = system.getInfo( "platform" )
local env = system.getInfo( "environment" )

if ( platform == "android" and env ~= "simulator" ) then
	globalData.gpgs = require( "plugin.gpgs.v2" )
elseif ( platform == "ios" and env ~= "simulator" ) then
	globalData.gameCenter = require( "gameNetwork" )
end
``````


## Game Network Initialization

Now we're ready to initialize and log the user in to the proper game network. For this, we'll first need to add __listener&nbsp;functions__ to handle game network initialization events. Since Lua is a <nobr>one-pass</nobr> compiler, you need to write your code in reverse order. The basic workflow is to initialize the plugin which will trigger an event that will be processed in a listener function.

<div class="docs-tip-outer">
<div class="docs-tip-inner-left">
<div class="fa fa-cog"></div>
</div>
<div class="docs-tip-inner-right">

This is one major point where <nobr>Google Play Games Services</nobr> and <nobr>Apple Game Center</nobr> differ. For Apple, the initialization process automatically logs the user in, but for Google, you must explicitly call a command to log the user in. Also, the GPGS v2 plugin no longer has a `.init()` call. You just to need to login.

</div>
</div>

``````{ brush="lua" gutter="true" first-line="16" }
-- Google Play Games Services initialization/login listener
local function gpgsInitListener( event )

	if not event.isError then
		if ( event.name == "login" ) then  -- Successful login event
			print( json.prettify(event) )
		end
	end
end

-- Apple Game Center initialization/login listener
local function gcInitListener( event )

	if event.data then  -- Successful login event
		print( json.prettify(event) )
	end
end
``````

<div class="guide-notebox">
<div class="notebox-title">Note</div>

You can perform additional tasks upon successful login, for instance requesting player information, but for the purpose of this tutorial, we simply output the values returned by the event.

</div>

With the listener functions in place, we can now initialize the game network depending on which platform the user is on:

``````{ brush="lua" gutter="true" first-line="38" }
-- Initialize game network based on platform
if ( globalData.gpgs ) then
	-- Initialize Google Play Games Services
	globalData.gpgs.login( { userInitiated=true, listener=gpgsInitListener } )

elseif ( globalData.gameCenter ) then
	-- Initialize Apple Game Center
	globalData.gameCenter.init( "gamecenter", gcInitListener )
end
``````


## Sending Scores to the Leaderboard

Now that we have the game network initialized and the user is logged in, we're ready to transmit scores. Normally you would do this after the game is over, or perhaps after the player accomplishes something noteworthy. If you're tracking the user's high score locally, you can choose to only transmit a score that you know to be a high score, or alternatively you can send the score to <nobr>Google Play Games Services</nobr> or <nobr>Apple Game Center</nobr> anyway and let the service decide if it needs to record a high score.

For this, similar to the initialization process, we'll need a listener function for submitted scores:

``````{ brush="lua" gutter="true" first-line="48" }
local function submitScoreListener( event )

	-- Google Play Games Services score submission
	if ( globalData.gpgs ) then

		if not event.isError then
			local isBest = nil
			if ( event.scores["daily"].isNewBest ) then
				isBest = "a daily"
			elseif ( event.scores["weekly"].isNewBest ) then
				isBest = "a weekly"
			elseif ( event.scores["all time"].isNewBest ) then
				isBest = "an all time"
			end
			if isBest then
				-- Congratulate player on a high score
				local message = "You set " .. isBest .. " high score!"
				native.showAlert( "Congratulations", message, { "OK" } )
			else
				-- Encourage the player to do better
				native.showAlert( "Sorry...", "Better luck next time!", { "OK" } )
			end
		end

	-- Apple Game Center score submission
	elseif ( globalData.gameCenter ) then

		if ( event.type == "setHighScore" ) then
			-- Congratulate player on a high score
			native.showAlert( "Congratulations", "You set a high score!", { "OK" } )
		else
			-- Encourage the player to do better
			native.showAlert( "Sorry...", "Better luck next time!", { "OK" } )
		end
	end
end
``````

<div class="docs-tip-outer">
<div class="docs-tip-inner-left">
<div class="fa fa-cog"></div>
</div>
<div class="docs-tip-inner-right">

Note that because each network returns different data, we must test for the proper network and handle returned data independently.

</div>
</div>

With the listener function in place, we can now submit a score to either of the respective services. For this task, you will need the leaderboard identifiers that you acquired from Google or created for Apple. These must __exactly__ match what the service is expecting.

For convenience later on, let's wrap this in a function which accepts a single `score` parameter:

``````{ brush="lua" gutter="true" first-line="85" }
local function submitScore( score )

	if ( globalData.gpgs ) then
		-- Submit a score to Google Play Games Services
		globalData.gpgs.leaderboards.submit(
		{
			leaderboardId = "CgkA8kb12jK0onOQBg",
			score = score,
			listener = submitScoreListener
		})

	elseif ( globalData.gameCenter ) then
		-- Submit a score to Apple Game Center
		globalData.gameCenter.request( "setHighScore",
		{
			localPlayerScore = {
				category = "com.yourdomain.yourgame.leaderboard",
				value = score
			},
			listener = submitScoreListener
		})
	end
end
``````

Now, submitting a score is as easy as calling the `submitScore()` function, for example:

``````{ brush="lua" gutter="false" first-line="1" highlight="[1]" }
submitScore( 10000 )
``````


## Showing the Leaderboard

Games which include leaderboards must logically provide some way for players to view them. This might be triggered from the listener handler of a [button widget][api.library.widget.newButton] or, alternatively, it could be shown after the user achieves <nobr>(or fails to achieve)</nobr> a high score within the `submitScoreListener()` function we already created.

Whatever the method, showing a leaderboard can be done like this:

``````lua
if ( globalData.gpgs ) then
	-- Show a Google Play Games Services leaderboard
	globalData.gpgs.leaderboards.show( "CgkA8kb12jK0onOQBg" )

elseif ( globalData.gameCenter ) then
	-- Show an Apple Game Center leaderboard
	globalData.gameCenter.show( "leaderboards",
	{
		leaderboard = {
			category = "com.yourdomain.yourgame.leaderboard"
		}
	})
end
``````


## Conclusion

While your own game networking implementation can&nbsp;&mdash; and probably should&nbsp;&mdash; extend beyond just leaderboards, hopefully this tutorial gives you a solid foundation for building <nobr>cross-platform</nobr> game networking functionality using [Google Play Games Services][plugin.gpgs] and [Apple Game Center][plugin.gameNetwork-apple].
