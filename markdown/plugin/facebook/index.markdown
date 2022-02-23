# facebook.* (legacy)

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Library][api.type.Library]
> __Library__           [facebook.*][api.library.facebook]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          facebook
> __Platforms__			Android, iOS
> --------------------- ------------------------------------------------------------------------------------------

## Overview

This plugin provides access to Facebook Connect, a set of APIs for accessing the Facebook social network. The functions allow a user to login/logout, post messages and images, and retrieve status.

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

This is the __legacy__ plugin for Facebook. As of October&nbsp;30,&nbsp;2016, Facebook's <nobr>Graph API v2.1</nobr> will no longer be available. Thus, we encourage all Corona developers to upgrade to the latest [Facebook plugin][plugin.facebook-v4] which supports <nobr>Graph API v2.8</nobr>.

</div>


## Registration

Developing for Facebook requires that you register in the [Facebook Developer Portal](https://developers.facebook.com/apps).


## Syntax

	local facebook = require( "facebook" )


## Functions

#### [facebook.login()][plugin.facebook.login]

#### [facebook.logout()][plugin.facebook.logout]

#### [facebook.request()][plugin.facebook.request]

#### [facebook.showDialog()][plugin.facebook.showDialog]

#### [facebook.publishInstall()][plugin.facebook.publishInstall]


## Properties

#### [facebook.accessDenied][plugin.facebook.accessDenied]


## Project Settings

To use this plugin, add an entry into the `plugins` table of `build.settings`. When added, the build server will integrate the plugin during the build phase.

``````lua
settings = {

	plugins =
	{
		["facebook"] =
		{
			publisherId = "com.coronalabs"
		},
	},
}
``````


## Support

* [http://developers.facebook.com/](http://developers.facebook.com/)
* [Corona Forums](http://forums.coronalabs.com/forum/110-social-media/)