# display.getReservedRegions()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__				[Function][api.type.Function]
> __Library__			[display.*][api.library.display]
> __Return value__		[Array][api.type.Array]
> __Revision__			[REVISION_LABEL](REVISION_URL)
> __Keywords__			reserved region, camera cutout, fold, hinge, safe area
> __See also__          [display.getSafeAreaInsets()][api.library.display.getSafeAreaInsets]
>						[fold][api.event.fold]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Returns an array of the screen regions that the system reserves, in content coordinates. A region is one of two kinds:

* `"occlusion"` &mdash; Hardware that hides content, such as a camera cutout.
* `"division"` &mdash; A fold or hinge that splits the screen into separate areas.

[display.getSafeAreaInsets()][api.library.display.getSafeAreaInsets] only gives a distance from each edge. This function gives the exact rectangle of each region, so you can draw around a camera cutout or lay content out on either side of a fold.

Each element of the array is a table with these properties:

* `kind` &mdash; [String][api.type.String], either `"occlusion"` or `"division"`.
* `isActive` &mdash; [Boolean][api.type.Boolean] indicating whether the region currently affects content. For example, a fold may only be active while the device is partly open.
* `x`, `y` &mdash; [Numbers][api.type.Number] giving the region's <nobr>top-left</nobr> corner.
* `width`, `height` &mdash; [Numbers][api.type.Number] giving the region's size.

The array is empty when there are no reserved regions.

<div class="guide-notebox">
<div class="notebox-title">Note</div>

Reserved regions are currently reported on iOS and iPadOS versions that provide them. Other platforms, including Android and the Simulator, return an empty array. On Android, use the `bounds` property of the [fold][api.event.fold] event to find the hinge.

</div>


## Syntax

	display.getReservedRegions( [kind] )

##### kind ~^(optional)^~
_[String][api.type.String]._ Pass `"occlusion"` or `"division"` to return only regions of that kind. If omitted, regions of both kinds are returned.


## Example

``````lua
-- Outline every camera cutout and fold on the screen
for _, region in ipairs( display.getReservedRegions() ) do
	local outline = display.newRect( region.x + region.width*0.5, region.y + region.height*0.5, region.width, region.height )
	outline:setFillColor( 0, 0, 0, 0 )
	outline.strokeWidth = 2
	print( region.kind, region.isActive )
end

-- Only look at the fold
local folds = display.getReservedRegions( "division" )
if ( #folds > 0 and folds[1].isActive ) then
	print( "Fold is at y = " .. folds[1].y )
end
``````
