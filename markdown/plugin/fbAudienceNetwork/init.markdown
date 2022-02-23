# fbAudienceNetwork.init()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, Facebook Audience Network, fbAudienceNetwork, init
> __See also__          [fbAudienceNetwork.load()][plugin.fbAudienceNetwork.load]
>						[fbAudienceNetwork.show()][plugin.fbAudienceNetwork.show]
>						[fbAudienceNetwork.*][plugin.fbAudienceNetwork]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

`fbAudienceNetwork.init()` initializes the Facebook Audience Network.

Once initialized, you can load an ad using [fbAudienceNetwork.load()][plugin.fbAudienceNetwork.load] and subsequently show it via [fbAudienceNetwork.show()][plugin.fbAudienceNetwork.show].

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

Facebook has a method for calling test ads which is different from other Corona ad providers. To test ads during implementation of this plugin, you must follow their requirements as follows:

* Each testing device must be initialized within the system via a device hash ID. To gather a hash&nbsp;ID, you must first build and install your app on the device with a basic implementation of the Facebook Audience Network plugin. Next, call [fbAudienceNetwork.load()][plugin.fbAudienceNetwork.load]. At this point, with the device connected, the app will output a message similar to the following to the device console log:

<div class="code-indent">

`Test mode device hash: [HASHID]`

This device hash can be used as one of the device hash IDs outlined below. For more information on accessing the device console log, see the __Device&nbsp;Debugging__ sections of the [Debugging Guide][guide.basics.debugging].

</div>

* If you uninstall/remove your app from the device and then build/install it again, Facebook will generate a __new__ device hash ID which you must update in your code.

</div>


## Syntax

	fbAudienceNetwork.init( adListener [, params] )

##### adListener ~^(required)^~
_[Listener][api.type.Listener]._ Listener function that will receive [adsRequest][plugin.fbAudienceNetwork.event.adsRequest] events.

##### params ~^(optional)^~
_[Table][api.type.Table]._ Table containing additional parameters &mdash; see the next section for details.


## Parameter Reference

The `params` table includes the following additional parameters:

##### testDevices ~^(optional)^~
_[Array][api.type.Array]._ Optional __except__ when testing on devices. An array of device hash IDs, for instance <nobr>`{ "deviceID1", "deviceID2" }`</nobr>.

<div class="guide-notebox">
<div class="notebox-title">Notes</div>

* When you are ready to distribute the app or test with real ads, you should __not__ pass the `testDevices` parameter to this function.

* Testing with real ads is a two-step process. The first step is to add testers to your app settings in the [Facebook Developer Portal](https://developers.facebook.com/apps/) so they can see real ads before the app is approved. The second step is for those testers to be logged in to the Facebook app on the same device where your app is installed. See [here](https://developers.facebook.com/docs/audience-network/testing) for more information.

</div>

##### advertiserTrackingEnabled ~^(optional)^~
_[Boolean][api.type.Boolean]._ Optional. If set, [`setAdvertiserTrackingEnabled`](https://developers.facebook.com/docs/audience-network/guides/advertising-tracking-enabled) would be invoked with the value.


## Example

``````lua
local fbAudienceNetwork = require( "plugin.fbAudienceNetwork" )

local function adListener( event )

	if ( event.phase == "init" ) then  -- Successful initialization
		print( event.isError )
	end
end

-- Initialize the Facebook Audience Network
fbAudienceNetwork.init( adListener )
``````
