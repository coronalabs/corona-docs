#  Display Objects — Images, Text, Shapes, etc.

Corona __display objects__ encompass a wide range of visual objects that you place on the stage or within display groups. These include images, text, shapes, lines, animated sprites, and more.

<div class="guides-toc">

* [Creating Display Objects](#creating)
* [Properties and Methods](#propertiesmethods)
* [Display Hierarchy](#hierarchy)
* [Object Order](#objectorder)
* [Screen Updates](#screenupdates)
* [Object References](#reference)
* [Removing Display Objects](#remove)
* [Technical Notes](#technotes)

</div>



<a id="creating"></a>

## Creating Display Objects

Display objects are easily created using methods from Corona's [display][api.library.display] library:

<div class="inner-table">

Object							Method
------------------------------	----------------------------
Display Group					[display.newGroup()][api.library.display.newGroup]
Standard Image					[display.newImage()][api.library.display.newImage]
Dynamically-Selected Image		[display.newImageRect()][api.library.display.newImageRect]
Text							[display.newText()][api.library.display.newText]
Animated Sprite					[display.newSprite()][api.library.display.newSprite]
Rectangle						[display.newRect()][api.library.display.newRect]
Circle							[display.newCircle()][api.library.display.newCircle]
Rounded Rectangle				[display.newRoundedRect()][api.library.display.newRoundedRect]
Line							[display.newLine()][api.library.display.newLine]
Polygon							[display.newPolygon()][api.library.display.newPolygon]
Embossed Text					[display.newEmbossedText()][api.library.display.newEmbossedText]
Container						[display.newContainer()][api.library.display.newContainer]
Snapshot						[display.newSnapshot()][api.library.display.newSnapshot]
Particle Emitter				[display.newEmitter()][api.library.display.newEmitter]
Mesh							[display.newMesh()][api.library.display.newMesh]
------------------------------	----------------------------

</div>

<div class="guide-notebox">
<div class="notebox-title">Notes</div>

* Display objects behave essentially like normal Lua tables. This means that you can add your own properties to an object, as long as they don't conflict with reserved property or method names. A minor exception is that you cannot index into a display object as an array using numerical indices. See [Technical&nbsp;Notes](#technotes) at the end of this guide for more information.

* Most display objects have an [anchor point][guide.graphics.transform-anchor] which defaults to the object's __center__. In contrast, display groups do not, by default, respect anchor points. Also, the default origin of display groups is `0,0` which is located at the <nobr>__top-left corner__</nobr> of the stage, not the center. Thus, if you simply place a <nobr>non-group</nobr> display object on the stage at coordinates `0,0`, its center point will be positioned in the <nobr>top-left</nobr> corner of the stage. For more information, please see [Transforms and Anchors][guide.graphics.transform-anchor] and the [Group Programming][guide.graphics.group] guide.

</div>




<a id="propertiesmethods"></a>

## Properties and Methods

Display objects are all first-class citizens. You can move them, rotate them, animate (transition) them, and much more using [common&nbsp;properties&nbsp;and&nbsp;methods][api.type.DisplayObject].

__Properties__ are accessed via the __dot operator__. For example, you can change the alpha of an object to 50% by coding:

``````lua
local myImage = display.newImage( "image.png" )
myImage.alpha = 0.5  --change the alpha property
``````

__Methods__ are executed via the __colon operator__. For example, you can translate (move) an object by coding:

``````lua
local myImage = display.newImage( "image.png" )
myImage:translate( 10, 50 )  --move the object 10 pixels right and 50 pixels down.
``````




<a id="hierarchy"></a>

## Display Hierarchy

The screen/display in Corona consists of the [stage][api.type.StageObject] and an optional hierarchy of child [display&nbsp;groups][api.type.GroupObject]. A display group is a special kind of display object that can contain child objects. This makes it possible to organize your display objects into groups and build relationships between other groups. Please refer to the [Group&nbsp;Programming][guide.graphics.group] guide for more information on this topic.

Display objects are added to the stage by default. However, you'll usually need to insert a display object into a specific display group. This is accomplished through two methods:

### Inline Method

As a convenience, most display objects accept a display group as the first argument to the API call. This will insert the object into that group.

``````lua
local myGroup = display.newGroup()

--create object in 'myGroup'
local myImage = display.newImage( myGroup, "image.png" )
``````

### Direct Method

The direct method inserts a display object into the specified group. This method can also be used to move an object from one group to another. Note that an object can't exist in two groups at once, so inserting it into a different group also removes it from its current group.

``````lua
local myGroup = display.newGroup()

--create object on the stage (default)
local myImage = display.newImage( "image.png" )

--insert object into 'myGroup'
myGroup:insert( myImage )
``````

<div class="guide-notebox">
<div class="notebox-title">Note</div>

Although display groups are essentially tables, Lua library functions like `table.insert()` and `ipairs()` are __not__ compatible with groups. In&nbsp;addition, you cannot get the number of children in a display group using `#myGroup`. Instead, use `myGroup.numChildren`.

</div>




<a id="objectorder"></a>

## Object Order

Within a particular display group, objects are drawn in back-to-front order. Thus, the __first__ object you create will reside __behind__ objects created later.

Fortunately, the ordering of display objects is not set in stone. You can change the relative ordering of an object at any time. The order in which a display group's children are drawn is determined by the order of the array. Using the `group:insert()` method, you can reorder the position of an object within its parent group.

``````lua
local square = display.newRect( myGroup, 0, 0, 100, 100 )  --red square is at the bottom
square:setFillColor( 1, 0, 0 )
local circle = display.newCircle( myGroup, 80, 120, 50 )  --green circle is in the middle
circle:setFillColor( 0, 1, 0 )
local rect = display.newRect( myGroup, 0, 0, 120, 80 )  --blue rectangle is at the top
rect:setFillColor( 0, 0, 1 )

--'square', 'circle', and 'rect' all have same parent ('myGroup')
local parent = square.parent
 
--move 'square' to the top (siblings at higher indices reside above those at lower ones)
--conceptually, this just re-inserts the object at the top of its group
parent:insert( square )
 
--move 'circle' 'below all other siblings
parent:insert( 1, circle )
``````

In addition, objects can also be moved within a group using the `object:toBack` and `object:toFront` methods.




<a id="screenupdates"></a>

## Screen Updates

The basic drawing model involves a cycle of executing Lua code and rendering objects in the display hierarchy. During this cycle, the screen only updates when objects in the display change. These changes occur by adding, removing, or changing properties of the child display objects. 

The screen never updates while a block of Lua code is executing. Therefore, if you modify a display object multiple times in a code block — updating the `x` position, for example — only the __last__ change (the final `x` setting) will reflect when the screen updates.




<a id="reference"></a>

## Object References

Because objects can be reordered in the hierarchy, using integer indices to access display group children is fragile. If you move a child above its sibling, all integer indices in your code must be updated.

In most cases, it's easiest to refer to a display object by its variable name. Variables can be named whatever you wish __except__ for names that begin with a number or names that are reserved by Lua or Corona. These naming rules apply to all variables in Lua, so please commit them to memory.

``````lua
local yellowDuck = display.newText( "Quack!", 50, 50, "Arial", 60 )  --OK!

local orangeTiger22 = display.newText( "Roar!", 50, 50, "Arial", 60 )  --OK!

local 23dog = display.newText( "Woof!", 50, 50, "Arial", 60 )  --unacceptable! (name begins with a number)

local and = display.newText( "and", 50, 50, "Arial", 60 )  --unacceptable! ('and' is a Lua-reserved term)
``````

Another option is to insert certain display objects into a standard Lua table for organizational purposes. This method is useful if you want to reference a set of objects independent of their display group. For example:

``````lua
local squares = display.newGroup()

local redSquare1 = display.newRect( squares, 0, 0, 40, 40 )
local redSquare2 = display.newRect( squares, 0, 0, 40, 40 )
local redSquare3 = display.newRect( squares, 0, 0, 40, 40 )
redSquare1:setFillColor( 1, 0, 0 )
redSquare2:setFillColor( 1, 0, 0 )
redSquare3:setFillColor( 1, 0, 0 )

local whiteSquare1 = display.newRect( squares, 0, 0, 40, 40 )
local whiteSquare2 = display.newRect( squares, 0, 0, 40, 40 )
whiteSquare1:setFillColor( 1 )
whiteSquare2:setFillColor( 1 )

--insert only the red squares into a table
local redSquares = { redSquare1, redSquare2, redSquare3 }
``````

While both the red squares and white squares reside in the `squares` display group, you can manipulate just the red squares by looping through the `redSquares` table:

``````lua
for i = 1, #redSquares do
	--manipulate the square at the current index (i)
	redSquares[i].x = redSquares[i].x + 100
	redSquares[i]:scale( 0.5, 0.5 )
end
``````

Note that if you use this method to store/organize display objects, you __must__ remove the references from the table when the objects are cleared from the screen.




<a id="remove"></a>

## Removing Display Objects

Because devices have limited memory, it's important to remove display objects from the display hierarchy when you no longer need them. This helps overall system performance by reducing memory consumption (especially texture memory) as well as eliminating unnecessary screen drawing.

There are two basic methods to remove display objects from the display hierarchy.

### Direct Removal

This method targets a particular display object and removes it from the display.

``````lua
display.remove( myObject )

--OR

myObject:removeSelf()

--OR

myGroup:remove( myObject )  --group array index also valid
``````

However, none of these methods completely frees the memory consumed by the display object. To prevent memory leaks, you __must__ eliminate all variable references to a display object. This is achieved by setting the reference to `nil`.

``````lua
display.remove ( myObject )
myObject = nil  --set reference to nil!

--OR

myObject:removeSelf()
myObject = nil  --set reference to nil!

--OR

myGroup:remove( myObject )
myObject = nil  --set reference to nil!
``````

### Group Removal

This method removes all children in a display group — all you need to do is remove the display group itself and then `nil` its reference.

``````lua
display.remove( myGroup )
myGroup = nil

--OR

myGroup:removeSelf()
myGroup = nil
``````

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

* As mentioned in the [Object References](#reference) section above, if there are other variables or references that point to a display object, it cannot be completely freed from memory. The solution is to `nil` out __all__ of these external references. Once that is done, Lua can free the memory allocation.

* Global variables are never automatically freed from memory, so if a global variable points to a display object, it will continue to occupy memory even if the object is no longer in the display hierarchy. Remember to `nil` all global references to display objects.

* When you remove a display object, event listeners that are attached to it — tap and touch listeners, for example — are also freed from memory. You don't need to explicitly remove event listeners that are isolated to the object.

* [Transitions][api.library.transition] that are applied to an object should be cancelled and set to `nil` before you remove the object. Since display objects are essentially Lua tables, one convenient method is to set the transition as a property of the display object itself. This allows you to easily access and cancel it.

</div>




<a id="technotes"></a>

## Technical Notes

Near the beginning of this guide, we mentioned that display objects behave "essentially" like Lua tables. An exception to this rule is that you cannot set the metatables of display objects. This is due to the nature of our C++/Lua integration in this particular case.

Corona display objects are native C++ objects internally. Lua implements binding of native pointers with "userdata," which sets the metatable. Userdata metatables cannot be replaced by Lua code; this is a measure defined by Lua itself.

Normally, native objects bound to Lua in this way do not behave like tables. There are several examples of this in Corona. Such objects may have properties and/or methods, but they are not extensible. In contrast, Corona display objects do behave like tables — this is a convenience feature, and the alternative would have been a field of "userdata" providing access to custom data associated with the display object. Merging this functionality directly into the display object is easier and more extensible for the end user.

Essentially, the underlying native bridge is constrained by what is allowed in Lua, and we consider this architectural choice as a fundamental Corona feature. Ultimately, Corona is a C++/OpenGL engine with frameworks designed for rapid development, and these advantages justify the use of metatables for display objects.