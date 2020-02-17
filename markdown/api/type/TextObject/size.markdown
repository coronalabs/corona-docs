# object.size

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Object__            [TextObject][api.type.TextObject]
> __Library__           [display.*][api.library.display]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          text, size, font size
> __See also__          [textObject.text][api.type.TextObject.text]
>						[display.newText()][api.library.display.newText]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Retrieves or sets the text size pertaining to a [text object][api.type.TextObject].

Setting this property to `nil` or `0` will make the object use the system's default font size.

## Example

``````lua
local myText = display.newText( "", 0, 0, native.systemFont, 12 )
myText:setFillColor( 1, 1, 1 )

myText.text = "Hello World!"
myText.size = 16
``````