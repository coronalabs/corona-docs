
# display.newText()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [display.*][api.library.display]
> __Return value__      [TextObject][api.type.TextObject]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          text, text object
> __See also__          [Using Custom Fonts][guide.system.customFont] _(guide)_
>						[Display Objects][guide.media.displayObjects] _(guide)_
>						[display.newEmbossedText()][api.library.display.newEmbossedText]
>						[object:setFillColor()][api.type.ShapeObject.setFillColor]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Creates a [text object][api.type.TextObject]. The local origin is at the center of the text and the [anchor point][guide.graphics.transform-anchor] is initialized to this local origin.

Text is wrapped either at newlines or by specifying a `width` and `height` when the object is created.

By default, the text color is white <nobr>`( 1, 1, 1 )`</nobr>. See [object:setFillColor()][api.type.ShapeObject.setFillColor] for more information.


## Syntax

	display.newText( options )

This function takes a single argument, `options`, which is a table that accepts the following parameters:

##### parent ~^(optional)^~
_[GroupObject][api.type.GroupObject]._ Display group in which to insert the text object.

##### text ~^(required)^~
_[String][api.type.String]._ The text to display. Similarly, to change the displayed text for a text object after it has been created, set the [object.text][api.type.TextObject.text] property.

##### x ~^(optional)^~
_[Number][api.type.Number]._ The __x__ coordinate of the text object.

##### y ~^(optional)^~
_[Number][api.type.Number]._ The __y__ coordinate of the text object.

##### width ~^(optional)^~
_[Number][api.type.Number]._ If supplied, text will be wrapped at this width.

##### height ~^(optional)^~
_[Number][api.type.Number]._ If supplied, text will be cropped at this height. Set this to `0` and the text box height will adjust to the amount of text, but never exceed the maximum texture height for the device.

##### font ~^(required)^~
_[String][api.type.String], [Userdata][api.type.Userdata], or [Constant][api.type.Constant]._ This can be one of the following:

* The font family name (typeface name). You may obtain an array of available font names via [native.getFontNames()][api.library.native.getFontNames].
* Name of the font file in the Corona project's main resource directory (alongside `main.lua`).
* A font object returned by [native.newFont()][api.library.native.newFont].
* A font constant such as [native.systemFont][api.library.native.systemFont] or [native.systemFontBold][api.library.native.systemFontBold].

##### fontSize ~^(optional)^~
_[Number][api.type.Number]._ The size of the text in Corona content points. The system's default font size will be used if this parameter is omitted or if it's set to `nil` or `0`.

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

To change the font size of a text object __after__ it has been created, set the [object.size][api.type.TextObject.size] property, __not__ `object.fontSize`.

</div>

##### align ~^(optional)^~
_[String][api.type.String]._ This specifies the alignment of the text when the width is known, meaning it either contains a newline or the `width` parameter is supplied. Default value is `"left"`. Valid values are `"left"`, `"center"`, or `"right"`.


## Syntax (Legacy)

Note that text alignment, for example `"center"` or `"right"`, only works with the __modern__ syntax (see&nbsp;above).

	display.newText( [parent,] text, x, y [, width, height], font [, fontSize] )

##### parent ~^(optional)^~
_[GroupObject][api.type.GroupObject]._ Display group in which to insert the text object.

##### text ~^(required)^~
_[String][api.type.String]._ The text to display. Similarly, to change the displayed text for a text object after it has been created, set the [object.text][api.type.TextObject.text] property.

##### x ~^(required)^~
_[Number][api.type.Number]._ The __x__ coordinate of the text object.

##### y ~^(required)^~
_[Number][api.type.Number]._ The __y__ coordinate of the text object.

##### width ~^(optional)^~
_[Number][api.type.Number]._ If supplied, text will be wrapped at this width.

##### height ~^(optional)^~
_[Number][api.type.Number]._ If supplied, text will be cropped at this height. Set this to `0` and the text box height will adjust to the amount of text, but never exceed the maximum texture height for the device.

