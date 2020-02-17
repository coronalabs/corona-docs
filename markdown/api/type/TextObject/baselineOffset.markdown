# object.baselineOffset

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Object__            [TextObject][api.type.TextObject]
> __Library__           [display.*][api.library.display]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          text, string, baselineOffset
> __See also__          [display.newText()][api.library.display.newText]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

The amount by which the baseline of the first line is offset from the center of the [text object][api.type.TextObject].

<div class="guide-notebox">
<div class="notebox-title">Note</div>

The baseline is the imaginary horizontal line with which the base of each character in a line of text is aligned.

</div>


## Example

``````lua
local text = display.newText( "Baseline Offset sample", 0, 0, native.systemFont, 24 )

print( text.baselineOffset )
text:translate( 0, text.baselineOffset )
``````
