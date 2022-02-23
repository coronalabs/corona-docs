# Address Book

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [CoronaProvider][api.type.CoronaProvider]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          native, showPopup, address, contacts
> __Platforms__			iOS
> --------------------- ------------------------------------------------------------------------------------------

## Overview

The Address Book plugin enables you to access a user's address book and contacts via the [native.showPopup()][plugin.CoronaProvider_native_popup_addressbook.showPopup] API.


## Gotchas

You must include the following keys/descriptions in the `plist` table of `build.settings`. When the system prompts the user to allow access, the associated description is displayed as part of the alert. Note that these descriptions can be customized to your preference and they can even be localized \([guide][guide.distribution.localization]\).

``````lua
settings =
{
	iphone =
	{
		plist =
		{
			NSContactsUsageDescription = "This app would like to access your contacts.",
		},
	},
}
``````


## Functions

#### [native.showPopup()][plugin.CoronaProvider_native_popup_addressbook.showPopup]


## Project Settings

To use this plugin, add an entry into the `plugins` table of `build.settings`. When added, the build server will integrate the plugin during the build phase.

``````lua
settings =
{
	plugins =
	{
		["CoronaProvider.native.popup.addressbook"] =
		{
			publisherId = "com.coronalabs"
		},
	},
}
``````


## Support

* [Corona Forums](http://forums.coronalabs.com/forum/631-corona-premium-plugins/)
