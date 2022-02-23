# animation.to()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__				[Function][api.type.Function]
> __Return value__		[Tween][plugin.animation.type.Tween]
> __Revision__			[REVISION_LABEL](REVISION_URL)
> __Keywords__			animation, tween, timeline, interpolation, to
> __See also__			[Animation &mdash; Tweens and Timelines][guide.media.animationLibrary] _(guide)_
>						[animation.from()][plugin.animation.from]
>						[Tween][plugin.animation.type.Tween]
>						[Timeline][plugin.animation.type.Timeline]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

This function animates (interpolates) properties of an object using an optional [easing][api.library.easing] algorithm. It returns a [Tween][plugin.animation.type.Tween] reference corresponding to the interpolation of the object `target`.


## Syntax

    animation.to( target, properties, params )

##### target ~^(required)^~
_[DisplayObject][api.type.DisplayObject] or [Userdata][api.type.Userdata]._ The display object, [RectPath][api.type.RectPath] point, [Paint][api.type.Paint] fill, or [fill.effect][api.type.Paint.effect] to tween.

##### properties ~^(required)^~
_[Table][api.type.Table]._ A table that specifies the properties of the object that will be interpolated. These include the following options:

* Properties of a [display object][api.type.DisplayObject] such as [x][api.type.DisplayObject.x], [y][api.type.DisplayObject.y], [rotation][api.type.DisplayObject.rotation], [alpha][api.type.DisplayObject.alpha], [xScale][api.type.DisplayObject.xScale], [yScale][api.type.DisplayObject.yScale], [width][api.type.DisplayObject.width], [height][api.type.DisplayObject.height], [anchorX][api.type.DisplayObject.anchorX], [anchorY][api.type.DisplayObject.anchorY], [maskX][api.type.DisplayObject.maskX], [maskY][api.type.DisplayObject.maskY], [maskScaleX][api.type.DisplayObject.maskScaleX], and [maskScaleY][api.type.DisplayObject.maskScaleY].
* Font size of a [TextObject][api.type.TextObject] created via [display.newText()][api.library.display.newText].
* Properties related to quadrilateral distortion of a [RectPath][api.type.RectPath], applicable only to a [ShapeObject][api.type.ShapeObject]. These include `x1`, `y1`, `x2`, `y2`, `x3`, `y3`, `x4`, and `y4`. See [here][guide.graphics.3D#quadrilateral-distortion] for more information.
* RGB+A color channels <nobr>(`r`, `g`, `b`, and `a`)</nobr>, applicable only if the target is the `.fill` table of a [ShapeObject][api.type.ShapeObject].
* A [filter effect][guide.graphics.effects#filter] property associated with a specific filter effect, applicable only to the object's [fill.effect][api.type.Paint.effect] property. See [here][guide.graphics.effects#filter] for details on which filter parameters apply to each filter effect.

##### params ~^(required)^~
_[Table][api.type.Table]._ A table which specifies control parameters for the tween&nbsp;&mdash; see the next section for details.


<a id="params"></a>

## Parameter Reference

The `params` table includes parameters which control aspects of the tween.

##### time ~^(optional)^~
_[Number][api.type.Number]._ Specifies the duration of the tween in milliseconds. Default is `500`.

##### speedScale ~^(optional)^~
_[Number][api.type.Number]._ Adjusts the relative speed scale for the tween. This must be a positive number greater than `0`. By default, the speed scale is `1` (normal&nbsp;speed). Values greater than `1` will increase the speed while values lower than `1` will decrease it.

##### easing ~^(optional)^~
_[Function][api.type.Function]._ Specifies the [easing][api.library.easing] algorithm. Default is `easing.linear`.

##### delay ~^(optional)^~
_[Number][api.type.Number]._ Specifies the delay, in milliseconds, before the tween begins. Default is `0`.

##### iterations ~^(optional)^~
_[Number][api.type.Number]._ Specifies the number of times the tween will repeat. By default, the iteration value is `1` (no&nbsp;repeat). To make a tween repeat indefinitely, specify `0` or `-1` for this parameter.

##### reflect ~^(optional)^~
_[Boolean][api.type.Boolean]._ Specifies whether alternate iterations of the tween are reflected (played&nbsp;back in&nbsp;reverse). Default is `false`.

##### tag ~^(optional)^~
_[String][api.type.String]._ Specifies the tween tag. The animation library can pause, resume, cancel, set the position, or set the speed scale of tweens sharing the same tag.

##### id ~^(optional)^~
_[String][api.type.String]._ An optional identification string to assign to the tween. This can be retrieved as `obj.id` from any of the tween event listener functions (see&nbsp;below).

##### delta ~^(optional)^~
_[Boolean][api.type.Boolean]._ Specifies whether non-control parameters are interpreted as final ending values or as changes in value. The default is `false`.

<a id="constantrate"></a>

##### constantRate ~^(optional)^~
_[Number][api.type.Number]._ Specifies the amount of <nobr>per-second</nobr> change to an object's position, rotation, alpha, or scale. If you specify this parameter, you must also include the `constantRateProperty` parameter to indicate which object state governs the interpolation. Together, these two parameters can be used to interpolate multiple objects at a constant rate, even if they don't share the same initial/final position, rotation, alpha, or scale. Note that if you supply this parameter, the `time` parameter is ignored, since <nobr>constant-rate</nobr> interpolations do not adhere to a specific time duration. Also note that <nobr>constant-rate</nobr> interpolations that use a <nobr>non-linear</nobr> easing function will produce unpredictable results.

##### constantRateProperty ~^(optional)^~
_[String][api.type.String]._ Indicates which object state governs a <nobr>constant-rate</nobr> interpolation. Valid options include `"position"`, `"rotation"`, `"alpha"`, or `"scale"`. This parameter __must__ be specified if you supply the `constantRate` parameter.

##### onStart ~^(optional)^~
_[Listener][api.type.Listener]._ Listener function to be called before the tween begins. This function will receive a reference to the associated [Tween][plugin.animation.type.Tween] as its sole argument.

##### onComplete ~^(optional)^~
_[Listener][api.type.Listener]._ Listener function to be called after the tween completes. This function will receive a reference to the associated [Tween][plugin.animation.type.Tween] as its sole argument.

##### onPause ~^(optional)^~
_[Listener][api.type.Listener]._ Listener function to be called when the tween is paused. This function will receive a reference to the associated [Tween][plugin.animation.type.Tween] as its sole argument.

##### onResume ~^(optional)^~
_[Listener][api.type.Listener]._ Listener function to be called when the tween is resumed. This function will receive a reference to the associated [Tween][plugin.animation.type.Tween] as its sole argument.

##### onCancel ~^(optional)^~
_[Listener][api.type.Listener]._ Listener function to be called when the tween is cancelled. This function will receive a reference to the associated [Tween][plugin.animation.type.Tween] as its sole argument.

##### onRepeat ~^(optional)^~
_[Listener][api.type.Listener]._ Listener function to be called when the tween completes an iteration in a repeat cycle. This function will receive a reference to the associated [Tween][plugin.animation.type.Tween] as its sole argument.

##### onPositionChange ~^(optional)^~
_[Listener][api.type.Listener]._ Listener function to be called when the tween has its playback position changed manually via [animation.setPosition()][plugin.animation.setPosition] or [object:setPosition()][plugin.animation.type.Tween.setPosition].


## Examples

##### Basic Movement

``````lua
local square = display.newRect( 0, 0, 100, 100 )

local w, h = display.contentWidth, display.contentHeight

local function tweenListener( obj )
	print( "Tween completed; ID: " .. obj.id )
end

-- Move square to bottom right corner
animation.to( square, { x=(w-50), y=(h-50) }, { time=1500, id="tween1", onComplete=tweenListener } )
``````

##### Constant Rate Movement

``````lua
local square1 = display.newRect( 50, 50, 100, 100 )
square1:setFillColor( 1, 0, 0 )
local square2 = display.newRect( 50, 150, 100, 100 )
square2:setFillColor( 0, 1, 0 )
local square3 = display.newRect( 50, 250, 100, 100 )
square3:setFillColor( 0, 0, 1 )

local w, h = display.contentWidth, display.contentHeight

local cr = 50  -- Set a constant rate for movement (pixels per second)

-- Move each square at a constant rate to its final position
animation.to( square1, { x=(w-50) }, { constantRate=cr, constantRateProperty="position" } )
animation.to( square2, { x=(w-150) }, { constantRate=cr, constantRateProperty="position" } )
animation.to( square3, { x=(w-100) }, { constantRate=cr, constantRateProperty="position" } )
``````

##### Quadrilateral Distortion Tween

``````lua
local square = display.newRect( 0, 0, 100, 100 )

-- Tween the path corner points of the square
-- Notice that the target being tweened is "square.path", not "square"
animation.to( square.path, { x1=10, y1=10, x2=20, y2=-20, x3=-10, y3=-10, x4=-40, y4=40 }, { time=1500 } )
``````

##### Fill Effect Property Tween

``````lua
local logo = display.newImageRect( "logo.png", 100, 100 )

-- Apply a hue filter effect to the image
logo.fill.effect = "filter.hue"

-- Tween the hue filter effect's "angle" property
-- Notice that the target being tweened is "logo.fill.effect", not "logo"
animation.to( logo.fill.effect, { angle=100 }, { time=1500 } )
``````

##### Color Channel Tween

``````lua
local square = display.newRect( 0, 0, 100, 100 )

-- Tween specific RGB+A color channels of the square
-- Notice that the target being tweened is "square.fill", not "square"
animation.to( square.fill, { r=0, g=0.2, b=0.6, a=0.8 }, { time=1500 } )
``````
