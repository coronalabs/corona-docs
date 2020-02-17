# RoundedRectPath

> --------------------- ------------------------------------------------------------------------------------------
> __Parent__            [Path][api.type.Path]
> __Library__           [display.*][api.library.display]
> __Revision__          [REVISION_LABEL](REVISION_URL)       
> __See also__			[display.newRoundedRect()][api.library.display.newRoundedRect]
>						[Perspective and Depth][guide.graphics.3D] _(guide)_
> --------------------- ------------------------------------------------------------------------------------------


## Overview

The rounded rectangle path specifies the geometry of the corresponding [rounded rectangle][api.library.display.newRoundedRect] object.

This path has limited properties which let you manipulate specific aspects of the shape object. These aspects can either be set explicitly or animated via a [transition][guide.media.transitionLib].


## Properties

_(Inherits properties from [Path][api.type.Path])_

##### path.height
_[Number][api.type.Number]._ Height of the rounded rectangle.

##### path.radius
_[Number][api.type.Number]._ Radius of the rounded rectangle corners.

##### path.width
_[Number][api.type.Number]._ Width of the rounded rectangle.


## Example

``````lua
local roundedRect = display.newRoundedRect( 160, 240, 150, 50, 10 )
roundedRect.path.radius = 20

transition.to( roundedRect.path, { time=2000, width=100, height=100, radius=5 } )
``````