
# event.target

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [DisplayObject][api.type.DisplayObject]
> __Event__             [completion][api.event.completion]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          completion, target
> --------------------- ------------------------------------------------------------------------------------------

## Overview

The display image object generated after a user completes a camera session.

## Example
 
``````lua
local function onComplete( event )
	local photo = event.target
	print( "photo w,h = " .. photo.width .. "," .. photo.height )
end

if media.hasSource( media.PhotoLibrary ) then
	media.selectPhoto( { mediaSource=media.PhotoLibrary, listener=onComplete } )
else
	native.showAlert( "Corona", "This device does not have a photo library.", { "OK" } )
end
``````
