# object.anchorChildren

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Object__            [GroupObject][api.type.GroupObject]
> __Library__           [display.*][api.library.display]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          anchorChildren, anchor
> __See also__          [Group Programming][guide.graphics.group] _(guide)_
> --------------------- ------------------------------------------------------------------------------------------

## Overview

By default, display groups do not respect anchor points. However, you can achieve anchor behavior on a display group by setting this property to `true`.

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Note</div>

Setting this property does not force an immediate update of the group, although other display properties will do so. This was assumed to be an oversight and fixed along with some sprite trimming issues. To opt-in to these fixes, set the [default][api.library.display.setDefault] of `"isImageSheetFrameTrimCorrected"` to `true`.

</div>

## Example

``````lua
local myGroup = display.newGroup()

local myBox = display.newRect( 100, 100, 80, 80 )
myBox:setFillColor( 1, 0, 0, 0.8 )
myGroup:insert( myBox )

myGroup.x = 50
myGroup.y = 50

--Add a smaller blue box
local blueBox = display.newRect( 50, 50, 50, 50 )
blueBox:setFillColor( 0, 0, 1, 0.8 )
myGroup:insert( blueBox )

myGroup.anchorChildren = true
``````