# object.isFixedRotation

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Boolean][api.type.Boolean]
> __Object__            [Body][api.type.Body]
> __Library__           [physics.*][api.library.physics]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          body, isFixedRotation
> --------------------- ------------------------------------------------------------------------------------------

## Overview

A boolean for whether the rotation of the body should be locked, even if the body is under load or subjected to <nobr>off-center</nobr> forces. The default is `false`.

<div class="docs-tip-outer docs-tip-color-alert">
<div class="docs-tip-inner-left">
<div class="fa fa-exclamation-circle" style="font-size: 35px;"></div>
</div>
<div class="docs-tip-inner-right">

It's critical that you set this body property __after__ the object is already made into a physical object via [physics.addBody()][api.library.physics.addBody]. If you apply this property __before__ the [physics.addBody()][api.library.physics.addBody] command for the object, it will merely be treated as a property of the object like any other custom property and, in that case, it will __not__ cause any physical change in terms of locking rotation.

</div>
</div>


## Example

``````lua
-- Create a rectangle
local myRect = display.newRect( 0, 0, 20, 100 )

-- Add a body to the rectangle
physics.addBody( myRect, "dynamic" )

myRect.isFixedRotation = true
``````
