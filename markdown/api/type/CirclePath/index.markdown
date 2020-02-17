# CirclePath

> --------------------- ------------------------------------------------------------------------------------------
> __Parent__            [Path][api.type.Path]
> __Library__           [display.*][api.library.display]
> __Revision__          [REVISION_LABEL](REVISION_URL)      
> __See also__			[display.newCircle()][api.library.display.newCircle]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

The circle path specifies the geometry of the corresponding [circle][api.library.display.newCircle] object.

This path has limited properties which let you manipulate specific aspects of the shape object. These aspects can either be set explicitly or animated via a [transition][guide.media.transitionLib].


## Properties

_(Inherits properties from [Path][api.type.Path])_

##### path.radius
_[Number][api.type.Number]._ Radius of the circle.


## Example

``````lua
local circle = display.newCircle( 160, 240, 10 )
circle.path.radius = 50

transition.to( circle.path, { time=2000, radius=10 } )
``````
