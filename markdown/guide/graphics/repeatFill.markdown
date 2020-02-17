# Repeating Fills

This guide outlines how to use __repeating&nbsp;fills__, a feature which allows a larger display object to be filled with a "tiled&nbsp;pattern" using either a __repeat__ or __mirrored&nbsp;repeat__ repetition mode. For each pattern, an __x__ and __y__ offset can be applied to the fill, and the fill can be rotated/scaled independently of the object. In addition, these fill settings can be applied either by explicit declaration or via a gradual transition to achieve a variety of animated effects.

<div class="guides-toc">

* [Repeating Fill Modes](#fill-modes)
* [Applying Fills](#apply-fill)
* [Scaling the Fill](#scale-fill)
* [Offsetting the Fill](#offset-fill)
* [Aligning the Fill](#align-fill)
* [Rotating the Fill](#rotate-fill)
* [Transitioning the Fill](#transition-fill)

</div>


<a id="fill-modes"></a>

## Repeating Fill Modes

Before implementing repeating fills, the proper __fill&nbsp;mode__ must be set for the particular situation. This is achieved by calling [display.setDefault()][api.library.display.setDefault] with the `"textureWrapX"` and/or `"textureWrapY"` keys, along with one of the following __wrap&nbsp;modes__:

* `"clampToEdge"` &mdash; This is the default mode; it clamps the texture to either the __x__ or __y__ direction. Clamped fills will __not__ repeat in the clamped direction.

* `"repeat"` &mdash; The fill will repeat in a tiled manner across the entire span of the filled object, as if identical tiles were simply laid out in the same orientation, <nobr>side-by-side</nobr>.

* `"mirroredRepeat"` &mdash; The fill will repeat in a mirrored pattern, wherein each neighboring tile will mirror the one beside it.

For example, considering a basic 160&times;128 rectangle vector object, a __repeating__ fill along the __x__ axis and a __mirrored&nbsp;repeating__ fill along the __y__ axis can be set as follows:

``````lua
local rect = display.newRect( 0, 0, 160, 128 )
rect.x, rect.y = display.contentCenterX, display.contentCenterY

display.setDefault( "textureWrapX", "repeat" )
display.setDefault( "textureWrapY", "mirroredRepeat" )
``````




<a id="apply-fill"></a>

## Applying Fills

With the vector object in place and the fill mode set along both axes, it can be filled with the example 64&times;64 image seen here:

<div style="max-width: 64px; margin-top: 12px; margin-bottom: 12px;">

![][images.docs.repeat-fill-0]

</div>

Specifically, this can be done with one initial command that sets the `fill` property of the `rect` object to a Lua table containing two <nobr>key-value</nobr> pairs:

<div class="float-right" style="max-width: 160px; margin-top: 14px; margin-bottom: 16px; clear: both;">

![][images.docs.repeat-fill-1]

</div>

``````lua
rect.fill = { type="image", filename="logo.png" }
``````

The first of these (`type`) tells Corona to fill the object with an image, and the `filename` key instructs that fill to be performed using the `logo.png` image.

The result of this command is the image at right which, by&nbsp;default, is stretched to fill the vector rectangle's entire width and height. Thus, using just this minimal amount of code, there is no visual repetition with the declared texture wrapping modes&nbsp;&mdash; but that will be addressed in the next section.

<div class="docs-tip-outer docs-tip-color-alert">
<div class="docs-tip-inner-left">
<div class="fa fa-exclamation-circle" style="font-size: 35px;"></div>
</div>
<div class="docs-tip-inner-right">

When using either of the repeating fill modes <nobr>(`"repeat"` or `"mirroredRepeat"`)</nobr>, the fill image __must__ be of <nobr>power-of-2</nobr> dimensions on both sides, for example 16, 32, 64, 128, 256, 512, etc. While images that don't meet these specifications will fill properly in the Corona&nbsp;Simulator, actual devices will __not__ honor them as valid fill images.

</div>
</div>




<a id="scale-fill"></a>

## Scaling the Fill

Obviously, filling the entire shape with one stretched image doesn’t result in a repeating fill. To get the intended visual repetition in place, __scaling__ methods must be used on the object fill. This requires just two additional lines of code:

<div class="float-right" style="max-width: 160px; margin-top: 14px; margin-bottom: 16px; clear: both;">

![][images.docs.repeat-fill-2]

</div>

``````lua
rect.fill.scaleX = 0.5
rect.fill.scaleY = 0.5
``````

This scales the fill image, but unfortunately it's still stretched&nbsp;&mdash; the GPU simply takes the stretched fill texture and scales it to 50% on each axis.

To make the fill pattern retain its 1:1 ratio across the filled object, we can use simple math to calculate the proper scaling ratios, regardless of the target object's width and height:

``````lua
local scaleFactorX = 64 / rect.width
local scaleFactorY = 64 / rect.height
``````

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

Note that the first number in each calculation (`64`) indicates the width and height of the image used for the fill which, in this guide, is 64&times;64. To retain the proper 1:1 ratio for the fill, these numbers __must__ be adjusted according to the width/height of the actual fill image being used. For example, if the fill image is 32&times;128, these values should be adjusted respectively as in <nobr>`32 / rect.width`</nobr> and <nobr>`128 / rect.height`</nobr>.

</div>

With these calculated values, the repeating fill can be properly scaled as follows:

<div class="float-right" style="max-width: 160px; margin-top: 14px; margin-bottom: 16px; clear: both;">

![][images.docs.repeat-fill-3]

</div>

``````lua
rect.fill.scaleX = scaleFactorX
rect.fill.scaleY = scaleFactorY
``````

The result is a 1:1 ratio for the fill repetition&nbsp;&mdash; meaning, the fill itself remains at its original size of 64&times;64 pixels, repeating within the bounds of the filled object and overflowing outside the edges as expected.




<a id="offset-fill"></a>

## Offsetting the Fill

One common factor in the previous examples is that the fill pattern repetition is always __centered__ within the filled object. No matter the scale, a fill "tile" will reside in the center of the object and then repeat outward in all directions, assuming neither of the axes is clamped (`"clampToEdge"`).

While this default centering will probably work in most cases, __offsetting__ a fill may sometimes be required. This can be accomplished by simply adjusting the `x` and `y` values of the fill, for instance:

``````lua
rect.fill.x = 0.5
rect.fill.y = 0
``````

<div class="guide-notebox">
<div class="notebox-title">Notes</div>

* Instead of setting a specific pixel value for the `x` and `y` properties, a value between `-1` and `1` is required. This tells the GPU to offset the pattern by a full repetition of the fill image's width or height. So, setting `0.5` as the `x` property will shift the pattern half of one repetition distance along the __x__ axis.

* Another important distinction is that setting a __positive__ `x` value will shift the pattern to the __left__, while a __negative__ `x` value will shift the object to the __right__. Similarly, a __positive__ `y` value will offset the pattern __upward__, and a __negative__ `y` will offset it __downward__.

</div>




<a id="align-fill"></a>

## Aligning the Fill

Expanding on the fill offset concept, it's sometimes necessary to __align__ a fill to an object's edges.

Since the size of the object being filled may not be evenly divisible by the fill image size, some clever calculations can be implemented to achieve consistent fill alignment:

``````lua
local scaleOffsetX = ( ( rect.width - 64 ) / 2 ) / 64
local scaleOffsetY = ( ( rect.height - 64 ) / 2 ) / 64
``````

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

Once again, the usage of (`64`) in these calculations indicates the width and height of the image used for the fill. To achieve proper alignment, these numbers __must__ be adjusted according to the width/height of the actual fill image being used.

</div>

With these calculated values, the repeating fill can be properly aligned as follows:

* To align the fill to the __left__ edge of the `rect` object:

<div class="code-indent" style="width: 300px;">

``````lua
rect.fill.x = offsetX
``````

</div>

* To align the fill to the __right__ edge of the `rect` object:

<div class="code-indent" style="width: 300px;">

``````lua
rect.fill.x = offsetX * -1
``````

</div>

* To align the fill to the __top__ edge of the `rect` object:

<div class="code-indent" style="width: 300px;">

``````lua
rect.fill.y = offsetY
``````

</div>

* To align the fill to the __bottom__ edge of the `rect` object:

<div class="code-indent" style="width: 300px;">

``````lua
rect.fill.y = offsetY * -1
``````

</div>




<a id="rotate-fill"></a>

## Rotating the Fill

The final potential adjustment is to __rotate__ the fill independently of the object:

<div class="float-right" style="max-width: 160px; margin-top: 14px; margin-bottom: 16px; clear: both;">

![][images.docs.repeat-fill-4]

</div>

``````lua
rect.fill.rotation = 30
``````

Fill rotation is simply performed in familiar degrees from `0` to `360`. Note that rotation is applied around the __center__ of the filled object and cannot be set to an anchor point (fills&nbsp;do not respect the `anchorX` or `anchorY`&nbsp;properties).




<a id="transition-fill"></a>

## Transitioning the Fill

A final powerful feature of repeating fills is the ability to __transition__ them via basic Corona [transitions][api.library.transition]. This allows you to move, rotate, or scale the fill pattern within the filled object, and independently so of any transition/movement that may be occurring on the filled object itself.

The key aspect in a successful fill transition is pointing to the `fill` property of the filled object as the __target__ of the transition, in this case `rect.fill`. For&nbsp;instance:

``````lua
transition.to( rect.fill, { time=4000, x=0.5 } )
``````

``````lua
transition.to( rect.fill, { time=4000, rotation=80 } )
``````

``````lua
transition.to( rect.fill, { time=4000, scaleX=0.5, scaleY=0.4 } )
``````

<div class="docs-tip-outer">
<div class="docs-tip-inner-left">
<div class="fa fa-cog"></div>
</div>
<div class="docs-tip-inner-right">

Note that this capability allows you to perform a variety of interesting effects upon an object, for example, a repeating pattern "flowing" slowly across the filled object in an endless cycle (`iterations=-1`):

``````lua
transition.to( rect.fill, { time=4000, x=rect.fill.x-1, iterations=-1 } )
``````

</div>
</div>
