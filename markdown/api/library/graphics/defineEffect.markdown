
# graphics.defineEffect()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__				[Function][api.type.Function]
> __Library__			[graphics.*][api.library.graphics]
> __Return value__		none
> __Revision__			[REVISION_LABEL](REVISION_URL)
> __Keywords__			shaders, effects, graphics
> __See also__			[Custom Shader Effects][guide.graphics.customEffects] _(guide)_
>						[Filters / Generators / Composites][guide.graphics.effects] _(guide)_
>						[customFilter](https://github.com/coronalabs/sample-customFilter) _(sample)_
> --------------------- ------------------------------------------------------------------------------------------

## Overview

This function allows you to extend Corona and define a custom shader effect. Your custom effect can define either a vertex kernel or a fragment kernel (or&nbsp;both). These kernels are similar to shaders, except that they must define functions with a specific name and which conform to specific function signatures. 

See the [Custom Shader Effects][guide.graphics.customEffects] guide for a detailed explanation of how to write shader code for these kernels.

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Note</div>

Custom effects are supported on iOS, Android, macOS&nbsp;desktop, and Win32&nbsp;desktop.

</div>


## Syntax

	graphics.defineEffect( effect )

##### effect ~^(required)^~
_[Table][api.type.Table]._ Table which defines a shader effect &mdash; see the next section for details.


## Effect Table Reference

The `effect` table can contain the following properties:

##### category ~^(required)^~
_[String][api.type.String]._ The category for the effect. This determines the number of input textures:

* `"generator"` &mdash; Assumes 0 input textures.
* `"filter"` &mdash; Assumes 1 input texture.
* `"composite"` &mdash; Assumes 2 input textures.

##### group ~^(optional)^~
_[String][api.type.String]._ The name of the group that the effect belongs to. While [built-in][guide.graphics.effects] effects have no name, custom effects are placed in the `"custom"` group by default. You can override this default by passing in a different group name.

##### name ~^(required)^~
_[String][api.type.String]._ A name which uniquely identifies the effect within a category. This must not conflict with a <nobr>pre-existing</nobr> name within a given category and group. Together with the `category` property and `group` property, this determines the full name of the effect that you assign to a [Paint][api.type.Paint] object as <nobr>`"<category>.<group>.<name>"`</nobr>.

##### fragment ~^(required)^~
_[String][api.type.String]._ The shader code for the fragment kernel. See __Fragment&nbsp;Kernels__ in the [Custom Shader Effects][guide.graphics.customEffects] guide. Note that this is __not__ required if the `vertex` property is set.

##### vertex ~^(required)^~
_[String][api.type.String]._ The shader code for the vertex kernel. See __Vertex&nbsp;Kernels__ in the [Custom Shader Effects][guide.graphics.customEffects] guide. Note that this is __not__ required if the `fragment` property is set.

##### isTimeDependent ~^(optional)^~
_[Boolean][api.type.Boolean]._ If the vertex or fragment kernel depends on time (the&nbsp;output varies with&nbsp;time), set this to `true`. The default <nobr>(if not provided)</nobr> assumes a value of `false`, meaning the kernel does not use time in its calculations.

##### timeTransform ~^(optional)^~
_[Table][api.type.Table]._ If the vertex or fragment kernel depends on time, you can use this to mitigate potentially large time values. See __Time&nbsp;Transforms__ in the  [Custom Shader Effects][guide.graphics.customEffects] guide.

##### vertexData ~^(optional)^~
_[Table][api.type.Table]._ This allows you to specify named parameters for your effect. You can specify up to four parameters, each of which is a `scalar` (float). See __Effect&nbsp;Parameters__ in the [Custom Shader Effects][guide.graphics.customEffects] guide for more information. Note that you can specify either `vertexData` or `uniformData` but not both.

##### uniformData ~^(optional)^~
_[Table][api.type.Table]._ This allows you to specify named parameters for your effect. You can specify up to four parameters, each of which can be a different type: `scalar` (float), `vec2` `vec3`, `vec4`, `mat3`, or `mat4`. See __Effect&nbsp;Parameters__ in the [Custom Shader Effects][guide.graphics.customEffects] guide for more information. Note that you can specify either `vertexData` or `uniformData` but not both.


## Example

`````lua
-- An effect that brightens each pixel
-- Usage: object.fill.effect = "filter.custom.myBrighten"
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
`````
