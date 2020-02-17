# object.isFontSizeScaled

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Boolean][api.type.Boolean]
> __Object__            [TextBox][api.type.TextBox]
> __Library__           [native.*][api.library.native]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          native text input
> __See also__          [native.newTextBox()][api.library.native.newTextBox]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Determines which font size units the text box's [object.size][api.type.TextBox.size] and [object.font][api.type.TextBox.font] properties are measured in.

If `true`, the font size you read or write to the text box's properties uses Corona's <nobr>content-scaled</nobr> point system. This matches the font size that you provide to the [display.newText()][api.library.display.newText] function.

If `false`, the font size you read or write to the text box's properties uses the platform's native point system. Corona content scaling is not applied to the font size in this case. On iOS, this uses Apple's point system. On Android, this is set in DP units <nobr>(Device-independent Pixels).</nobr> This was Corona's default setting prior to Build #2518.

Upon creation of the text box, the default value of this property is determined by [display.setDefault()][api.library.display.setDefault] and the `"isNativeTextBoxFontSizeScaled"` key which is `true` by default.

## Example

``````lua
-- Create a text object
local textSettings =
{
	text = "This is my text label.",
	x = display.contentCenterX,
	y = 100,
	width = display.contentWidth - 20,
	font = native.systemFont,
	fontSize = 20,
}
local textLabel = display.newText( textSettings )

-- Create a native text box using the same font size as the above text object
local textBox = native.newTextBox( display.contentCenterX, 200, display.contentWidth-20, 120 )
textBox.isFontSizeScaled = true  -- Make the text box use the same font units as the text object
textBox.size = textLabel.size

-- Print the text box's font size measured in Corona's content-scaled units
print( "Text Box Font Size (Corona Units) = " .. tostring( textBox.size ) )

-- Print the text box's font size measured in the platform's native units
textBox.isFontSizeScaled = false
print( "Text Box Font Size (Native Units) = " .. tostring( textBox.size ) )
``````