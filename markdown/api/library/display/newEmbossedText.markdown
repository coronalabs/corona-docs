
# display.newEmbossedText()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [display.*][api.library.display]
> __Return value__      [TextObject][api.type.TextObject]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          embossed text, text
> __See also__          [Using Custom Fonts][guide.system.customFont] _(guide)_
>						[Display Objects][guide.media.displayObjects] _(guide)_
>						[display.newText()][api.library.display.newText]
>						[object:setEmbossColor()][api.type.TextObject.setEmbossColor]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Creates an embossed text object. The local origin is at the center of the text and the [anchor point][guide.graphics.transform-anchor] is initialized to this local origin.

Text is wrapped either at newlines or by specifying a `width` and `height` when the object is created.

By default, the text color is white <nobr>`( 1, 1, 1 )`</nobr>. See [object:setFillColor()][api.type.ShapeObject.setFillColor] for more information.


## Syntax

	display.newEmbossedText( options )

This function takes a single argument, `options`, which is a table that accepts the following parameters:

##### parent ~^(optional)^~
_[GroupObject][api.type.GroupObject]._ Display group in which to insert the text object.

##### text ~^(required)^~
_[String][api.type.String]._ The text to display. Similarly, to change the displayed text for a text object after it has been created, set the [object.text][api.type.TextObject.text] property.

##### x / y ~^(optional)^~
_[Numbers][api.type.Number]._ Coordinates for the object's __x__ and __y__ center point.

##### width / height ~^(optional)^~
_[Numbers][api.type.Number]._ If supplied, text will be wrapped at `width` and cropped at `height`. Set `height` to `0` and the text box height will adjust to the amount of text, but never exceed the maximum texture height for the device.

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

    display.newEmbossedText( [parent,] text, x, y, [width, height,] font, fontSize )

##### parent ~^(optional)^~
_[GroupObject][api.type.GroupObject]._ The display group to insert the embossed text object into.

##### text ~^(required)^~
_[String][api.type.String]._ The text to display. Similarly, to change the displayed text for a text object after it has been created, set the [object.text][api.type.TextObject.text] property.

##### x / y ~^(required)^~
_[Numbers][api.type.Number]._ Coordinates for the object's __x__ and __y__ center point.

##### width / height ~^(optional)^~
_[Numbers][api.type.Number]._ If supplied, text will be wrapped at `width` and cropped at `height`. Set `height` to `0` and the text box height will adjust to the amount of text, but never exceed the maximum texture height for the device.

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

* The `newEmbossedText` object uses a mask when the object is created. There is a nested masking limit of 3, so care must be taken when inserting masked objects into other masked objects which act as containers, including [display.newContainer][api.library.display.newContainer], [widget.newScrollView][api.library.widget.newScrollView], [widget.newTableView][api.library.widget.newTableView], or a masked [display&nbsp;group][api.type.GroupObject]. Other display objects that utilize masks include [display.newText][api.library.display.newText] and any other [masked][api.type.Mask] display object. If you exceed the mask nesting limit, the text may appear as a solid white block. For example, a text object (one&nbsp;mask) inside a container (one&nbsp;mask) inside yet another container (one&nbsp;mask) would reach but not exceed the limit of 3 nested masks.

* `newEmbossedText` support both `text.text = string` as well as `text:setText( string )` methods to change the text of embossed text. The latter function returns a display group rather than a vector text object, with additional methods for setting text (`text:setText()`) and changing the text color (`text:setFillColor()`). Use `text.text` to retrieve the text string.

* `newEmbossedText` supports both `text.size = number` as well as `text:setSize( number )` to change the size of embossed text. Use `text.size` to retrieve the text size.

* Use `text:setEmbossColor( colorTable )` method to change the emboss color of the text.


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
