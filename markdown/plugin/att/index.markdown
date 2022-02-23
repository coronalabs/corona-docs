# plugin.att (App Tracking Transparency)

> --------------------- ------------------------------------------------------------------------------------------
> __Type__				[Library][api.type.Library]
> __Revision__			[REVISION_LABEL](REVISION_URL)
> __Keywords__			Ads, Monetization, Apple, App Tracking Transparency
> __Platforms__			iOS, tvOS
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Starting with iOS14 Apple requires to request explicit permission for ad tracking. This plugin allows to show the pop up and check permission status. Make sure to add descriptive string as well.

### Native code examples

This plugin implements what you need when Ad provider asks you to implement something like this in your native app:

```
  ATTrackingManager.requestTrackingAuthorization(completionHandler: { status in
	....
  })
```

## Project Settings

To use this plugin your `build.settings` should contain following entries:

``````lua
settings = 
{
	iphone =
	{
		plist =
		{
			NSUserTrackingUsageDescription = "This would allow the app to advertise better.",
		},
	},
	plugins =
	{
		['plugin.att'] = { publisherId = 'com.solar2d' },
	}
}
``````

## Syntax

	local att = require( "plugin.att" )

## Functions

#### [att.request(listener)][plugin.att.request]

#### [att.status][plugin.att.status]

## Example

``````lua
local att = require "plugin.att"

local status = att.status
local statusText = display.newText( status, display.contentCenterX, display.contentCenterY*0.5, nil, 14 )



local eventText = display.newText( "tap to request", display.contentCenterX, display.contentCenterY*1.5, display.contentWidth*0.5, display.contentHeight*0.25, nil, 14 )

local function attListener(e)
	eventText.text = "Status is " .. tostring(e.status)
end

local function tapListener()
	att.request(attListener)
end

Runtime:addEventListener( "tap", tapListener)
``````
