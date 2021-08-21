# object:request()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Object__            [WebView][api.type.WebView]
> __Library__           [native.*][api.library.native]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          request       
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Loads the specified URL (string) into the [WebView][api.type.WebView]. For local content, you must specify a base [system][api.library.system] directory as a search path.

## Syntax

	object:request( url )
	object:request( url, baseDir )

##### url ~^(required)^~
_[String][api.type.String]._ The URL to load. For local files, this is a path relative to `baseDir`.

##### baseDir ~^(optional)^~
_[Constant][api.type.Constant]._ A base directory constant.


## Gotchas

On Android, if the web view is displaying web pages from the Internet, you must add the `INTERNET` permission to the `build.settings` file. This permission is unnecessary if the web view will only be displaying local HTML files that do not access the Internet.

`````lua
settings =
{
    android =
    {
        usesPermissions =
        {
            "android.permission.INTERNET",
        },
    },
}
`````

## Example

``````lua
local webView = native.newWebView( 0, 0, 320, 480 )
webView:request( "https://solar2d.com/" )
``````
