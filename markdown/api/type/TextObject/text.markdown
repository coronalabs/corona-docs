# object.text

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Object__            [TextObject][api.type.TextObject]
> __Library__           [display.*][api.library.display]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          text, string, label
> __See also__          [textObject.size][api.type.TextObject.size]<br/>[display.newText()][api.library.display.newText]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Retrieves or sets the text string of a [text object][api.type.TextObject].

## Gotchas

When you change the text string of a [text object][api.type.TextObject], you should also reset its anchor point and __x__/__y__ position again. Doing this ensures that the object remains aligned to the original position.

## Example

``````lua
local myText = display.newText( "Hello", 0, 0, native.systemFont, 12 )
myText.x = 50 ; myText.y = 50
myText:setFillColor( 1, 1, 1 )
myText.anchorX = 0

-- Change the text
myText.text = "Hello World!"
``````