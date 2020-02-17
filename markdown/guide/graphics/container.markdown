# Using Containers (Clipped Groups)

Container objects are a special kind of [group][api.type.GroupObject] in which the children are clipped by the bounds of the container.

The goal of containers is to eliminate the need for you to create custom rectangular mask images to create clipping bounds.


## Creating Containers

Containers are easily created using Corona's [display.newContainer()][api.library.display.newContainer] factory method. 

The following example creates a 300&times;300 container using an aquarium background image. 

The container clips the aquarium image so you only see the center of the original full 320&times;480 image. And as the height shrinks, the container will eventually clip the text object as well.

`````lua
local container = display.newContainer( 300, 300 )
container:translate( 160, 240 ) -- center the container

local bkgd = display.newImage( "aquariumbackgroundIPhone.jpg" )
container:insert( bkgd, true ) -- insert and center bkgd

local myText = display.newText( "Hello, World!", 0, 0, native.systemFont, 40 )
myText:setFillColor( 1, 1, 0 )
container:insert( myText, true ) -- insert and center text

-- dynamically resize the height of the container
transition.to( container, { height=20, time=2000 } )
`````


## Groups vs. Containers

Containers are just special versions of groups. The main difference is that children do not render outside the container's bounds.


## Changing the Bounds

Container bounds can be changed via the `width` and `height` properties, as shown in the example above.


## Anchor Points

The anchor points of a container control the positioning of the clipping bounds.

### Defaults

By default, the clip bounds are centered about the container's origin. You can adjust the anchor to control this.

Unlike groups, the `anchorChildren` property defaults to `true`. This means the children will move in lock-step with the clipping bounds when the anchor properties change.

### Decoupling Children From Clip Bounds

When you turn the `anchorChildren` property defaults to `false`, you allow the anchor to position the clip bounds independently from the children.

In the diagram below, we place an image object inside a group. To illustrate the clipping region of the container, we draw the entire group below the container and set the alpha to `0.3`.

The container's origin is denoted by the red dot in the center of the three images below. Each image shows the same container (with the same position and origin) but varying the `anchorY` property:

* On the left, `anchorY` is set to `1` which means the bottom of the clip is anchored to the container's origin. 
* In the middle, the default anchor value is `0.5` which means the center of the clip is anchored to the container's origin.
* On the right, `anchorY` is set to `0` which means the top of the clip is anchored to the container's origin. 

![][images.sdk.graphics.Container-anchor]


## Performance

### Texture Memory

The impact of containers on texture memory is minimal, so it is to your advantage to use containers instead of creating your own mask textures.

### Device Dependencies

* Containers work by internally creating a dynamic (rectangular) mask. This mask is implicitly applied to the group and is distinct from [object:setMask()][api.type.DisplayObject.setMask].

* Because containers use a mask and there is a nested masking limit of 3, care must be taken when inserting other masked objects into containers. Display objects that utilize masks include [display.newText][api.library.display.newText], [display.newEmbossedText][api.library.display.newEmbossedText], [widget.newScrollView][api.library.widget.newScrollView], [widget.newTableView][api.library.widget.newTableView], other containers, and any other masked image, masked vector object, or masked display group. For example, a text object (one&nbsp;mask) inside a container (one&nbsp;mask) inside yet another container (one&nbsp;mask) would reach but not exceed the limit of 3 nested masks.