##### font ~^(required)^~
_[String][api.type.String], [Userdata][api.type.Userdata], or [Constant][api.type.Constant]._ This can be one of the following:

* The font family name (typeface name). You may obtain an array of available font names via [native.getFontNames()][api.library.native.getFontNames].
* Name of the font file in the Corona project's main resource directory (alongside `main.lua`).
* A font object returned by [native.newFont()][api.library.native.newFont].
* A font constant such as [native.systemFont][api.library.native.systemFont] or [native.systemFontBold][api.library.native.systemFontBold].

##### fontSize ~^(optional)^~
_[Number][api.type.Number]._ The size of the text in Corona content points. The system's default font size will be used if this parameter is omitted or if it's set to `nil` or `0`.

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

To change the font size of a text object __after__ it has been created, set the [object.size][api.type.TextObject.size] property, __not__ `object.fontSize`.

</div>


## Gotchas

* The `newText()` object uses a mask when the object is created. There is a nested masking limit of 3, so care must be taken when inserting masked objects into other masked objects which act as containers, including [display.newContainer][api.library.display.newContainer], [widget.newScrollView][api.library.widget.newScrollView], [widget.newTableView][api.library.widget.newTableView], or a masked [display&nbsp;group][api.type.GroupObject]. Other display objects that utilize masks include [display.newEmbossedText][api.library.display.newEmbossedText] and any other [masked][api.type.Mask] display object. If you exceed the mask nesting limit, the text may appear as a solid white block. For example, a text object (one&nbsp;mask) inside a container (one&nbsp;mask) inside yet another container (one&nbsp;mask) would reach but not exceed the limit of 3 nested masks.

* When rendering a multi-line box of text, be careful that the final display object does not exceed any target device's maximum texture size limit. If you need to render text objects with a large number of lines, you should create multiple text objects and position them one after the next.


## Examples

##### Single-Line Text

`````lua
local myText = display.newText( "Hello World!", 100, 200, native.systemFont, 16 )
myText:setFillColor( 1, 0, 0 )
`````

##### Multi-Line Text

`````lua
local myText = display.newText( "Hello World!", 30, 100, 240, 300, native.systemFont, 16 )
myText:setFillColor( 0, 0.5, 1 )
`````

##### Updating Text Post-Creation

`````lua
local myText = display.newText( "hello", 100, 200, native.systemFont, 12 )
myText:setFillColor( 1, 0, 0.5 )

-- Change the displayed text
myText.text = "Hello World!"

-- Increase the font size
myText.size = 16
`````

##### Multi-Line Text Right-Aligned

``````lua
local options = 
{
	text = "Hello World",     
	x = 100,
	y = 200,
	width = 128,
	font = native.systemFont,   
	fontSize = 18,
	align = "right"  -- Alignment parameter
}

local myText = display.newText( options )
myText:setFillColor( 1, 0, 0 )
``````

##### Multi-Line Text Top-Aligned

``````lua
-- Variable for top alignment axis
local topAlignAxis = 200

-- Create first multi-line text object
local options1 = 
{
	text = "The quick brown fox jumped over the lazy dog.",
	x = 90,
	width = 120,
	font = native.systemFont,
	fontSize = 18
}
local myText1 = display.newText( options1 )
myText1:setFillColor( 1, 0, 0 )

-- Set vertical anchor on object to 0 (top)
myText1.anchorY = 0
-- Align object to top alignment axis
myText1.y = topAlignAxis

-- Create second multi-line text object
local options2 = 
{
	text = "The quick brown fox jumped over the lazy dog, then jumped back again.",
	x = 230,
	width = 120,
	font = native.systemFont,
	fontSize = 18
}
local myText2 = display.newText( options2 )
myText2:setFillColor( 0.6, 0.4, 0.8 )

-- Set vertical anchor on object to 0 (top)
myText2.anchorY = 0
-- Align object to top alignment axis
myText2.y = topAlignAxis
``````
