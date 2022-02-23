# plugin.vk.direct.*

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Library][api.type.Library]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          VK, Vkontakte, VK Direct, VK Direct Games
> __Platforms__         HTML5
> --------------------- ------------------------------------------------------------------------------------------


## Overview

The [VK Direct Games](https://marketplace.coronalabs.com/plugin/com.coronalabs/plugin.vk.direct) plugin, simple wrapper for [VK Mobile](https://vk.com/dev/direct_games). For more information please, refer to [Mobile Client API documentation](https://vk.com/dev/Mobile_SDK?f=2.%20%D0%9C%D0%B5%D1%82%D0%BE%D0%B4%D1%8B%20Mobile%20Client%20API)

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

Note, that APIs would actually work only when app is ran as VK Direct Game on mobile device. To learn more about how to create and deploy your applications see Direct Games [documentation](https://vk.com/dev/direct_games).

</div>

## Syntax

	local vk = require("plugin_vk_direct")


## Functions

### `vk.init(function)`

Initializes the plugin and sets event listener to handle events from VK APIs. Event structure is described in the following section.

<br />

### `vk.api(methodName, params)`
This method call would trigger `VK.api(methodName, params)` and invoke event name with `method` set to `methodName`.

<br />

All following functions are wrappers around Mobile SDK methods with same name. Please, refer to [documentation](https://vk.com/dev/Mobile_SDK?f=2.%20%D0%9C%D0%B5%D1%82%D0%BE%D0%B4%D1%8B%20Mobile%20Client%20API) for details.

### `vk.showInviteBox()`
### `vk.showRequestBox(user_id, message, request_key)`
### `vk.showShareBox(message, attachments, target)`
### `vk.showSettingsBox(settings)`
### `vk.showOrderBox(type, item)`
### `vk.showLeaderboardBox(user_result)`

This methods are aliases for `VK.callMethod(methodName, {arguments})`. Result would be dispatched to event listener with `method` field set to the function name.

## Event

Each API call would result in event sent to listener passed to `vk.init()`. All events have similar 3 fields:

##### `event.name`
_[String][api.type.String]._ Always `"vk"`.

##### `event.method`
_[String][api.type.String]_ containing name of the method callback is invoked for. For example `"init"` or `"showInviteBox"`. Note that this would have different value in `vk.api()` callback.

##### `event.status`
_[String][api.type.String]_ containing `"success"` or `"failure"` depending on call results.

##### `event.data`
_[Table][api.type.Table]_ containing call results if applicable.



## Project Settings

To use this plugin, add an entry into the `plugins` table of `build.settings`. When added, the build server will integrate the plugin during the build phase.

``````{ brush="lua" gutter="false" first-line="1" highlight="[5,6,7,8]" }
settings =
{
	plugins =
	{
		["plugin.vk.direct"] =
		{
			publisherId = "com.coronalabs"
		},
	},
}
``````


## Sample

``````{ brush="lua" gutter="false" first-line="1" }

local loadingText = display.newText( "Loading...", display.contentCenterX, display.contentCenterY, nil, 20)

local vk = require("plugin_vk_direct")

local function vkListener( event )
    if event.method == "init" then
        if event.status == "success" then
            composer.gotoScene( "menu" )
            loadingText:removeSelf( )
        else
            loadingText.text = "VK Initialization error"
        end
    end
end

vk.init(vkListener)


``````