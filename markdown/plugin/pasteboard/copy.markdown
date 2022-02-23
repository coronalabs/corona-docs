# pasteboard.copy()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          copy, pasteboard
> __See also__          [Pasteboard][plugin.pasteboard]
>								[pasteboard.paste()][plugin.pasteboard.paste]
>								[pasteboard.clear()][plugin.pasteboard.clear]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Copies a string, URL, or image to the device pasteboard.


## Gotchas

Image copying/pasting is only supported on iOS.


## Syntax

	pasteboard.copy( copyType, string )
	pasteboard.copy( copyType, url )
	pasteboard.copy( copyType, fileName, baseDir ) 

##### copyType ~^(required)^~
_[String][api.type.String]._ The type of data to copy to the pasteboard. Valid options include `"string"`, `"url"`, or `"image"`.

##### string ~^(optional)^~
_[String][api.type.String]._ The string you wish to copy to the pasteboard. Applies only if `copyType` is `"string"`.

##### url ~^(optional)^~
_[String][api.type.String]._ The URL you wish to copy to the pasteboard. Applies only if `copyType` is `"url"`.

##### fileName ~^(optional)^~
_[String][api.type.String]._ The file name of the image you wish to copy to the pasteboard. Applies only if `copyType` is `"image"`. Note that image copying/pasting is only supported on iOS.

##### baseDir ~^(optional)^~
_[Constant][api.type.Constant]._ The system [path][api.library.system.pathForFile] to load the image from. Applies only if `copyType` is `"image"`. Note that image copying/pasting is only supported on iOS.


## Example

``````lua
local pasteboard = require( "plugin.pasteboard" )

pasteboard.copy( "string", "Hello World!" )
``````