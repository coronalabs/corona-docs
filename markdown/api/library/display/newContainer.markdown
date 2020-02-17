
# display.newContainer()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [display.*][api.library.display]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          groups, container
> __See also__          [Using Containers][guide.graphics.container] _(guide)_
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Containers are a special kind of group in which the children are clipped (masked) by the bounds of the container.

See the [Using Containers][guide.graphics.container] guide for more information.

## Syntax

	display.newContainer( [parent,] width, height )

## Gotchas

Container objects are created using a mask and there is a nested masking limit of 3. Thus, care must be taken when inserting other masked objects into containers. Display objects that utilize masks include [display.newText][api.library.display.newText], [display.newEmbossedText][api.library.display.newEmbossedText], [widget.newScrollView][api.library.widget.newScrollView], [widget.newTableView][api.library.widget.newTableView], other containers, and any other masked image, masked vector object, or masked display group. For example, a text object (one&nbsp;mask) inside a container (one&nbsp;mask) inside yet another container (one&nbsp;mask) would reach but not exceed the limit of 3 nested masks.

## Example

`````lua
-- Create a container
local container = display.newContainer( 128, 128 )

-- Create an image
local bkgd = display.newImage( "aquariumbackgroundIPhone.jpg" )
-- Insert the image into the container
container:insert( bkgd, true )
-- Center the container in the display area
container:translate( display.contentWidth*0.5, display.contentHeight*0.5 )

-- Transition (rotate) the container
transition.to( container, { rotation=360, transition=easing.inOutExpo} )
`````