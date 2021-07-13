
# Non-Physical Collisions

Corona includes a robust <nobr>Box2D-powered</nobr> physics engine featuring [collision detection][guide.physics.collisionDetection] which can accomplish many things. It's even <nobr>event-driven</nobr> which means you can sense when collisions have started and ended, which two objects are involved in the collision, where they came into contact, and more. The only "catch" is that every colliding object must be a <nobr>physics-enabled</nobr> object under control of this physics engine which may be overkill if you're not using physics for other aspects of your game&nbsp;&mdash; for instance if all you need is basic knowledge of whether one simple object is occupying the same screen space as another. 


## Alternate Detection Methods

There are a few ways to detect collisions without using physics, including:

* Point inside a rectangle
* Separating axis theorem
* Overlapping circles
* Overlapping rectangles

The first method can be complex if the rectangle has any rotation applied to it, and the [separating axis theorem](https://gamedevelopment.tutsplus.com/tutorials/collision-detection-using-the-separating-axis-theorem--gamedev-169) is fairly <nobr>math-intensive</nobr>, so neither of these will be covered in this tutorial. Instead, we'll discuss the __overlapping&nbsp;circles__ and __overlapping&nbsp;rectangles__ methods.

<div class="guide-notebox">
<div class="notebox-title">Note</div>

Before considering <nobr>non-physical</nobr> collision detection, remember that if your objects are not basic rectangles or circles, the physics engine is almost certainly a better option. Using it, you can define complex <nobr>polygon-based</nobr> shapes, chain lines, <nobr>multi-element</nobr> constructions, and more. Basically, the two <nobr>non-physical</nobr> methods in this tutorial follow the "close&nbsp;enough" methodology, so if you need precise collisions, [physics-based collisions][guide.physics.collisionDetection] are more appropriate.

</div>


## Overlapping Circles

In some games, even objects that aren't artistically circular can often have their collision boundaries represented by a circle, for instance a circle that encloses the entire image or alternatively spans a slightly smaller area around the "center" of the object. During fast gameplay, the player probably won't notice exact <nobr>shape-precise</nobr> collision detection.

<div style="max-width: 400px; margin-top: 16px; margin-bottom: 16px;">

![][images.docs.circle-collision]

</div>

Some very simple calculations can determine if any two circles of arbitrary sizes are overlapping:

``````lua
local function hasCollidedCircle( obj1, obj2 )

	if ( obj1 == nil ) then  -- Make sure the first object exists
		return false
	end
	if ( obj2 == nil ) then  -- Make sure the other object exists
		return false
	end

	local dx = obj1.x - obj2.x
	local dy = obj1.y - obj2.y

	local distance = math.sqrt( dx*dx + dy*dy )
	local objectSize = (obj2.contentWidth/2) + (obj1.contentWidth/2)

	if ( distance < objectSize ) then
		return true
	end
	return false
end
``````

For this function, we simply pass in two display objects, `obj1` and `obj2`. Using the `contentWidth` property to determine their width, we check if the two circles are closer than the distance of their centers and, if&nbsp;so, we know that they're touching.


## Overlapping Rectangles

Overlapping rectangles are even easier to detect, using Corona's <nobr>built-in</nobr> object `contentBounds` properties:

``````lua
local function hasCollidedRect( obj1, obj2 )

	if ( obj1 == nil ) then  -- Make sure the first object exists
		return false
	end
	if ( obj2 == nil ) then  -- Make sure the other object exists
		return false
	end

	local left = obj1.contentBounds.xMin <= obj2.contentBounds.xMin and obj1.contentBounds.xMax >= obj2.contentBounds.xMin
	local right = obj1.contentBounds.xMin >= obj2.contentBounds.xMin and obj1.contentBounds.xMin <= obj2.contentBounds.xMax
	local up = obj1.contentBounds.yMin <= obj2.contentBounds.yMin and obj1.contentBounds.yMax >= obj2.contentBounds.yMin
	local down = obj1.contentBounds.yMin >= obj2.contentBounds.yMin and obj1.contentBounds.yMin <= obj2.contentBounds.yMax

	return ( left or right ) and ( up or down )
end
``````

This function works great for square or rectangular objects like tiles and cards. It uses a set of `if` statement checks to see if any corner of one rectangle is inside the bounds of the other rectangle.

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

For images that have some transparency around them, note that this __will__ include the transparent areas since the function uses the content bounds of those images. If necessary, you can adjust the math in the comparisons, for instance add or subtract a pixel value to/from the various "min" and "max" properties to account for the width of the transparency.

</div>


## Checking for Collisions

Now that you have a couple different ways to determine if two items have collided, how can you use them? Unlike <nobr>physics-based</nobr> collisions, there are not collision listener events where the system tells you exactly when objects collide. Instead, you must check periodically (or&nbsp;frequently) in your own code.

Perhaps the most obvious method is to use an `"enterFrame"` Runtime listener as follows:

* As a <nobr>constantly-running</nobr> "game&nbsp;loop" where you check for collisions on every time step.

* As a listener method which you toggle on and off as needed, for example only when the player is <nobr>touch-dragging</nobr> an object around the screen, or when the player stops dragging (releases) an object and you need to confirm that it's not overlapping another object.

Consider this example function which assumes that you have a `myPlayer` object and multiple coin objects stored in a table named `coinCache`. Assuming the player can also use <nobr>circle-based</nobr> detection, this function loops through the `coinCache` table on each frame and checks if the player has come into contact with any coins:

``````lua
local function gameLoop( event )

	for i = 1,#coinCache do
		-- Check for collision between player and this coin instance
		if ( coinCache[i] and hasCollidedCircle( myPlayer, coinCache[i] ) ) then
			-- Remove the coin from the screen
			display.remove( coinCache[i] )
			-- Remove reference from table
			coinCache[i] = nil
			-- Handle other collision aspects like increasing score, etc.
		end
	end
	return true
end
Runtime:addEventListener( "enterFrame", gameLoop )
``````


## Conclusion

That concludes our tutorial on <nobr>non-physical</nobr> collision detection. As you can see, this is a convenient method when you're building an app which requires basic collision detection and the physics engine&nbsp;&mdash; as powerful as it can&nbsp;be&nbsp;&mdash; is beyond the required needs of your tasks.


<!--- LEGAL -->

##

<div class="tiny-copy">

Character art in this tutorial is courtesy of [Kenney](https://kenney.nl/). Kenney game studio supports other developers by creating free game assets and high quality learning material.

</div>
