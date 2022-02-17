
# graphics.undefineEffect()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__				[Function][api.type.Function]
> __Library__			[graphics.*][api.library.graphics]
> __Return value__		none
> __Revision__			[REVISION_LABEL](REVISION_URL)
> __Keywords__			shaders, effects, graphics
> __See also__			[Custom Shader Effects][guide.graphics.customEffects] _(guide)_
>						[Filters / Generators / Composites][guide.graphics.effects] _(guide)_
> --------------------- ------------------------------------------------------------------------------------------

## Overview

This function allows you to undefine/release custom shader effects.


## Syntax

	graphics.undefineEffect( effect )

##### effect ~^(required)^~
_[String][api.type.String]._ The full name of the custom shader effect, as in <nobr>`"<category>.<group>.<name>"`</nobr>.


## Example

`````lua
local kernel = {}
kernel.category = "filter"
kernel.name = "myBrighten"

kernel.fragment =
[[
P_COLOR vec4 FragmentKernel( P_UV vec2 texCoord )
{
	P_COLOR float brightness = 0.5;
	P_COLOR vec4 texColor = texture2D( CoronaSampler0, texCoord );

	// Pre-multiply the alpha to brightness
	brightness = brightness * texColor.a;

	// Add the brightness
	texColor.rgb += brightness;

	// Modulate by the display object's combined alpha/tint
	return CoronaColorScale( result );
}
]]

graphics.defineEffect( kernel )

-- When the effect is no longer needed, it can be undefined
graphics.undefineEffect( "filter.custom.myBrighten" )
`````
