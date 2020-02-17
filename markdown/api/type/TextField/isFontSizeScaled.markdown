# object.isFontSizeScaled

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Boolean][api.type.Boolean]
> __Object__            [TextField][api.type.TextField]
> __Library__           [native.*][api.library.native]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          native text input
> __See also__          [native.newTextField()][api.library.native.newTextField]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Determines which font size units the text field's [object.size][api.type.TextField.size] and [object.font][api.type.TextField.font] properties are measured in.

If `true`, the font size you read or write to the text field's properties uses Corona's <nobr>content-scaled</nobr> point system. This matches the font size that you provide to the [display.newText()][api.library.display.newText] function.

If `false`, the font size you read or write to the text field's properties uses the platform's native point system. Corona content scaling is not applied to the font size in this case. On iOS, this uses Apple's point system. On Android, this is set in DP units <nobr>(Device-independent Pixels).</nobr> This was Corona's default setting prior to Build #2518.

Upon creation of the text field, the default value of this property is determined by [display.setDefault()][api.library.display.setDefault] and the `"isNativeTextFieldFontSizeScaled"` key which is `true` by default.

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

-- Create a native text field using the same font size as the above text object
local textField = native.newTextField( display.contentCenterX, 140, display.contentWidth-20, 40 )
textField.isFontSizeScaled = true  -- Make the field use the same font units as the text object
textField.size = textLabel.size
textField:resizeHeightToFitFont()

-- Print the text field's font size measured in Corona's content-scaled units
print( "Text Field Font Size (Corona Units) = " .. tostring( textField.size ) )

-- Print the text field's font size measured in the platform's native units
textField.isFontSizeScaled = false
print( "Text Field Font Size (Native Units) = " .. tostring( textField.size ) )
``````