# Custom Shader Effects

While Solar2D has an extensive list of [built-in shader effects][guide.graphics.effects], there are times when you may need to create custom effects. This guide outlines how to create custom effects using custom shader code, structured in the same way that Solar2D's <nobr>built-in</nobr> shader effects are implemented.

<div class="guides-toc">

* [GPU Rendering Pipeline](#pipeline)
* [Programmable Effects](#programmable)
* [Creating Custom Effects](#creating)
* [Vertex Kernels](#vertexkernels)
* [Fragment Kernels](#fragmentkernels)
* [Custom Varying Variables](#varyingvariables)
* [Effect Parameters](#effectparameters)
* [GLSL Conventions and Best Practices](#bestpractices)

</div>

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Notes</div>

* Writing custom effects is an advanced developer feature. If you want to take advantage of this feature, this guide assumes that you are already familiar with and fluent in GLSL&nbsp;ES <nobr>(OpenGL ES 2.0)</nobr>.

* Custom effects are supported on iOS, Android, macOS&nbsp;desktop, and Win32&nbsp;desktop.

</div>




<a id="pipeline"></a>

## GPU Rendering Pipeline

In a programmable graphics pipeline, the GPU is treated as a stream processor. Data flows through multiple processing units and each unit is capable of running a (shader) program.

In OpenGL-ES 2.0, data flows from (__1__) the application to (__2__) the vertex processor to (__3__) the fragment processor and finally to (__4__) the framebuffer/screen.

![][images.sdk.graphics.GPU-pipeline]

In Solar2D, rather than write complete shader programs, custom shader effects are exposed in the form of vertex and fragment __kernels__ which allow you to create powerful programmable effects.




<a id="programmable"></a>

## Programmable Effects

Solar2D allows you to extend its pipeline to create several types of custom programmable effects, organized based on the number of input textures:

* __Generators__ &mdash; Procedurally-generated effects which don't operate on any textures/images.
* __Filters__ &mdash; Effects which operate on a single texture/image \([BitmapPaint][api.type.BitmapPaint]\).
* __Composites__ &mdash; Effects which operate on two textures/images, combined together as a [CompositePaint][api.type.CompositePaint].




<a id="creating"></a>

## Creating Custom Effects

To define a new effect, call [graphics.defineEffect()][api.library.graphics.defineEffect], passing in a Lua table which defines the effect. In order for this table to be a valid effect definition, it must contain several properties:

* `category` &mdash; The type of effect.
* `name` &mdash; The name within a given category.
* `vertex` and/or `fragment` &mdash; Defines where your shader code goes, as described in the [Defining Kernels](#kernels) section below.

A complete and detailed description of all properties is available in the [graphics.defineEffect()][api.library.graphics.defineEffect] documentation.

### Naming Effects

The name of an effect is determined by the following properties:

* `category` &mdash; The type of effect.
* `group` &mdash; The group of effect. If not provided, Solar2D will assume `custom`.
* `name` &mdash; The name within a given category.

When you set an effect on a display object, you must provide a <nobr>fully-qualified</nobr> string by concatenating the above values and separating each by a `.` as follows:

``````lua
local effectName = "[category].[group].[name]"
``````

<a id="kernels"></a>

### Defining Kernels

Solar2D packages snippets of shader code in the form of __kernels__. By structuring specific vertex and fragment processing tasks in kernels, the creation of custom effects is dramatically simplified.

Essentially, a kernel is shader code which the main shader program relies upon to handle specific processing tasks. Solar2D supports both [vertex kernels](#vertexkernels) and [fragment kernels](#fragmentkernels). You must specify at least one kernel type in your effect (or&nbsp;both). If a vertex/fragment kernel is not specified, Solar2D inserts the default vertex/fragment kernel respectively.




<a id="vertexkernels"></a>

## Vertex Kernels

Vertex kernels operate on a per-vertex basis, enabling you to modify vertex positions before they are used in the next stage of the pipeline. They must define the following function which accepts an incoming position and can modify that vertex position.

Solar2D's default vertex kernel simply returns the incoming position:

`````lua
P_POSITION vec2 VertexKernel( P_POSITION vec2 position )
{
	return position;
}
`````

<a id="vertextime"></a>

### Time

The following time uniforms can be accessed by the vertex kernel:

* `P_DEFAULT float CoronaTotalTime` &mdash; Running time of the app in seconds.
* `P_DEFAULT float CoronaDeltaTime` &mdash; Time in seconds since previous frame.

If you use these variables in your kernel's shader code, your kernel is implicitly <nobr>time-dependent</nobr>. In other words, your kernel will output different results and evolve as time progresses.

When using these variables, you need to tell Solar2D that your shader requires the GPU to <nobr>re-render</nobr> the scene, even if there are no other changes to the display objects in the scene. You can do this by setting the `kernel.isTimeDependent` property in your kernel definition as indicated below. Note that you should only set this if your shader code is truly <nobr>time-dependent</nobr>, since it effectively forces the GPU to <nobr>re-render</nobr> every frame.

`````lua
kernel.isTimeDependent = true
`````

<a id="vertexsize"></a>

### Size

The following size uniforms can be accessed by the vertex kernel:

* `P_POSITION vec2 CoronaContentScale` &mdash; The number of content pixels per screen pixels along the __x__ and __y__ axes. Content pixels refer to Solar2D's coordinate system and are determined by the [content scaling][guide.basics.configSettings] settings for your project.

* `P_UV vec4 CoronaTexelSize` &mdash; These values help you understand normalized texture pixels (texels) as they relate to actual pixels. This is useful because texture coordinates are normalized <nobr>(`0` to `1`)</nobr> and normally you only have information about proportion (the&nbsp;percentage of the width or height of the texture). Effectively, these values help you create effects based on actual screen/content pixel distances.

<div class="code-indent">
<div class="inner-table">

Value					Definition
----------------------	------------------	
`CoronaTexelSize.xy`	The number of texels per __screen__ pixel along the __x__ and __y__ axes.
`CoronaTexelSize.zw`	The number of texels per __content__ pixel along the __x__ and __y__ axes, initially the same as `CoronaTexelSize.xy`. This is useful in creating <nobr>resolution-independent</nobr> effects that account for the additional pixel density due to [dynamic image selection][guide.basics.configSettings]. Essentially, when a retina/HD image is selected, these components are divided by `CoronaContentScale`.

</div>
</div>

### Coordinate

* `P_UV vec2 CoronaTexCoord` &mdash; The texture coordinate for the vertex.

### Example

The following example causes the bottom edge of an image to wobble by a fixed amplitude: 

`````lua
local kernel = {}

-- "filter.custom.myWobble"
kernel.category = "filter"
kernel.name = "myWobble"

-- Shader code uses time environment variable CoronaTotalTime
kernel.isTimeDependent = true

kernel.vertex =
[[
P_POSITION vec2 VertexKernel( P_POSITION vec2 position )
{
	P_POSITION float amplitude = 10;
	position.y += sin( 3.0 * CoronaTotalTime + CoronaTexCoord.x ) * amplitude * CoronaTexCoord.y;

	return position;
}
]]
`````




<a id="fragmentkernels"></a>

## Fragment Kernels

Fragment kernels operate on a per-pixel basis, enabling you to modify each pixel <nobr>(i.e. image processing)</nobr> before it is drawn to the framebuffer. They must define the following function which accepts an incoming texture coordinate and returns a color vector, for example the pixel color to be used in the next stage of the pipeline.

Solar2D's default fragment kernel simply samples a single texture (`CoronaSampler0`) and, using `CoronaColorScale()`, modulates it by the display object's alpha/tint:

`````
P_COLOR vec4 FragmentKernel( P_UV vec2 texCoord )
{
    P_COLOR vec4 texColor = texture2D( CoronaSampler0, texCoord );
    return CoronaColorScale( texColor );
}
`````

### Time

The same vertex kernel [time](#vertextime) uniforms can be accessed by the fragment kernel.

### Size

The same vertex kernel [size](#vertexsize) uniforms can be accessed by the fragment kernel.

### Samplers

* `P_COLOR sampler2D CoronaSampler0` &mdash; The texture sampler for the first texture.
* `P_COLOR sampler2D CoronaSampler1` &mdash; The texture sampler for the second texture (requires a [composite paint][api.type.CompositePaint]).

### Alpha/Tint

All display objects have an [alpha][api.type.DisplayObject.alpha] property. In addition, [shape][api.type.ShapeObject] objects have a tint which is set either via [object:setFillColor()][api.type.ShapeObject.setFillColor] or the color channel properties <nobr>([r][api.type.Paint.r], [g][api.type.Paint.g], [b][api.type.Paint.b], [a][api.type.Paint.a])</nobr> of the object's [fill][api.type.ShapeObject.fill] property.

Generally, your shader should incorporate the effect of these properties into the color that your fragment kernel returns. You can do this by calling the following function to calculate the correct color:

`````
P_COLOR vec4 CoronaColorScale( P_COLOR vec4 color );
`````

This function takes an input color vector (red, green, blue, and alpha channels) and returns a color vector modulated by the display object's tint and alpha, as shown in the fragment kernel examples. Generally, you should call this function at the end of the fragment kernel so that you can properly calculate the color vector your fragment kernel should return.

### Example

The following example brightens an image by a fixed amount per color component: 

`````lua
local kernel = {}

-- "filter.custom.myBrighten"
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

	// Modulate by the display object's combined alpha/tint.
	return CoronaColorScale( texColor );
}
]]
`````




<a id="varyingvariables"></a>

## Custom Varying Variables

A "varying" variable enables data to be passed from a vertex shader to the fragment shader. The vertex shader outputs this value which corresponds to the positions of the primitive's vertices. In turn, the fragment shader linearly interpolates this value across the primitive during rasterization.

In Solar2D, you can declare your own varying variables in the shader code. You should put them at the beginning of both your vertex and fragment code.

### Example

The following example combines the wobble vertex and brighten fragment kernels. Unlike the `"myBrighten"` fragment example above, this version does not use a fixed value for brightness. Instead, the vertex shader calculates an oscillating brightness value for each vertex and the fragment shader linearly interpolates the brightness value according to the pixel it's shading.

`````lua
local kernel = {}
kernel.category = "filter"
kernel.name = "wobbleAndBrighten"

-- Shader code uses time environment variable CoronaTotalTime
kernel.isTimeDependent = true

kernel.vertex =
[[
varying P_COLOR float delta; // Custom varying variable

P_POSITION vec2 VertexKernel( P_POSITION vec2 position )
{
	P_POSITION float amplitude = 10;

	position.y += sin( 3.0 * CoronaTotalTime + CoronaTexCoord.x ) * amplitude * CoronaTexCoord.y;

	// Calculate value for varying
	delta = 0.4*(CoronaTexCoord.y + sin( 3.0 * CoronaTotalTime + 2.0 * CoronaTexCoord.x ));

	return position;
}
]]

kernel.fragment =
[[
varying P_COLOR float delta; // Matches declaration in vertex shader

P_COLOR vec4 FragmentKernel( P_UV vec2 texCoord )
{
	// Brightness changes based on interpolated value of custom varying variable
	P_COLOR float brightness = delta;

	P_COLOR vec4 texColor = texture2D( CoronaSampler0, texCoord );

	// Pre-multiply the alpha to brightness
	brightness *= texColor.a;

	// Add the brightness
	texColor.rgb += brightness;

	// Modulate by the display object's combined alpha/tint.
	return CoronaColorScale( texColor );
}
]]
`````




<a id="effectparameters"></a>

## Effect Parameters

In Solar2D, you can pass effect parameters by setting appropriate properties on the [effect][api.type.Paint.effect] of a [ShapeObject][api.type.ShapeObject]. These properties depend on the effect. For example, the <nobr>built-in</nobr> brightness filter has an `intensity` parameter that can be propagated to the shader code:

`````lua
object.fill.effect = "filter.brightness"
object.fill.effect.intensity = 0.4
`````

Solar2D supports two methods for adding parameters to custom shader effects. These are mutually exclusive, so you must choose one or the other.

<div class="inner-table">

Method									Description
--------------------------------------	------------------	
[vertex userdata](#vertexuserdata)		Parameters are passed on a <nobr>per-vertex</nobr> basis. This generally performs better because changes to vertex data does not require OpenGL state changes. However, it's limited to 4 (scalar) values.
[uniform userdata](#uniformuserdata)	Parameters are passed as uniforms. This is for effects which require more parameters than can be passed via vertex userdata.

</div>

<div class="guide-notebox">
<div class="notebox-title">Vertex Versus Uniform</div>

On devices, OpenGL performs best when you are able to minimize state changes. This is because multiple objects can be batched into a single draw call if there are no state changes required between display objects.

Typically, it's best to use vertex userdata when you need to pass in effect parameters, because the parameter data can be passed in a vertex array. This maximizes the chance that Solar2D can batch draw calls together. This is especially true if you have numerous consecutive display objects with the same effect applied.

</div>

<a id="vertexuserdata"></a>

### Vertex Userdata

When using vertex userdata to pass effect parameters, the effect parameters are copied for each vertex. To minimize the data size impact, the effect parameters are limited to a `vec4` <nobr>(vector of 4 floats)</nobr>. This is available as the following <nobr>read-only</nobr> vector variable in both the vertex and fragment kernels:

`P_DEFAULT vec4 CoronaVertexUserData`

For example, suppose you want to modify the above `"filter.custom.myBrighten"` effect example so that, in Lua, there is a `"brightness"` parameter for the effect:

`````lua
object.fill.effect = "filter.custom.myBrighten"
object.fill.effect.brightness = 0.3
`````

To accomplish this, you must instruct Solar2D to map the parameter name in Lua with the corresponding component in the vector returned by `CoronaVertexUserData`. The following code tells Solar2D that the `"brightness"` parameter is the first component <nobr>(`index = 0`)</nobr> of the `CoronaVertexUserData` vector.

`````lua
kernel.vertexData =
{
	{
		name = "brightness",
		default = 0, 
		min = 0,
		max = 1,
		index = 0,  -- This corresponds to "CoronaVertexUserData.x"
	},
}
`````

In the above array (`kernel.vertexData`), each element is a table and each table specifies:

* `name` &mdash; The [string][api.type.String] name for the parameter exposed in Lua.
* `default` &mdash; The default value.
* `min` &mdash; The minimum value.
* `max` &mdash; The maximum value.
* `index` &mdash; The index for the corresponding vector component in `CoronaVertexUserData`:

    `index = 0` &rarr; `CoronaVertexUserData.x`  
    `index = 1` &rarr; `CoronaVertexUserData.y`  
    `index = 2` &rarr; `CoronaVertexUserData.z`  
    `index = 3` &rarr; `CoronaVertexUserData.w`

Finally, modify the `FragmentKernel` to read the parameter value, accessing the parameter value via `CoronaVertexUserData`:

`````
kernel.fragment =
[[
P_COLOR vec4 FragmentKernel( P_UV vec2 texCoord )
{
	P_COLOR float brightness = CoronaVertexUserData.x;

	...
}
]]
`````

<a id="uniformuserdata"></a>

### Uniform Userdata

(forthcoming feature)




<a id="bestpractices"></a>

## GLSL Conventions and Best Practices

GLSL has many flavors across mobile and desktop. Solar2D assumes the use of GLSL&nbsp;ES <nobr>(OpenGL ES 2.0)</nobr>. To maximize compatibility and performance, you should follow the following conventions and best practices.

### Solar2D Simulator vs Device

###### Performance

Shader performance on desktop GPUs will __not__ be the same as on devices. Therefore, if you run your shader under the Solar2D Simulator or in the [Solar2D Shader Playground](https://shader.solar2d.com/), you should run it on actual devices to be sure that you are getting the desired performance. 

Also note that if you are supporting devices from different manufacturers, the performance between them could vary significantly. On Android in particular, some <nobr>high-end</nobr> devices actually have underpowered GPUs, so you should __not__ assume that you will get equal performance across different <nobr>high-end</nobr> Android devices.

###### Syntax

The Solar2D Simulator compiles your shader using __desktop__ GLSL. Consequently, if you run your shader in the Solar2D Simulator, your shader may still contain GLSL&nbsp;ES errors that will not appear until you attempt to run your shader on a device.

If you have a fragment-only kernel shader effect, you can test out your shader code in the [Solar2D Shader Playground](https://shader.solar2d.com/). This playground verifies against GLSL&nbsp;ES in a <nobr>WebGL-enabled</nobr> browser.

### Precision Qualifier Macros

Unlike other flavors of GLSL, GLSL&nbsp;ES <nobr>(OpenGL ES 2.0)</nobr> generally requires precision qualifiers to be specified in variable declarations. Thus, it's a good practice to be explicit about precision.

Instead of using raw precision qualifiers like `lowp`, you should use one of the following precision qualifier macros. The defaults are optimized for the type of data:

* `P_DEFAULT` &mdash; For generic values; default is `highp`.
* `P_RANDOM` &mdash; For random values; default is `highp`.
* `P_POSITION` &mdash; For positions; default is `mediump`.
* `P_NORMAL` &mdash; For normals; default is `mediump`.
* `P_UV` &mdash; For texture coordinates; default is `mediump`.
* `P_COLOR` &mdash; For pixel colors; default is `lowp`.

We strongly recommend you use Solar2D's defaults for shader precision, all of which have been optimized to balance performance and fidelity. However, your project can override these settings in `config.lua` \([guide][guide.basics.configSettings]\).

### High-Precision Devices

Not all devices support high precision. Therefore, if your kernel requires high precision, you should use the `GL_FRAGMENT_PRECISION_HIGH` macro. This is `1` if high precision is supported on the device, or undefined otherwise.

If the device does not support `highp`, your kernel can gracefully degrade by writing two implementations:

`````
P_COLOR vec4 FragmentKernel( P_UV vec2 texCoord )
{
#ifdef GL_FRAGMENT_PRECISION_HIGH
	// Code path for high precision calculations
#else
	// Code path for fallback
#endif
}
`````

### Pre-Multiplied Alpha

Solar2D provides textures with [pre-multiplied alpha](https://en.wikipedia.org/wiki/Alpha_compositing). Therefore, you may need to divide by the alpha to recover the original RGB values. However, for performance reasons, you should try to perform calculations to avoid the divide. Compare the following two kernels that brighten an image:

1. In the following, the original RGB values are recovered by undoing the <nobr>pre-multiplied</nobr> alpha, and later, the alpha is <nobr>re-applied</nobr>. This is not ideal because it generates a lot of additional operations on the GPU for every pixel.

<div class="code-indent">

`````
// Non-optimal Version
P_COLOR vec4 FragmentKernel( P_UV vec2 texCoord )
{
	P_COLOR float brightness = 0.5;
	P_COLOR vec4 texColor = texture2D( CoronaSampler0, texCoord );

	// BAD: Recover original RGBs via divide
	texColor.rgb /= texColor.a;

	// Add the brightness
	texColor.rgb += brightness;

	// BAD: Re-apply the pre-multiplied alpha
	texColor.rgb *= texColor.a;

	return CoronaColorScale( texColor );
}
`````

</div>

2. This version pre-multiplies the alpha of the texture to the `brightness` variable so that it can be added directly to the texture's RGB values. This circumvents the deficiencies of the above implementation.

<div class="code-indent">

`````
// Optimal Version
P_COLOR vec4 FragmentKernel( P_UV vec2 texCoord )
{
	P_COLOR float brightness = 0.5;
	P_COLOR vec4 texColor = texture2D( CoronaSampler0, texCoord );

	// GOOD: Pre-multiply the alpha to brightness
	brightness = brightness * texColor.a;

	// Add the brightness
	texColor.rgb += brightness;

	return CoronaColorScale( texColor );
}
`````

</div>

### Vector Calculations

Some devices do not have GPUs with vector processors. In those cases, vector calculations may be performed on a scalar processor. Generally, you should carefully consider the order of operations in your shader to ensure that unnecessary calculations can be avoided on a scalar processor.

###### Consolidate Scalar Calculations

In the following example, a vector processor would execute each multiplication in parallel. However, because of the order of operations, a scalar processor would perform 8 multiplications, even though only one of the three parameters is a scalar value.

`````
P_DEFAULT float f0, f1;
P_DEFAULT vec4 v0, v1;
v0 = (v1 * f0) * f1; // BAD: Multiply each scalar to a vector
`````

A better ordering would be to multiply the two scalars first, then multiply the result against the vector. This reduces the calculation to 5 multiplies.

`````
highp float f0, f1;
highp vec4 v0, v1;
v0 = v1 * (f0 * f1); // GOOD: Multiply scalars first
`````

###### Use Write Masks

Similar logic applies when your vector calculation does not use all components. A "write&nbsp;mask" allows you to limit the calculations to only the components specified in the mask. The following runs twice as fast on a scalar processor because the write mask is used to specify that only two of the four components are needed.

`````
highp vec4 v0;
highp vec4 v1;
highp vec4 v2;
v2.xz = v0 * v1; // GOOD: Write mask limits calculations
`````

### Avoid Dynamic Texture Lookups

When a fragment shader samples textures at a location different from the texture coordinate passed to the shader, it causes a dynamic texture lookup, also known as <nobr>"dependent texture reads."</nobr> In <nobr>OpenGL-ES 2.0</nobr>, dependent texture reads can delay texel data loading and reduce performance. This is why certain effects that sample a region of texels, for instance blur effects, are slower.

In contrast, effects that have no dependent texture reads enable the GPU to <nobr>pre-fetch</nobr> texel data before the shader executes, reducing I/O latency.

### Avoid Branching and Loops

Branching instructions (`if` conditions) are expensive. When possible, `for` loops should be unrolled or replaced by vector operations.
