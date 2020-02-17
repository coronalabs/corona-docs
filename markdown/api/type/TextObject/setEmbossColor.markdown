# object:setEmbossColor()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Object__            [DisplayObject][api.type.DisplayObject]
> __Library__           [display.*][api.library.display]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          setEmbossColor, text, color
> __See also__          [display.newEmbossedText()][api.library.display.newEmbossedText]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Sets the color parameters for an embossed text object created via [display.newEmbossedText()][api.library.display.newEmbossedText].


## Syntax

	object:setEmbossColor( colorTable )

##### colorTable ~^(required)^~
_[Table][api.type.Table]._ A table which must include two named sub-tables for the `highlight` and `shadow` of the embossed text object. Each of these tables should contain the RGB+A color values for the respective property.

## Example

`````lua
local myText = display.newEmbossedText( "hello", 200, 100, native.systemFont, 40 )
myText:setFillColor( 0.5 )
myText:setText( "Hello World!" )

local color = 
{
    highlight = { r=1, g=1, b=1 },
    shadow = { r=0.3, g=0.3, b=0.3 }
}
myText:setEmbossColor( color )
`````
