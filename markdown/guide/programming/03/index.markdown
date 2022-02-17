# Chapter 3 &mdash; Bringing it to Life


<div class="walkthrough-nav">
<div class="walkthrough-nav-upper-right">

__&lang;__ [Previous][guide.programming.02] _|_ [Next][guide.programming.04] __&rang;__

</div>
</div>


Our project is beginning to take form, but it's not yet a game. Let's breathe some life into this baby!

<div class="guides-toc">

* [Creating Asteroids](#asteroids)
* [Firing Mechanics](#firing)
* [Moving the Ship](#movingShip)
* [Game Loop](#gameloop)
* [Collision Handling](#collisions)
* [Chapter Concepts](#concepts)

</div>


<a id="asteroids"></a>

## Creating Asteroids

<div class="float-right" style="max-width: 240px; margin-bottom: 16px; clear: both;">

![][images.docs.sbs-starexplorer-3]

</div>

The creation of asteroids will be handled by a function. This function will be run (called) on a regular basis as part of our __game&nbsp;loop__, a function which is called on a repeating basis to handle various game functionality.

Like our previous functions, we begin with <nobr>`local function`</nobr> followed by the name of the function and a pair of parentheses. Naturally, we also close the function with an `end` command:

``````{ brush="lua" gutter="true" first-line="89" highlight="[95,96,97,98]" }
local function updateText()
	livesText.text = "Lives: " .. lives
	scoreText.text = "Score: " .. score
end


local function createAsteroid()


end
``````

Inside the function, we begin by creating a new instance of an asteroid named `newAsteroid`, prefaced with `local` as usual. The object itself is an image just like everything else we've created so far, taken from the same image sheet (`objectSheet`) that we loaded earlier:

``````{ brush="lua" gutter="true" first-line="95" highlight="[97]" }
local function createAsteroid()

	local newAsteroid = display.newImageRect( mainGroup, objectSheet, 1, 102, 85 )
end
``````

Since there will be a lot of asteroids on the screen at any given time, we need a way to keep track of them. As you recall from the previous chapter, we initialized several variables, among them the [table][api.type.Table] named `asteroidsTable`. This table now comes into play as a place to store the new asteroid. To insert the new asteroid instance into the table, we can use the <nobr>built-in</nobr> Lua `table.insert()` command. This command just requires the name of the table (`asteroidsTable`) and the object/value to insert, in this case the `newAsteroid` object we just created:

``````{ brush="lua" gutter="true" first-line="95" highlight="[98]" }
local function createAsteroid()

	local newAsteroid = display.newImageRect( mainGroup, objectSheet, 1, 102, 85 )
	table.insert( asteroidsTable, newAsteroid )
end
``````

With the asteroid image now loaded and placed into the table, we can add it to the physics engine:

``````{ brush="lua" gutter="true" first-line="95" highlight="[99]" }
local function createAsteroid()

	local newAsteroid = display.newImageRect( mainGroup, objectSheet, 1, 102, 85 )
	table.insert( asteroidsTable, newAsteroid )
	physics.addBody( newAsteroid, "dynamic", { radius=40, bounce=0.8 } )
end
``````

<div class="guide-notebox">
<div class="notebox-title">Note</div>

As with the ship object in the previous chapter, we're taking a shortcut by adding a circular physics body (`radius=40`) to all asteroids, even though the asteroid image isn't exactly circular. In&nbsp;time, you'll learn how to add an accurate <nobr>shape-based</nobr> physics body to any object.

</div>

Finally, let's assign the asteroid a `myName` property of `"asteroid"`. Later, when detecting collisions, it will simplify things to know that this object is an asteroid.

``````{ brush="lua" gutter="true" first-line="95" highlight="[100]" }
local function createAsteroid()

	local newAsteroid = display.newImageRect( mainGroup, objectSheet, 1, 102, 85 )
	table.insert( asteroidsTable, newAsteroid )
	physics.addBody( newAsteroid, "dynamic", { radius=40, bounce=0.8 } )
	newAsteroid.myName = "asteroid"
end
``````

### Placement

Now that we have a new asteroid on the screen, let's set its point of origin. For our game, asteroids will come from the left, right, or top of the screen&nbsp;&mdash; it wouldn't be fair to have an asteroid sneak up from behind!

Given three possible points of origin, we need Lua to generate a random integer between `1` and `3`. This is easily done using the `math.random()` command with a sole parameter of `3`:

``````{ brush="lua" gutter="true" first-line="97" highlight="[102]" }
	local newAsteroid = display.newImageRect( mainGroup, objectSheet, 1, 102, 85 )
	table.insert( asteroidsTable, newAsteroid )
	physics.addBody( newAsteroid, "dynamic", { radius=40, bounce=0.8 } )
	newAsteroid.myName = "asteroid"

	local whereFrom = math.random( 3 )
end
``````

Following this command, the local variable `whereFrom` will have a value of either `1`, `2`, or `3`. Using this, we can implement a conditional <nobr>`if`-`then`</nobr> structure to handle each of the three cases. In Lua, the structure begins in this basic form:

``````{ brush="lua" gutter="true" first-line="102" highlight="[104,105,106]" }
	local whereFrom = math.random( 3 )

	if ( whereFrom == 1 ) then

	end
end
``````

<div class="guide-notebox">
<div class="notebox-title">Notes</div>

* Observe an important distinction about the Lua language: when you are __assigning__ a value to a variable, you use a single equal sign (`=`). However, if you are doing a __comparison__ in a conditional statement, you must use two equal signs (`==`) to indicate that you are checking for equality instead of assigning a value.

* To tell Lua that you're finished with a conditional structure, use the keyword `end`.

* The parentheses around the comparison are optional, but many programmers use them for clarity or to build more complex <nobr>multi-condition</nobr> statements.

</div>

<div class="float-right" style="max-width: 366px; margin-top: 6px; margin-bottom: 16px; clear: both;">

![][images.docs.sbs-starexplorer-4]

</div>

Let's use this first condition, <nobr>`whereFrom == 1`,</nobr> to place an asteroid slightly off the __left__ edge of the screen. Insert three lines so that your conditional block looks like this:

``````{ brush="lua" gutter="true" first-line="104" highlight="[105,106,107]" }
	if ( whereFrom == 1 ) then
		-- From the left
		newAsteroid.x = -60
		newAsteroid.y = math.random( 500 )
	end
end
``````

Since this asteroid will come from the left side, we set its `x` property to `-60`. This should be a sufficient amount to ensure that not even a portion of the asteroid is visible to the player when it's first created (it's&nbsp;entirely off&nbsp;screen). As for the `y` property, we use `math.random()` once again to randomly select a value between `1` and `500`, effectively making the asteroid appear somewhere between the top of the content area and about half the distance down&nbsp;&mdash; after all, we don't want any asteroids coming from a place that makes it impossible to shoot them!

### Movement

Now that we have the starting point, we need to tell the asteroid where it should move to. This time we're going to use another physics command: `object:setLinearVelocity()`. This command is similar to the [object:applyLinearImpulse()][api.type.Body.applyLinearImpulse] command which we used in the previous project, but instead of applying a sudden "push" to the object, it simply sets the object moving in a steady, consistent direction.

Add the highlighted line directly following the previous lines:

``````{ brush="lua" gutter="true" first-line="104" highlight="[108]" }
	if ( whereFrom == 1 ) then
		-- From the left
		newAsteroid.x = -60
		newAsteroid.y = math.random( 500 )
		newAsteroid:setLinearVelocity( math.random( 40,120 ), math.random( 20,60 ) )
	end
end
``````

This might look complicated, but `object:setLinearVelocity()` simply requires two numbers indicating the velocity in the __x__ and __y__ directions respectively. The only twist we're using here is `math.random()` to randomize the values so that each asteroid moves in a slightly different direction.

<div class="docs-tip-outer">
<div class="docs-tip-inner-left">
<div class="fa fa-cog"></div>
</div>
<div class="docs-tip-inner-right">

Notice that we call `math.random()` with __two__ parameters this time, while before we called it with just one. When called with one parameter, the command randomly generates an integer between `1` and the value you indicate. When called with two parameters, the command randomly generates an integer between the two specified values, for example between `40` and `120` in the first instance above.

</div>
</div>

If we decided to call/run this function now, we might see an asteroid slowly moving across the screen from the left side, but probably not. Why? Because we haven't added conditional cases for the other two sides of the screen! Remember, Lua is randomly choosing a number between `1` and `3`, but currently we're only handling the occurrence of `1`, so there's just &frac13; chance that our current code will generate an asteroid.

The following two conditions will complete the three possible sides from which asteroids can originate. When adding multiple conditions into the same <nobr>`if`-`then`</nobr> structure, those following the first condition should begin with `elseif`, __not__ with `if`. Observe these additions:

``````{ brush="lua" gutter="true" first-line="104" highlight="[109,110,111,112,113,114,115,116,117,118]" }
	if ( whereFrom == 1 ) then
		-- From the left
		newAsteroid.x = -60
		newAsteroid.y = math.random( 500 )
		newAsteroid:setLinearVelocity( math.random( 40,120 ), math.random( 20,60 ) )
	elseif ( whereFrom == 2 ) then
		-- From the top
		newAsteroid.x = math.random( display.contentWidth )
		newAsteroid.y = -60
		newAsteroid:setLinearVelocity( math.random( -40,40 ), math.random( 40,120 ) )
	elseif ( whereFrom == 3 ) then
		-- From the right
		newAsteroid.x = display.contentWidth + 60
		newAsteroid.y = math.random( 500 )
		newAsteroid:setLinearVelocity( math.random( -120,-40 ), math.random( 20,60 ) )
	end
end
``````

With these lines, all three conditions are properly accounted for. Now, when this function is called/run, an asteroid will randomly appear in one of the three specified regions and begin moving across the screen.

### Rotation

Let's wrap up the `createAsteroid()` function with an additional command for visual interest. To make the asteroids slowly rotate about their central point as they move through space, we can apply a random amount of torque (rotational&nbsp;force). Following the <nobr>`if`-`then`</nobr> structure (after&nbsp;its closing `end`&nbsp;statement), add the following highlighted command:

``````{ brush="lua" gutter="true" first-line="114" highlight="[121]" }
	elseif ( whereFrom == 3 ) then
		-- From the right
		newAsteroid.x = display.contentWidth + 60
		newAsteroid.y = math.random( 500 )
		newAsteroid:setLinearVelocity( math.random( -120,-40 ), math.random( 20,60 ) )
	end

	newAsteroid:applyTorque( math.random( -6,6 ) )
end
``````




<a id="firing"></a>

## Firing Mechanics

<div class="float-right" style="max-width: 240px; margin-bottom: 16px; clear: both;">

![][images.docs.sbs-starexplorer-5]

</div>

What is a shooting game without shooting?

Getting our ship to fire lasers is similar to loading asteroids, but this time we'll use a convenient and powerful method to move them known as a __transition__. Essentially, a transition is an animation method which allows you to change the "state" of an object across a defined amount of time&nbsp;&mdash; this can include the position, scale, rotation, opacity, and more. You can even perform multiple transition effects in one line and specify an "easing" algorithm to make the transition run with <nobr>non-linear</nobr> interpolation.

We'll discuss transitions more in a bit. First, let's add the function that will create a new laser object:

``````{ brush="lua" gutter="true" first-line="121" highlight="[125,126,127,128,129,130,131]" }
	newAsteroid:applyTorque( math.random( -6,6 ) )
end


local function fireLaser()

	local newLaser = display.newImageRect( mainGroup, objectSheet, 5, 14, 40 )
	physics.addBody( newLaser, "dynamic", { isSensor=true } )
	newLaser.isBullet = true
	newLaser.myName = "laser"
end
``````

Most of this code should be straightforward:

1. We create a new laser object inside the `mainGroup` display group, using `5` for the frame number since the laser is the 5th frame in our image sheet configuration.

2. We add it to the physics engine as a sensor type object (`isSensor=true`).

3. We indicate that the laser should be treated as a "bullet" by setting its `isBullet` property to `true`. This makes the object subject to continuous collision detection rather than periodic collision detection at world time steps. Because our laser will be moving very quickly across the screen, this will help ensure that it doesn't "pass&nbsp;through" any asteroids without registering a collision.

4. Finally, we assign the object a `myName` property of `"laser"` which, similar to the ship and asteroids, will be useful when detecting collisions.

### Placement

The new laser object is now loaded, but we haven't yet positioned it correctly. In this case, we can't use a static position because the ship will eventually be moving left and right via the player's control. Fortunately, it's very easy to position the new laser at the exact same place as the ship by setting its `x` and `y` values to the ship's `x` and `y` values:

``````{ brush="lua" gutter="true" first-line="125" highlight="[132,133]" }
local function fireLaser()

	local newLaser = display.newImageRect( mainGroup, objectSheet, 5, 14, 40 )
	physics.addBody( newLaser, "dynamic", { isSensor=true } )
	newLaser.isBullet = true
	newLaser.myName = "laser"

	newLaser.x = ship.x
	newLaser.y = ship.y
end
``````

<div class="float-right" style="max-width: 288px; margin-top: 16px; clear: both;">

![][images.docs.sbs-starexplorer-6]

</div>

<div class="float-right" style="max-width: 288px; margin-top: 16px; margin-bottom: 16px; clear: both;">

![][images.docs.sbs-starexplorer-7]

</div>

This will correctly position the laser horizontally and vertically, but there's one further issue to resolve. Because this function creates new lasers __after__ the ship has already been loaded, and both objects are part of the `mainGroup` display group, lasers will appear visually above (in&nbsp;front&nbsp;of) the ship in terms of layering. Clearly this looks silly, so let's push it behind the ship with the following highlighted command:

``````{ brush="lua" gutter="true" first-line="132" highlight="[134]" }
	newLaser.x = ship.x
	newLaser.y = ship.y
	newLaser:toBack()
end
``````

<div class="docs-tip-outer">
<div class="docs-tip-inner-left">
<div class="fa fa-cog"></div>
</div>
<div class="docs-tip-inner-right">

The `object:toBack()` command sends an object to the very back of its own display group, but that's not necessarily the very back of the entire parent [stage][api.type.StageObject] group. The above command will send the laser object to the back of its display group (`mainGroup`), but it will still appear in front of the background image contained within `backGroup`.

</div>
</div>

### Movement

As mentioned earlier, we'll move the laser up the screen using a __transition__. Most transitions are performed with the `transition.to()` command. In its most simple form, this command accepts an object reference, such as the laser, and a table of parameters to change over a specified time.

Add the following highlighted line to the `fireLaser()` function:

``````{ brush="lua" gutter="true" first-line="132" highlight="[136]" }
	newLaser.x = ship.x
	newLaser.y = ship.y
	newLaser:toBack()

	transition.to( newLaser, { y=-40, time=500, } )
end
``````

As you can see, the first parameter is the object to transition (`newLaser`). For the second parameter, we include a __table__ which can contain various properties for the transition. Here, we set `y=-40` which indicates the laser's vertical __destination__, slightly off the top edge of the screen. We also set a custom `time` parameter of `500`. For transitions, the time (duration) should always be specified in __milliseconds__&nbsp;&mdash; remember that 1 second equals 1000 milliseconds, so this transition will occur over a duration of &frac12; second.

### Cleanup

Great! New lasers will now correctly appear at the same location as the ship (visually&nbsp;behind it&nbsp;too) and move upward across the screen. There is just one last thing to implement, and it's very important: __cleanup__. In any app, it's critical that you remove objects from the game which are no longer needed. If you don't, the app will eventually slow to a crawl, run out of memory, and crash&nbsp;&mdash; not a good experience for the player!

There are various approaches toward cleanup and it will depend on the situation. For the lasers, we're going to use a very convenient method known as an `onComplete` callback. Available as an option within `transition.to()` and several other commands, this tells CORONA_CORE_PRODUCT that you want to call a function when something "completes." This is ideal for removing lasers which have completed their transition, so let's expand our `transition.to()` command to include an `onComplete` callback:

``````{ brush="lua" gutter="true" first-line="132" highlight="[137]" }
	newLaser.x = ship.x
	newLaser.y = ship.y
	newLaser:toBack()

	transition.to( newLaser, { y=-40, time=500,
		onComplete = function() display.remove( newLaser ) end
	} )
end
``````

Simply stated, this addition runs a function when the transition completes. Inside the function, the only command we need is `display.remove( newLaser )` which removes the laser object from the stage. Beyond that, Lua's <nobr>built-in</nobr> garbage collection process will automatically free up memory that was allocated to the object.

<div class="docs-tip-outer">
<div class="docs-tip-inner-left">
<div class="fa fa-cog"></div>
</div>
<div class="docs-tip-inner-right">

Those with a keen eye will notice that the function specified after <nobr>`onComplete =`</nobr> doesn't have a name. In Lua, this is known as an __anonymous&nbsp;function__. These are useful as "temporary" functions, for functions needed as a parameter to another function, etc. Although we could write a dedicated function to remove the lasers and call it via the `onComplete` callback, it's easier to use an anonymous function in this case.

</div>
</div>

### Tap Listener

We're almost done with the firing mechanics&nbsp;&mdash; let's finish up by assigning the ship a `"tap"` event listener so that the player can actually fire lasers. Immediately following the `fireLaser()` function (after&nbsp;its closing `end`&nbsp;statement), add the following command:

``````{ brush="lua" gutter="true" first-line="136" highlight="[141]" }
	transition.to( newLaser, { y=-40, time=500,
		onComplete = function() display.remove( newLaser ) end
	} )
end

ship:addEventListener( "tap", fireLaser )
``````

<div class="docs-tip-outer docs-tip-color-action">
<div class="docs-tip-inner-left">
<div class="fa fa-video-camera" style="font-size: 29px; padding-top: 4px;"></div>
</div>
<div class="docs-tip-inner-right">

Let's check the result of our code. Save your modified `main.lua` file, relaunch the Simulator, and try tapping/clicking on the ship to see how it fires lasers. Now we're getting somewhere!

</div>
</div>




<a id="movingShip"></a>

## Moving the Ship

In this game, in addition to firing lasers, the player will be able to touch and drag the ship along the bottom of the screen. To handle this type of movement, we need a function to handle touch/drag events. Let's create this function in the usual manner:

``````{ brush="lua" gutter="true" first-line="141" highlight="[144,145,146,147]" }
ship:addEventListener( "tap", fireLaser )


local function dragShip( event )


end
``````

<div class="docs-tip-outer">
<div class="docs-tip-inner-left">
<div class="fa fa-cog"></div>
</div>
<div class="docs-tip-inner-right">

Notice that, unlike our previous functions, this function has the keyword `event` in the parentheses following its name. As you learned in the `BalloonTap` project, CORONA_CORE_PRODUCT is largely an <nobr>[event][api.type.Event]-based</nobr> framework where information is dispatched during a specific event to an event [listener][api.type.Listener].

Specifically for this routine, the `event` parameter ([table][api.type.Table]) tells us what object the user is touching/dragging, the location of the touch in content space, and a few other pieces of information. You'll see this `event` parameter used frequently as you move forward and study existing code samples, so it's a good idea to become familiar with it now.

</div>
</div>

Inside the function, to make things a little clearer, let's set a local variable `ship` equal to `event.target`. In touch/tap events, `event.target` is the object which was touched/tapped, so setting this local variable as a reference to the ship object will save us some typing as we work through the function.

``````{ brush="lua" gutter="true" first-line="144" highlight="[146]" }
local function dragShip( event )

	local ship = event.target
end
``````

### Touch Events

Touch events, distinct from tap events, have four distinct __phases__ based on the state of the user's touch:

* `"began"` — indicates that a touch has started on the object (initial&nbsp;touch on the&nbsp;screen).
* `"moved"` — indicates that a touch position has moved on the object.
* `"ended"` — indicates that a touch has ended on the object (touch&nbsp;lifted from the&nbsp;screen).
* `"cancelled"` — indicates that the __system__ cancelled tracking of the touch (not&nbsp;to be confused with&nbsp;`"ended"`).

For our convenience, let's locally set the phase (`event.phase`) of the touch event:

``````{ brush="lua" gutter="true" first-line="144" highlight="[147]" }
local function dragShip( event )

	local ship = event.target
	local phase = event.phase
end
``````

With the phase locally set, we can use an <nobr>`if`-`then`</nobr> structure to check which phase the actual touch event is in. If it has just begun (initial&nbsp;touch on the&nbsp;ship), the `"began"` phase is dispatched to our function. In this conditional case, we set the touch __focus__ on the ship&nbsp;&mdash; essentially, this means that the ship object will "own" the touch event throughout its duration. While focus is on the ship, no other objects in the game will detect events from this specific touch:

``````{ brush="lua" gutter="true" first-line="144" highlight="[149,150,151]" }
local function dragShip( event )

	local ship = event.target
	local phase = event.phase

	if ( "began" == phase ) then
		-- Set touch focus on the ship
		display.currentStage:setFocus( ship )
	end
end
``````

<div class="float-right" style="max-width: 232px; margin-top: 16px; margin-bottom: 16px; clear: both;">

![][images.docs.sbs-starexplorer-8]

</div>

Directly following this, let's store the beginning "offset" position of the touch in relation to the ship. Conceptually, as illustrated here, a touch can occur in various places within an object's bounds. In&nbsp;our code, <nobr>`event.x - ship.x`</nobr> gives us the horizontal offset between the exact touch point on the screen (`event.x`) and the ship's __x__ position (`ship.x`). We set this as a property of the ship (`touchOffsetX`) for usage in the next phase.

``````{ brush="lua" gutter="true" first-line="149" highlight="[152,153]" }
	if ( "began" == phase ) then
		-- Set touch focus on the ship
		display.currentStage:setFocus( ship )
		-- Store initial offset position
		ship.touchOffsetX = event.x - ship.x
	end
end
``````

For the `"moved"` phase <nobr>(as you can guess)</nobr>, we move the ship! This is done by simply setting the ship's __x__ position, but look carefully&nbsp;&mdash; this is where our `touchOffsetX` property comes into play. If we ignored this offset and simply set the ship's __x__ position to `event.x`, its center axis would skip/jump to the exact touch point on the screen and, as illustrated above, the touch point within the ship bounds may not be exactly at the center. Fortunately, factoring in the offset value will produce a smooth, consistent dragging effect.

``````{ brush="lua" gutter="true" first-line="149" highlight="[155,156,157]" }
	if ( "began" == phase ) then
		-- Set touch focus on the ship
		display.currentStage:setFocus( ship )
		-- Store initial offset position
		ship.touchOffsetX = event.x - ship.x

	elseif ( "moved" == phase ) then
		-- Move the ship to the new touch position
		ship.x = event.x - ship.touchOffsetX
	end
end
``````

<div class="guide-notebox">
<div class="notebox-title">Note</div>

For this game, ship movement will be restricted to just left and right, so we only handle changes along the __x__ axis. If you create a game where an object can be dragged all around the screen, you should mimic this offset concept for the __y__ axis as well. For example, in the `"began"` case, store the beginning __y__ offset:

``````{ brush="lua" gutter="false" first-line="1" highlight="[3]" }
-- Store initial offset position
ship.touchOffsetX = event.x - ship.x
ship.touchOffsetY = event.y - ship.y
``````

Then, in the `"moved"` phase, set the object's __y__ position:

``````{ brush="lua" gutter="false" first-line="1" highlight="[3]" }
-- Move the ship to the new touch position
ship.x = event.x - ship.touchOffsetX
ship.y = event.y - ship.touchOffsetY
``````

</div>

The final conditional case includes both the `"ended"` and `"cancelled"` phases. The `"ended"` phase indicates that the __user__ released touch on the object, while the `"cancelled"` phase indicates that the __system__ cancelled/terminated the touch event. Typically, both of these phases can be handled in the same conditional block. For this game, we simply release the touch focus on the ship:

``````{ brush="lua" gutter="true" first-line="155" highlight="[159,160,161]" }
	elseif ( "moved" == phase ) then
		-- Move the ship to the new touch position
		ship.x = event.x - ship.touchOffsetX

	elseif ( "ended" == phase or "cancelled" == phase ) then
		-- Release touch focus on the ship
		display.currentStage:setFocus( nil )
	end
end
``````

Let's complete the `dragShip()` touch listener function with one more command:

``````{ brush="lua" gutter="true" first-line="159" highlight="[164]" }
	elseif ( "ended" == phase or "cancelled" == phase ) then
		-- Release touch focus on the ship
		display.currentStage:setFocus( nil )
	end

	return true  -- Prevents touch propagation to underlying objects
end
``````

As the comment indicates, this short but important command tells CORONA_CORE_PRODUCT that the touch event should "stop" on this object and not propagate to underlying objects. This is essential in more complex apps where you might have multiple overlapping objects with touch event detection. Adding <nobr>`return true`</nobr> at the end of touch listener functions prevents potential (and&nbsp;usually&nbsp;undesirable) touch propagation.

### Touch Listener

We're almost finished with the movement mechanics&nbsp;&mdash; let's just assign the ship a `"touch"` event listener so that the player can touch/drag it left and right across the screen. Immediately following the `dragShip()` function (after&nbsp;its closing `end`&nbsp;statement), add the following command:

``````{ brush="lua" gutter="true" first-line="164" highlight="[167]" }
	return true  -- Prevents touch propagation to underlying objects
end

ship:addEventListener( "touch", dragShip )
``````

<div class="float-right" style="max-width: 432px; margin-top: 16px; margin-bottom: 16px; clear: both;">

![][images.docs.sbs-starexplorer-9]

</div>

<div class="docs-tip-outer docs-tip-color-action">
<div class="docs-tip-inner-left">
<div class="fa fa-video-camera" style="font-size: 29px; padding-top: 4px;"></div>
</div>
<div class="docs-tip-inner-right">

Let's check the result of our code. Save your modified `main.lua` file, relaunch the Simulator, and experiment with touching and dragging the ship around.

</div>
</div>




<a id="gameloop"></a>

## Game Loop

Many games include some type of __game&nbsp;loop__ to handle the updating of information, checking/updating the state of game objects, etc. Although it's entirely possible to build a game in CORONA_CORE_PRODUCT without ever implementing a game loop, we'll use one here to illustrate the concept.

A game loop function is usually short &mdash; instead of containing a large amount of code itself, it typically calls other functions to handle specific repetitive functionality. Our game loop will be used to create new asteroids and clean up "dead" asteroids.

First, create the core game loop function in your `main.lua` file following the code you've already written:

``````{ brush="lua" gutter="true" first-line="167" highlight="[170,171,172,173]" }
ship:addEventListener( "touch", dragShip )


local function gameLoop()


end
``````

Now add the following lines to simply call the `createAsteroid()` function that we wrote earlier in this chapter. Effectively, each time the game loop iterates, it'll generate a new asteroid.

``````{ brush="lua" gutter="true" first-line="170" highlight="[172,173]" }
local function gameLoop()

	-- Create new asteroid
	createAsteroid()
end
``````

### Asteroid Cleanup

For this game, let's remove asteroids which have drifted off screen by looping through the `asteroidsTable` table. Remember when we declared this table as a place to store a reference for each asteroid? It may not have seemed relevant at the time, but now it's coming fully into play!

To loop through the table, we'll use a Lua `for` loop. Essentially, a `for` loop lets us use an __index__ variable to count either up or down from a starting number to an ending number.

Add the following highlighted commands to your `gameLoop()` function:

``````{ brush="lua" gutter="true" first-line="170" highlight="[175,176,177,178]" }
local function gameLoop()

	-- Create new asteroid
	createAsteroid()

	-- Remove asteroids which have drifted off screen
	for i = #asteroidsTable, 1, -1 do

	end
end
``````

<div class="docs-tip-outer">
<div class="docs-tip-inner-left">
<div class="fa fa-cog"></div>
</div>
<div class="docs-tip-inner-right">

Notice that Lua `for` loops, similar to functions and conditional statements, conclude with the familiar `end` command.

</div>
</div>

In this case, we need to count down (decrement) starting from the number of asteroids in the `asteroidsTable` table, but there's one slight catch: the amount will constantly change as new asteroids are created and others are destroyed by the player. Fortunately, Lua has a convenient way to count the number of elements in a table, accomplished by simply prefacing the table name with `#`:

`#asteroidsTable`

As you can see, we use this method in our `for` loop which takes the indicated form&nbsp;&mdash; basically, Lua uses the __index__ `i`, starts at `#asteroidsTable`, <nobr>stops at `1`</nobr>, and <nobr>counts by `-1`</nobr> (decrements).

Inside the `for` loop, we must include code which should be processed each time the loop iterates. If there are ten asteroids in the table, the loop will iterate ten times. If there's just one asteroid in the table, it will iterate once.

Add the following highlighted lines __inside__ the `for` loop:

``````{ brush="lua" gutter="true" first-line="175" highlight="[177,178,179,180,181,182,183,184,185,186]" }
	-- Remove asteroids which have drifted off screen
	for i = #asteroidsTable, 1, -1 do
		local thisAsteroid = asteroidsTable[i]

		if ( thisAsteroid.x < -100 or
			 thisAsteroid.x > display.contentWidth + 100 or
			 thisAsteroid.y < -100 or
			 thisAsteroid.y > display.contentHeight + 100 )
		then
			display.remove( thisAsteroid )
			table.remove( asteroidsTable, i )
		end
	end
end
``````

Let's examine these commands in more detail:

* For each iteration of the loop, we first declare a local reference to the asteroid which the loop is referencing on that particular iteration:

<div class="code-indent">

``````{ brush="lua" gutter="false" }
local thisAsteroid = asteroidsTable[i]
``````

Essentially, `thisAsteroid` is set to the table item at the __index__ number within the brackets (`[]`), so by using the `for` loop's __index__ of `i`, we easily gain a reference to each asteroid in the table as the loop iterates from start to finish.

</div>

* The next block is a <nobr>multi-conditional</nobr> statement which checks the position of the asteroid being referenced during the loop iteration. Basically, with this statement, we check if the asteroid has drifted substantially far off any edge of the screen by checking its `x` and `y` properties:

<div class="code-indent">

``````{ brush="lua" gutter="false" }
if ( thisAsteroid.x < -100 or
	thisAsteroid.x > display.contentWidth + 100 or
	thisAsteroid.y < -100 or
	thisAsteroid.y > display.contentHeight + 100 )
then
``````

</div>

* If any of the four conditions are met, we perform two important actions:

<div class="code-indent">

First, we remove the asteroid from the screen using the `display.remove()` command:

``````{ brush="lua" gutter="false" }
display.remove( thisAsteroid )
``````

Second, we remove the asteroid from the `asteroidsTable` table with the <nobr>built-in</nobr> Lua `table.remove()` command. This command simply removes an item from a table at the specified index, in this case the loop <nobr>index of `i`</nobr>:

``````{ brush="lua" gutter="false" }
table.remove( asteroidsTable, i )
``````

<div class="docs-tip-outer docs-tip-color-alert">
<div class="docs-tip-inner-left">
<div class="fa fa-exclamation-circle" style="font-size: 35px;"></div>
</div>
<div class="docs-tip-inner-right">

It's very important to understand basic Lua memory management and how it relates to display objects. The first command above, <nobr>`display.remove( thisAsteroid )`</nobr>, will remove the asteroid from the screen, visually. However, that command alone will __not__ release the asteroid from Lua memory. Why?

Because we stored an __additional__ reference to the asteroid inside the `asteroidsTable` table, Lua cannot free up the memory allocated to the asteroid object until that reference is removed. That's why we perform the second command, <nobr>`table.remove( asteroidsTable, i )`</nobr>, directly afterward. This effectively removes that additional reference and, because there are no other persistent references to the object, the Lua garbage collection process can then automatically free its allocated memory.

</div>
</div>
</div>

That concludes our asteroid cleanup! Basically, on each iteration of the game loop, we use the `for` loop to check for asteroids which have drifted substantially outside of the screen bounds. Each of those "dead" asteroids is then removed from the screen __and__ removed from the `asteroidsTable` storage table, keeping the total asteroid count down and memory usage low.

### Loop Timer

Although you might imagine a game loop as code/functionality which updates on every frame of the application runtime&nbsp;&mdash; up&nbsp;to 60 times per second&nbsp;&mdash; that's not necessarily true for every app. Because our game loop is a standard function, we have complete control over how often it runs, and&nbsp;when.

There are a couple different ways to run a game loop function repeatedly. In this game, we clearly don't want to generate 60 new asteroids per second, and it's not necessary to perform cleanup tasks that often either. So, we'll implement a __repeating&nbsp;timer__ instead.

Immediately following the `gameLoop()` function (after&nbsp;its closing `end`&nbsp;statement), add the following command:

``````{ brush="lua" gutter="true" first-line="184" highlight="[190]" }
			display.remove( thisAsteroid )
			table.remove( asteroidsTable, i )
		end
	end
end

gameLoopTimer = timer.performWithDelay( 500, gameLoop, 0 )
``````

Let's dissect this line:

1. First, we state that the `gameLoopTimer` placeholder variable (declared&nbsp;earlier) will be associated with our timer. This allows us to use that variable as a reference/handle for pausing or canceling the timer later, if necessary.

2. Next, we call `timer.performWithDelay()`. This convenient command tells CORONA_CORE_PRODUCT to perform some action after a specified number of milliseconds. Timers are useful for a wide array of game functionality, so get comfortable with them!

3. Inside the parentheses, we start with the number of milliseconds to wait (delay) until the timer fires. Here we use `500` which is exactly half a second, but you can experiment with other values. A lower number like `250` will make asteroids spawn faster and increase the difficulty of the game, but don't set this value too low or asteroids will generate too quickly and crowd the screen.

4. The next parameter is the function which will be called/run when the timer fires. Obviously we specify `gameLoop` here.

5. Finally, we include the optional __iterations__ parameter with a value of `0`. If this parameter is omitted, timers will simply fire once and stop. If you include this parameter, the timer will repeat for that number of iterations, but don't be fooled by the `0` in this case&nbsp;&mdash; we are __not__ telling the timer to <nobr>"run zero times"</nobr> but rather to repeat forever. Basically, passing `0` or `-1` will cause the timer to repeat indefinitely (unless&nbsp;we tell it to&nbsp;pause/stop).

<div class="docs-tip-outer docs-tip-color-action">
<div class="docs-tip-inner-left">
<div class="fa fa-video-camera" style="font-size: 29px; padding-top: 4px;"></div>
</div>
<div class="docs-tip-inner-right">

All done! The game loop is complete and we have a timer in place to run it repeatedly and indefinitely. Save your modified `main.lua` file, relaunch the Simulator, and you should see new asteroids beginning to appear, steadily drifting and rotating across the screen. Our game is really coming to life now!

</div>
</div>




<a id="collisions"></a>

## Collision Handling

Time to handle collisions! Initially, we're only going to detect specific collisions:

1. When a laser collides with an asteroid.
2. When an asteroid collides with the ship.

<div class="docs-tip-outer">
<div class="docs-tip-inner-left">
<div class="fa fa-cog"></div>
</div>
<div class="docs-tip-inner-right">

Collisions are reported between pairs of objects, and they can be detected either __locally__ on an object, using an object listener, or __globally__ using a runtime listener. Different games require different methods, but here's a general guideline:

* Local collision handling is best utilized in a <nobr>one-to-many</nobr> collision scenario, for example one player object which may collide with multiple enemies, <nobr>power-ups</nobr>, etc. 

* Global collision handling is best utilized in a <nobr>many-to-many</nobr> collision scenario, for example multiple hero characters which may collide with multiple enemies.

While this game has just one player object (the&nbsp;ship), it might seem that the best choice is __local__ collision handling. However, the game will also need to detect collisions between multiple lasers and multiple asteroids, so __global__ collision handling is a better option.

</div>
</div>

### Restoring the Ship

Before we get into collision handling, we need a function that can be called to restore the ship following collision with an asteroid. In our game, we'll mimic classic arcade games where, as the new ship fades into view, it's temporarily invincible&nbsp;&mdash; after all, it wouldn't be fair to allow players to die consecutive times without being given a chance to dodge incoming asteroids!

Following the code you've already written, add the following highlighted function: 

``````{ brush="lua" gutter="true" first-line="190" highlight="[193,194,195,196,197,198,199,200,201,202,203,204,205,206]" }
gameLoopTimer = timer.performWithDelay( 500, gameLoop, 0 )


local function restoreShip()

	ship.isBodyActive = false
	ship.x = display.contentCenterX
	ship.y = display.contentHeight - 100

	-- Fade in the ship
	transition.to( ship, { alpha=1, time=4000,
		onComplete = function()
			ship.isBodyActive = true
			died = false
		end
	} )
end
``````

Let's examine the content of this function:

1. The first command, <nobr>`ship.isBodyActive = false`</nobr>, effectively removes the ship from the physics simulation so that it ceases to interact with other bodies. We do this (temporarily) so that, as the ship fades back into view, colliding asteroids will not trigger another collision response.

2. The next two lines simply reposition the ship at the <nobr>bottom-center</nobr> of the screen.

3. The final command might not make complete sense right now, but it will after we add "death" functionality further down. Essentially, this `transition.to()` command fades the ship back to full opacity (`alpha=1`) over the span of four seconds. It also includes an `onComplete` callback to an anonymous function. This function restores the ship as an active physical body and resets the `died` variable to `false`.

### Collision Function

Next, let's write the foundation of our collision function:

``````{ brush="lua" gutter="true" first-line="204" highlight="[209,210,211,212,213,214,215,216]" }
		end
	} )
end


local function onCollision( event )

	if ( event.phase == "began" ) then

		local obj1 = event.object1
		local obj2 = event.object2
	end
end
``````

This is relatively simple and you should recognize some basic concepts from earlier:

1. Similar to touch events, collisions have distinct __phases__, in this case `"began"` and `"ended"`. The `"began"` collision phase is by far the most common phase you'll need to handle, but there are instances where detecting the `"ended"` phase is important. Don't worry too much about this now&nbsp;&mdash; here, we simply isolate the `"began"` phase by wrapping our functionality in a conditional clause.

2. For simplicity throughout the function, we reference the two objects involved in the collision with the local variables `obj1` and `obj2`. When detecting collisions with the global method, these objects are referenced by `event.object1` and `event.object2`.

### Lasers and Asteroids

Let's handle our first collision condition: lasers and asteroids. Remember how we assign a `myName` property to each object when we create it? This property now becomes critical as a means to detect which two object types are colliding. Here, the opening conditional clause checks the `myName` property of both `obj1` and `obj2`. If these values are `"laser"` and `"asteroid"`, we know which two object types collided and we can proceed with handling the outcome.

``````{ brush="lua" gutter="true" first-line="211" highlight="[216,217,218,219,220]" }
	if ( event.phase == "began" ) then

		local obj1 = event.object1
		local obj2 = event.object2

		if ( ( obj1.myName == "laser" and obj2.myName == "asteroid" ) or
			 ( obj1.myName == "asteroid" and obj2.myName == "laser" ) )
		then

		end
	end
end
``````

<div class="docs-tip-outer docs-tip-color-alert">
<div class="docs-tip-inner-left">
<div class="fa fa-exclamation-circle" style="font-size: 35px;"></div>
</div>
<div class="docs-tip-inner-right">

When detecting collisions with the global method, there is no way to determine which is the "first" and "second" object involved in the collision. In other words, `obj1` may be the laser and `obj2` the asteroid, or they might be flipped around. This is why we build a <nobr>multi-conditional</nobr> clause to detect both possibilities.

</div>
</div>

Inside the conditional clause, let's begin by simply removing the two objects via `display.remove()`. While a fancy explosion effect would be awesome, this project merely exhibits how to handle collisions&nbsp;&mdash; how you expand on this later depends on your imagination!

``````{ brush="lua" gutter="true" first-line="216" highlight="[219,220,221]" }
		if ( ( obj1.myName == "laser" and obj2.myName == "asteroid" ) or
			 ( obj1.myName == "asteroid" and obj2.myName == "laser" ) )
		then
			-- Remove both the laser and asteroid
			display.remove( obj1 )
            display.remove( obj2 )
		end
	end
end
``````

Next, let's remove the destroyed asteroid from the `asteroidsTable` table so that the game loop doesn't need to worry about it any further. For this task, we use another `for` loop which iterates through `asteroidsTable`, locates the instance of the asteroid, and removes it:

``````{ brush="lua" gutter="true" first-line="216" highlight="[223,224,225,226,227,228]" }
		if ( ( obj1.myName == "laser" and obj2.myName == "asteroid" ) or
			 ( obj1.myName == "asteroid" and obj2.myName == "laser" ) )
		then
			-- Remove both the laser and asteroid
			display.remove( obj1 )
            display.remove( obj2 )

			for i = #asteroidsTable, 1, -1 do
				if ( asteroidsTable[i] == obj1 or asteroidsTable[i] == obj2 ) then
					table.remove( asteroidsTable, i )
					break
				end
			end
		end
	end
end
``````

<div class="docs-tip-outer">
<div class="docs-tip-inner-left">
<div class="fa fa-cog"></div>
</div>
<div class="docs-tip-inner-right">

In this loop, we also utilize a minor efficiency trick known as __breaking__, executed by the `break` command. Because we're only looking for one specific asteroid, the loop can immediately break/stop once that asteroid has been removed, effectively stopping any further processing effort.

</div>
</div>

Finally, to reward the player for destroying an asteroid, we'll increase the `score` variable by `100` and update the `scoreText` text object to reflect the new value:

``````{ brush="lua" gutter="true" first-line="216" highlight="[230,231,232]" }
		if ( ( obj1.myName == "laser" and obj2.myName == "asteroid" ) or
			 ( obj1.myName == "asteroid" and obj2.myName == "laser" ) )
		then
			-- Remove both the laser and asteroid
			display.remove( obj1 )
            display.remove( obj2 )

			for i = #asteroidsTable, 1, -1 do
				if ( asteroidsTable[i] == obj1 or asteroidsTable[i] == obj2 ) then
					table.remove( asteroidsTable, i )
					break
				end
			end

			-- Increase score
			score = score + 100
			scoreText.text = "Score: " .. score
		end
	end
end
``````

### Asteroids and the Ship

Now let's handle the second collision condition: asteroids and the ship. Add the following condition to the <nobr>`if-then`</nobr> statement following the first one. Notice that we use `elseif` because we're adding another possible condition to the same statement:

``````{ brush="lua" gutter="true" first-line="230" highlight="[234,235,236]" }
			-- Increase score
			score = score + 100
			scoreText.text = "Score: " .. score

		elseif ( ( obj1.myName == "ship" and obj2.myName == "asteroid" ) or
				 ( obj1.myName == "asteroid" and obj2.myName == "ship" ) )
		then

		end
	end
end
``````

Inside this conditional clause, let's begin with an additional <nobr>`if-then`</nobr> check:

``````{ brush="lua" gutter="true" first-line="234" highlight="[237,238,239]" }
		elseif ( ( obj1.myName == "ship" and obj2.myName == "asteroid" ) or
				 ( obj1.myName == "asteroid" and obj2.myName == "ship" ) )
		then
			if ( died == false ) then

			end
		end
	end
end
``````

This conditional check might seem a little strange, but we need to confirm that the ship has not already been destroyed. As the game progresses, or with a faster asteroid spawning rate, it's entirely possible that the ship will be struck by two asteroids almost simultaneously. Losing two lives in that case obviously isn't fair, so we check the value of `died` and only proceed if it's `false`.

Inside this <nobr>`if-then`</nobr> clause, let's immediately set <nobr>`died = true`</nobr> because the player actually has died this time!

``````{ brush="lua" gutter="true" first-line="234" highlight="[238]" }
		elseif ( ( obj1.myName == "ship" and obj2.myName == "asteroid" ) or
				 ( obj1.myName == "asteroid" and obj2.myName == "ship" ) )
		then
			if ( died == false ) then
				died = true
			end
		end
	end
end
``````

Following this, we'll subtract a life from the `lives` variable and update the `livesText` text object to reflect the new value:

``````{ brush="lua" gutter="true" first-line="234" highlight="[240,241,242]" }
		elseif ( ( obj1.myName == "ship" and obj2.myName == "asteroid" ) or
				 ( obj1.myName == "asteroid" and obj2.myName == "ship" ) )
		then
			if ( died == false ) then
				died = true

				-- Update lives
				lives = lives - 1
				livesText.text = "Lives: " .. lives
			end
		end
	end
end
``````

Finally, let's include a conditional statement to check if the player is out of lives:

``````{ brush="lua" gutter="true" first-line="234" highlight="[244,245,246,247,248,249]" }
		elseif ( ( obj1.myName == "ship" and obj2.myName == "asteroid" ) or
				 ( obj1.myName == "asteroid" and obj2.myName == "ship" ) )
		then
			if ( died == false ) then
				died = true

				-- Update lives
				lives = lives - 1
				livesText.text = "Lives: " .. lives

				if ( lives == 0 ) then
					display.remove( ship )
				else
					ship.alpha = 0
					timer.performWithDelay( 1000, restoreShip )
				end
			end
		end
	end
end
``````

In the opening clause of this statement, if `lives` is equal to `0`, we simply remove the ship entirely. This is the point where you could show a "game&nbsp;over" message or perform some other action, but for now we'll leave the possibilities open.

In the default `else` clause (the player has at least one life&nbsp;remaining), we make the ship invisible by setting its `alpha` property to `0`. This ties into the `restoreShip()` function which we wrote earlier where, when the ship fades back into view, the `transition.to()` command transitions the ship's `alpha` back to `1`. Immediately following that line, we actually call the `restoreShip()` function after a delay of one second&nbsp;&mdash; this yields a slight delay before the ship begins to fade back into view.

### Collision Listener

All of our collision logic is now in place, but absolutely nothing will happen unless we link it up! Since we decided to implement collisions in the global method, it only takes one command to tell CORONA_CORE_PRODUCT that it should listen for new collisions during every runtime frame of the app.

Immediately following the `onCollision()` function (after&nbsp;its closing `end`&nbsp;statement), add the following command:

``````{ brush="lua" gutter="true" first-line="251" highlight="[255]" }
		end
	end
end

Runtime:addEventListener( "collision", onCollision )
``````

This command is similar to previous event listeners where we added a `"tap"` or `"touch"` listener type to a specific object. Here, we simply add a `"collision"` listener type to the global `Runtime` object.

<div class="docs-tip-outer docs-tip-color-action">
<div class="docs-tip-inner-left">
<div class="fa fa-video-camera" style="font-size: 29px; padding-top: 4px;"></div>
</div>
<div class="docs-tip-inner-right">

That's it! Save your `main.lua` file, relaunch the Simulator, and your game will be finished&nbsp;&mdash; the player has full control over the ship, asteroids continue to spawn and move across the screen, score and lives are accounted for, and we basically have a fully functioning game!

</div>
</div>

<div class="docs-tip-outer" style="background-color: #ffa752;">
<div class="docs-tip-inner-left">
<div class="fa fa-check-square" style="font-size: 34px; padding-left: 1px; padding-top: 4px;"></div>
</div>
<div class="docs-tip-inner-right">

Just in case you missed something, the complete program is available [here](https://github.com/coronalabs/GettingStarted03/archive/master.zip). This project is slightly more complicated than the previous one, so it may be helpful to download the original source code to compare with what you've created.

</div>
</div>




<a id="concepts"></a>

## Chapter Concepts

We've covered quite a few concepts in this chapter. Here's an overview:

<div class="inner-table">

Command/Property															Description
--------------------------------------------------------------------------	-----------------------------------------
[table.insert()][api.library.table.insert]									Inserts a given value into a [table][api.type.Table].
[table.remove()][api.library.table.remove]									Removes an item from a [table][api.type.Table] at the specified index.
[math.random()][api.library.math.random]									Returns a <nobr>pseudo-random</nobr> number from a sequence with uniform distribution.
[object:setLinearVelocity()][api.type.Body.setLinearVelocity]				Sets the __x__ and __y__ components for a body's linear velocity.
[object:applyTorque()][api.type.Body.applyTorque]							Applies rotational force to a physical body. 
[object.isBullet][api.type.Body.isBullet]									Boolean for whether a body should be treated as a "bullet."
[object:toBack()][api.type.DisplayObject.toBack]							Moves a target object to the visual back of its parent group.
[transition.to()][api.library.transition.to]								Animates (transitions) a display object using an optional [easing][api.library.easing] algorithm.
[display.remove()][api.library.display.remove]								Removes an object or group if not `nil`.
[object:setFocus()][api.type.StageObject.setFocus]							Sets a specific display object as the target for all future hit events <nobr>(`"touch"` and `"tap"`)</nobr>.
[timer.performWithDelay()][api.library.timer.performWithDelay]				Calls a specified function after a delay.
[object.isBodyActive][api.type.Body.isBodyActive]							Sets or gets a physical body's current active state.
--------------------------------------------------------------------------	-----------------------------------------

</div>


##

<div class="walkthrough-nav">

__&lang;__ [Chapter 2 &mdash; Upward & Onward][guide.programming.02] _|_ [Chapter 4 &mdash; Creating Scenes][guide.programming.04] __&rang;__

</div>
