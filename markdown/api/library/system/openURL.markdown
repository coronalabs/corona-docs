# system.openURL()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [system.*][api.library.system]
> __Return value__      [Boolean][api.type.Boolean]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          system, openURL, URL
> __See also__			[system.canOpenURL()][api.library.system.canOpenURL]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Open a web page in the browser, create an email, or dial a phone number. Executing this function will close the app and switch to the <nobr>built-in</nobr> browser, email, or phone app.

You can check whether a URL can be opened via the [system.canOpenURL()][api.library.system.canOpenURL] function.

## Syntax

	system.openURL( url )

##### url ~^(required)^~
_[String][api.type.String]._ One of the following:

* Email address — `"mailto:nobody@mycompany.com"`, optionally including <nobr>URL-encoded</nobr> subject and body parameters, for example:<br/>`"mailto:nobody@mycompany.com?subject=Hi%20there&body=I%20just%20wanted%20to%20say%2C%20Hi!"`
* Phone number — `"tel:123-456-7890"`
* Web link — `"https://solar2d.com/"`

## Gotchas

On Android, if dialing a phone number, you must add the `CALL_PHONE` permission to the `build.settings` file.

``````lua
settings =
{
	android =
	{
		usesPermissions =
		{
			"android.permission.CALL_PHONE",
		},
	},
}
``````

## Examples

##### Open Web Page in Device Browser

``````lua
system.openURL( "https://solar2d.com/" )
``````

##### Send Email via Device Mail Application

``````lua
system.openURL( "mailto:nobody@mycompany.com" )
``````

##### Dial a Phone Number

``````lua
system.openURL( "tel:123-456-7890" )
``````