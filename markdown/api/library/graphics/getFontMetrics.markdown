
# graphics.getFontMetrics()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [graphics.*][api.library.graphics]
> __Return value__      [Table][api.type.Table]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          fonts, text, metrics, graphics
> __See also__          [Using Custom Fonts][guide.system.customFont]
>						[object.baselineOffset][api.type.TextObject.baselineOffset]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

This function calculates and returns the various metrics for the font with the given name (file&nbsp;name) and text size. The returned value is a [table][api.type.Table] containing the following properties:

* `ascent` &mdash; The recommended distance above the baseline for <nobr>single-spaced</nobr> text.
* `descent` &mdash; The recommended distance below the baseline for <nobr>single-spaced</nobr> text.
* `leading` &mdash; The recommended additional space to add between lines of text.
* `height` &mdash; The calculated value of text height; this is the absolute value of `ascent` plus the absolute value of `descent`.

<div style="max-width: 655px; margin-top: 12px; margin-bottom: 12px;">

![][images.docs.metrics]

</div>


## Syntax

	graphics.getFontMetrics( fontName [, fontSize] )

##### fontName ~^(required)^~
_[String][api.type.String]._ The name of the font, for example <nobr>`"Times New Roman"`</nobr>, `"DroidSansMono"`, or `"Monaco"`. Alternatively, this can point to an actual font file as in `"CoolCustomFont.ttf"`. See the [Using Custom Fonts][guide.system.customFont] guide for more details on using custom fonts in Corona.

##### fontSize ~^(optional)^~
_[Number][api.type.Number]._ The desired font size in __points__.


## Example

``````lua
local font = "Avenir"
local fontSize = 100

local text = display.newText( "jKf", display.contentCenterX, display.contentCenterY-120, font, fontSize )

local metrics = graphics.getFontMetrics( font, fontSize )

print( "ASCENT:", metrics.ascent )
print( "DESCENT:", metrics.descent )
print( "LEADING:", metrics.leading )
print( "HEIGHT:", metrics.height )
print( "BASELINE OFFSET:", text.baselineOffset )

local textVertCenter = display.newRect( display.contentCenterX, display.contentCenterY-120, 240, 1 )
textVertCenter:setFillColor( 0.3 )

local baseline = display.newRect( display.contentCenterX, textVertCenter.y-text.baselineOffset, 300, 1 )
baseline:setFillColor( 0.93, 0.1, 0.14 )

local ascent = display.newRect( display.contentCenterX, baseline.y-metrics.ascent, 300, 1 )
ascent:setFillColor( 0.66, 0.39, 0.66 )

local height = display.newRect( display.contentCenterX, ascent.y+metrics.height, 300, 1 )
height:setFillColor( 0.66, 0.39, 0.66 )

local descent = display.newRect( display.contentCenterX+15, baseline.y-metrics.descent, 270, 1 )
descent:setFillColor( 0.27, 0.55, 0.8 )

text:toFront()
``````
