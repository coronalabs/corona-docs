
# Continuous Actions

In some apps, you'll need to perform some __continuous&nbsp;action__ while the user's touch remains on the screen. This could include a space ship firing its lasers while the player holds down a "fire" button or the <nobr>commonly-used</nobr> "move&nbsp;buttons" found in most 2D&nbsp;platformers.

For beginner developers, this process can be elusive, so let's explore some techniques for implementing continuous actions.


## Enabling Multitouch

Most games which require continuous actions will also require __multitouch__, allowing the player to manipulate more than one <nobr>on-screen</nobr> control using multiple fingers. For instance, a 2D&nbsp;platformer with both "move" buttons and a "jump" button will usually let the player control one set with the left thumb and the other with the right thumb.

As outlined in the [Tap/Touch/Multitouch][guide.events.touchMultitouch] guide, multitouch is __disabled__ by default, but enabling it is simple:

``````lua
-- Activate multitouch
system.activate( "multitouch" )
``````

<div class="guide-notebox">
<div class="notebox-title">Note</div>

Depending on your game design, you should carefully consider where this command should be called. While it could be called as one of the first lines within `main.lua`, that may not be optimal&nbsp;&mdash; for instance, if your game begins with a menu scene <nobr>(most games do)</nobr> then you probably won't need multitouch capability at that point and, in that case, this command should be deferred until multitouch is actually needed.

</div>

Now let's explore some common elements where __continuous&nbsp;actions__ may apply:


## Virtual Buttons

<div class="float-right" style="max-width: 230px; margin-bottom: 16px; clear: both;">

![][images.docs.cont-actions-1]

</div>

In mobile games which clearly lack a physical controller like a gamepad, a common UI element is a __virtual&nbsp;button__. These can range anywhere from "jump" buttons to "fire" buttons or nearly anything the game designer comes up with. In some cases, these offer a <nobr>one-press</nobr> type of behavior&nbsp;&mdash; tap/touch the button and the action occurs once, like a jump. In other cases, these perform an action for the entire time the player holds their touch over the button, like firing a continuous stream of lasers. This latter case is where continuous actions come into play.

### Creating the Button Region

Instead of creating dedicated buttons via a method like [widget.newButton()][api.library.widget.newButton], we'll create a button __region__ that can accommodate __one&nbsp;or&nbsp;more__ buttons. This is necessary to achieve all of the continuous action functionality, as you'll learn in the course of this tutorial. It's also a convenient way to "group" related sets of buttons, for example a "jump" button directly beside a "fire" button.

First, let's create a new [display group][api.type.GroupObject] to contain the region:

``````{ brush="lua" gutter="true" first-line="1" highlight="[1]" }
local buttonGroup = display.newGroup()
``````

Now, let's create a visual "button" for the region which is, in&nbsp;fact, just a standard image:

``````{ brush="lua" gutter="true" first-line="1" highlight="[3,4,5]" }
local buttonGroup = display.newGroup()

local fireButton = display.newImageRect( buttonGroup, "fireButton.png", 64, 64 )
fireButton.x, fireButton.y = 60, display.contentHeight-60
``````

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

* Note that this image is inserted into the button group via the specification of `buttonGroup` as the first parameter to [display.newImageRect()][api.library.display.newImageRect].

* Once again, this is __not__ a functional button, but rather just an image that defines the area within the button region where the player's touch interaction will be handled. Thus, it does not require the addition of a touch or tap event listener.

</div>

Now, let's create an object which will actually __detect&nbsp;touches__ on/around the button. This object is merely an invisible vector rectangle which overlays the button image, and its size is automatically calculated by the image(s) previously inserted into `buttonGroup` like the `fireButton` image above.

``````{ brush="lua" gutter="true" first-line="3" highlight="[6,7,8,9,10,11]" }
local fireButton = display.newImageRect( buttonGroup, "fireButton.png", 64, 64 )
fireButton.x, fireButton.y = 60, display.contentHeight-60

local groupBounds = buttonGroup.contentBounds
local groupRegion = display.newRect( 0, 0, groupBounds.xMax-groupBounds.xMin+200, groupBounds.yMax-groupBounds.yMin+200 )
groupRegion.x = groupBounds.xMin + ( buttonGroup.contentWidth/2 )
groupRegion.y = groupBounds.yMin + ( buttonGroup.height/2 )
groupRegion.isVisible = false
groupRegion.isHitTestable = true
``````

<div class="guide-notebox">
<div class="notebox-title">Notes</div>

* The size of this `groupRegion` vector rectangle is actually 200&nbsp;pixels __larger__ than the button image, both horizontally and vertically. This is because, as discussed further on in this tutorial, we also need to handle when the player's touch moves from inside the button's region to outside it, or <nobr>__slide-off__</nobr>. While it might seem excessive to extend the rectangle so far outside the button on all sides, this helps ensure that the player can't swipe or move their touch very quickly off the button and still cause CORONA_CORE_PRODUCT to assume the touch is active. <nobr>Don't worry &mdash;</nobr> this large vector object will __not__ block touch propagation to other objects in the scene unless the touch point is inside the bounds of a button image.

* On <nobr>lines 10 and 11</nobr>, we make the rectangle invisible __and__ <nobr>hit-testable</nobr>. The <nobr>`groupRegion.isHitTestable = true`</nobr> command is especially important in this case because, by&nbsp;default, invisible objects will __not__ detect touches. This command ensures that it __will__ receive touch events.

</div>

### Region Detection Function

To detect when a touch point on the `groupRegion` rectangle intersects the bounds of the `fireButton` image, we'll use a function. Essentially, when called, this function will loop through the image objects inserted into `buttonGroup` and, for&nbsp;each, check if the touch point is within that object's __content&nbsp;bounds__. If it detects that the touch point __is__ within any button image's bounds, it returns a reference to that object.

``````{ brush="lua" gutter="true" first-line="13" }
local function detectButton( event )

	for i = 1,buttonGroup.numChildren do
		local bounds = buttonGroup[i].contentBounds
		if (
			event.x > bounds.xMin and
			event.x < bounds.xMax and
			event.y > bounds.yMin and
			event.y < bounds.yMax
		) then
			return buttonGroup[i]
		end
	end
end
``````

<div class="guide-notebox">
<div class="notebox-title">Note</div>

This code will only accurately test if the touch point is inside the rectangular edge bounds of a button. If you have a button which is visually circular as in the example button images shown above, this will not be perfectly accurate. In most games, however, it's sufficient to test that the touch point is within a rectangular region surrounding the button.

Optionally, these conditions can be adjusted to be more (or&nbsp;less) forgiving in regards to where an active touch is acknowledged. For example, we can reduce the size of the valid region slightly to ensure that the touch is truly "inside" a button, insetting all four edges by 4&nbsp;pixels as follows:

``````lua
event.x > bounds.xMin + 4 and
event.x < bounds.xMax - 4 and
event.y > bounds.yMin + 4 and
event.y < bounds.yMax - 4
``````

</div>

### Button Listener

Now let's construct the listener function to handle touch events on the button region object:

``````{ brush="lua" gutter="true" first-line="28" highlight="[30,32,33,34,35,36,37,38,39,40,41,42,43,44,46,47,48,49,50,51,52,53,54]" }
local function handleController( event )

	local touchOverButton = detectButton( event )

	if ( event.phase == "began" ) then

		if ( touchOverButton ~= nil ) then
			if not ( buttonGroup.touchID ) then
				-- Set/isolate this touch ID
				buttonGroup.touchID = event.id
				-- Set the active button
				buttonGroup.activeButton = touchOverButton
				-- Fire the weapon
				print( "BEGIN FIRING" )
			end
			return true
		end

	elseif ( event.phase == "ended" and buttonGroup.activeButton ~= nil ) then

		-- Release this touch ID
		buttonGroup.touchID = nil
		-- Set that no button is active
		buttonGroup.activeButton = nil
		-- Stop firing the weapon
		print( "STOP FIRING" )
		return true
	end
end
``````

Let's inspect this function in more detail:

1. On line&nbsp;30, we call the `detectButton()` function from the previous step which, as you recall, returns a reference if the touch point intersects the bounds of any button within `buttonGroup`.

2. For the `"began"` phase of a touch <nobr>(lines 32-44)</nobr>, if that touch point intersects a button, we first confirm that there is __not__ an existing `touchID` property assigned to the <nobr>button group (line 35) &mdash;</nobr> this&nbsp;is an important aspect when multitouch is enabled because we don't want the player to be able to manipulate the same button with multiple fingers (touches) at the same time.

3. If this condition passes, and this touch is the first/only touch on the button group, we then assign the unique touch&nbsp;ID tracked by CORONA_CORE_PRODUCT (`event.id`) to the `touchID` property of the group (line&nbsp;37).

4. Following this, we set `buttonGroup.activeButton` to the button reference, then we take the proper action (in&nbsp;this case, start firing the&nbsp;weapon). Additionally, on&nbsp;line&nbsp;43, we <nobr>`return true`</nobr> so that the touch will __not__ propagate past the button to any <nobr>touch-sensitive</nobr> objects behind it.

5. For the `"ended"` phase of a touch <nobr>(lines 46-54)</nobr>, if a button is active, we first "release" the touch&nbsp;ID associated with the button group by setting `buttonGroup.touchID` <nobr>to `nil` (line 49)</nobr>. We then set `buttonGroup.activeButton` to `nil`, then take the proper action (here,&nbsp;stop firing the&nbsp;weapon). Like the `"began"` phase, we also <nobr>`return true`</nobr> so that the touch will not propagate past the button to any <nobr>touch-sensitive</nobr> objects behind it.

### Handling <nobr>Slide-Off</nobr>

As you can see, the `handleController()` function currently handles the `"began"` and `"ended"` phases of the touch&nbsp;&mdash; when the player touches within the bounds of a button, we can start firing the weapon and, when the player lifts off, we can stop firing. However, there is a __very__ important case which you must account for: the <nobr>__slide-off__</nobr> case.

Internally, CORONA_CORE_PRODUCT generates an `"ended"` phase when the user's touch lifts off an object, but this only occurs if the touch location is <nobr>__over the object__</nobr> at that point. By default, CORONA_CORE_PRODUCT will __not__ generate an `"ended"` event if the user touches an object, slides their finger outside of its content bounds, and then releases. Thus, unless we take steps to account for this, the player can slide their touch outside of the bounds of the button region rectangle, release, and the weapon will continue firing!

To prevent this, we can add another check using the `"moved"` event phase. As its name implies, this phase is triggered every time the player's finger moves from the initial touch point. Using&nbsp;it, we can ensure that the weapon stops firing when the player slides their touch outside the bounds of a button:

``````{ brush="lua" gutter="true" first-line="28" highlight="[46,47,48,49,50,51,52]" }
local function handleController( event )

	local touchOverButton = detectButton( event )

	if ( event.phase == "began" ) then

		if ( touchOverButton ~= nil ) then
			if not ( buttonGroup.touchID ) then
				-- Set/isolate this touch ID
				buttonGroup.touchID = event.id
				-- Set the active button
				buttonGroup.activeButton = touchOverButton
				-- Fire the weapon
				print( "BEGIN FIRING" )
			end
			return true
		end

	elseif ( event.phase == "moved" ) then

		-- Handle slide off
		if ( touchOverButton == nil and buttonGroup.activeButton ~= nil ) then
			event.target:dispatchEvent( { name="touch", phase="ended", target=event.target, x=event.x, y=event.y } )
			return true
		end

	elseif ( event.phase == "ended" and buttonGroup.activeButton ~= nil ) then

		-- Release this touch ID
		buttonGroup.touchID = nil
		-- Set that no button is active
		buttonGroup.activeButton = nil
		-- Stop firing the weapon
		print( "STOP FIRING" )
		return true
	end
end
``````

Basically, with this additional code, we conditionally check if the touch point is outside the button __and__ that `buttonGroup.activeButton` is <nobr>currently not `nil` &mdash;</nobr> this second condition is especially important because we need to know that the button is __already&nbsp;pressed__ when the <nobr>slide-off</nobr> occurs.

If both conditions are met, we use the convenient [object:dispatchEvent()][api.type.EventDispatcher.dispatchEvent] method to dispatch a <nobr>"pseudo-event"</nobr> of `"ended"` to the same listener function, making CORONA_CORE_PRODUCT think that the touch ended even if the player's finger is physically still touching the screen.

### Activating the Controller

The fundamental detection code is now complete, but the controller itself won't do anything. This is because we haven't "activated" it yet!

To make it active, simply add a standard touch event listener to the `groupRegion` object, triggering the `handleController()` function on each touch event:

``````{ brush="lua" gutter="true" first-line="66" highlight="[66]" }
groupRegion:addEventListener( "touch", handleController )
``````

### Responding to Action

Depending on whether the button is pressed or not, we need to take some associated action. Since we're dealing with __continuous__ actions, the event itself should be continuous in some way.

While one approach is to perform an action <nobr>(like firing a laser)</nobr> on every runtime frame using an `"enterFrame"` listener, that's probably too often for most purposes&nbsp;&mdash; after all, should a ship really fire <nobr>30 or 60 lasers</nobr> __per&nbsp;second__ in a typical shooter game?

A more practical approach is to use a __timer__ and toggle it on/off depending on the button state, allowing us to control the rate of the continuous action. Thus, let's integrate a timer into our existing code:

``````{ brush="lua" gutter="true" first-line="28" highlight="[28,30,31,32,48,69]" }
local fireTimer

local function fireLaser( event )
	print( "FIRE A LASER!" )
end

local function handleController( event )

	local touchOverButton = detectButton( event )

	if ( event.phase == "began" ) then

		if ( touchOverButton ~= nil ) then
			if not ( buttonGroup.touchID ) then
				-- Set/isolate this touch ID
				buttonGroup.touchID = event.id
				-- Set the active button
				buttonGroup.activeButton = touchOverButton
				-- Fire the weapon
				print( "BEGIN FIRING" )
				fireTimer = timer.performWithDelay( 100, fireLaser, 0 )
			end
			return true
		end

	elseif ( event.phase == "moved" ) then

		-- Handle slide off
		if ( touchOverButton == nil and buttonGroup.activeButton ~= nil ) then
			event.target:dispatchEvent( { name="touch", phase="ended", target=event.target, x=event.x, y=event.y } )
			return true
		end

	elseif ( event.phase == "ended" and buttonGroup.activeButton ~= nil ) then

		-- Release this touch ID
		buttonGroup.touchID = nil
		-- Set that no button is active
		buttonGroup.activeButton = nil
		-- Stop firing the weapon
		print( "STOP FIRING" )
		timer.cancel( fireTimer )
		return true
	end
end

groupRegion:addEventListener( "touch", handleController )
``````

Let's inspect the highlighted additions in more detail:

1. On line&nbsp;28, we <nobr>forward-declare</nobr> a variable `fireTimer`. This will be used as a persistent reference to the timer which controls the action.

2. On <nobr>lines 30-32</nobr>, we add the foundational function for firing lasers (`fireLaser()`). How you actually fire lasers (or&nbsp;perform whatever continuous&nbsp;action) is completely dependent on your game, so for now we'll just `print()` a string for testing.

3. On line&nbsp;48, when the button is effectively pressed, we __start__ a new timer, assigning it to the `fireTimer` reference we created on line&nbsp;28. This timer will repeat every 100&nbsp;milliseconds, triggering the `fireLaser()` function on each iteration.

4. On line&nbsp;69, when the button is effectively released, we __cancel__ the timer using the `fireTimer` reference it was created with.


## Virtual Directional Pad

<div class="float-right" style="max-width: 230px; margin-bottom: 16px; clear: both;">

![][images.docs.cont-actions-2]

</div>

Another common UI element is a __virtual&nbsp;directional&nbsp;pad__. These usually consist of <nobr>2-directional</nobr> or <nobr>4-directional</nobr> virtual buttons arranged <nobr>side-by-side</nobr> or in a <nobr>plus-shaped</nobr> configuration, similar to the physical directional pad on a game controller. 

Creating a control set like this in CORONA_CORE_PRODUCT can be done similarly to the virtual button method above, but in this case, the player will usually keep their finger touched down on the screen in the region of the control pad, simply sliding around (not&nbsp;releasing) to activate another directional button. Thus, in addition to the <nobr>slide-off</nobr>, we must handle the <nobr>__slide-on__</nobr> action where the player simply moves their touch point from one directional button to another.

### Creating the Controller

This time, let's use __two__ images <nobr>side-by-side</nobr> to construct a basic <nobr>2-directional</nobr> controller:

``````{ brush="lua" gutter="true" first-line="1" highlight="[3,4,5,6,8,9,10,11]" }
local buttonGroup = display.newGroup()

local leftButton = display.newImageRect( buttonGroup, "leftButton.png", 64, 64 )
leftButton.x, leftButton.y = 60, display.contentHeight-60
leftButton.canSlideOn = true
leftButton.ID = "left"

local rightButton = display.newImageRect( buttonGroup, "rightButton.png", 64, 64 )
rightButton.x, rightButton.y = 136, display.contentHeight-60
rightButton.canSlideOn = true
rightButton.ID = "right"

local groupBounds = buttonGroup.contentBounds
local groupRegion = display.newRect( 0, 0, groupBounds.xMax-groupBounds.xMin+200, groupBounds.yMax-groupBounds.yMin+200 )
groupRegion.x = groupBounds.xMin + ( buttonGroup.contentWidth/2 )
groupRegion.y = groupBounds.yMin + ( buttonGroup.height/2 )
groupRegion.isVisible = false
groupRegion.isHitTestable = true

local function detectButton( event )

	for i = 1,buttonGroup.numChildren do
		local bounds = buttonGroup[i].contentBounds
		if (
			event.x > bounds.xMin and
			event.x < bounds.xMax and
			event.y > bounds.yMin and
			event.y < bounds.yMax
		) then
			return buttonGroup[i]
		end
	end
end
``````

This code is similar to the virtual button example above, with two very important distinctions:

1. For each button, we set a boolean `canSlideOn` property, initially set to `true`. Because players manipulating a directional pad will typically slide their touch from button to button, this will let us handle <nobr>__slide-on__</nobr> behavior.

2. We assign an `ID` property of `"left"` or `"right"` to each button&nbsp;&mdash; later, this will help us identify the "direction" it represents.

### Button Listener

Now let's construct the listener function to handle touch events, adapting the code from the first example to handle multiple buttons. We'll start with the `"began"` phase block:

``````{ brush="lua" gutter="true" first-line="35" highlight="[39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55]" }
local function handleController( event )

	local touchOverButton = detectButton( event )

	if ( event.phase == "began" ) then

		if ( touchOverButton ~= nil ) then
			if not ( buttonGroup.touchID ) then
				-- Set/isolate this touch ID
				buttonGroup.touchID = event.id
				-- Set the active button
				buttonGroup.activeButton = touchOverButton
				-- Take proper action based on button ID
				if ( buttonGroup.activeButton.ID == "left" ) then
					print( "LEFT" )
				elseif ( buttonGroup.activeButton.ID == "right" ) then
					print( "RIGHT" )
				end
			end
			return true
		end
``````

This is similar to the first example, but we've added some conditional checks on the active button's `ID` property <nobr>(lines 48 and 50)</nobr> to determine which action to take.

Now let's expand upon the `"moved"` phase block:

``````{ brush="lua" gutter="true" first-line="57" highlight="[64,65,66,67]" }
	elseif ( event.phase == "moved" ) then

		-- Handle slide off
		if ( touchOverButton == nil and buttonGroup.activeButton ~= nil ) then
			event.target:dispatchEvent( { name="touch", phase="ended", target=event.target, x=event.x, y=event.y } )
			return true

		-- Handle slide on
		elseif ( touchOverButton ~= nil and buttonGroup.activeButton == nil and touchOverButton.canSlideOn ) then
			event.target:dispatchEvent( { name="touch", phase="began", target=event.target, x=event.x, y=event.y, id=event.id } )
			return true
		end

	elseif ( event.phase == "ended" and buttonGroup.activeButton ~= nil ) then

		-- Release this touch ID
		buttonGroup.touchID = nil
		-- Set that no button is active
		buttonGroup.activeButton = nil
		-- Stop the action
		print( "STOP" )
		return true
	end
end

groupRegion:addEventListener( "touch", handleController )
``````

With this additional check <nobr>(lines 64-67)</nobr>, we check for <nobr>__slide-on__</nobr> by testing if the touch point is inside the bounds of a button __and__ that `buttonGroup.activeButton` is <nobr>currently `nil` &mdash;</nobr> this second condition is especially important because we need to know that the button is __not__ already pressed when the <nobr>slide-on</nobr> occurs. As a third condition, we confirm that the button accepts <nobr>slide-on</nobr> behavior by testing for a `canSlideOn` property value of `true`.

If all conditions are met, we use the [object:dispatchEvent()][api.type.EventDispatcher.dispatchEvent] method to dispatch a <nobr>pseudo-event</nobr> of `"began"` to the same listener function, making CORONA_CORE_PRODUCT think that a new touch began on the button, even though the player's finger is already physically touching the screen.

### <nobr>Frame-Based</nobr> Movement

Responding to interaction with directional buttons may differ from typical buttons. Usually, if a directional button is pressed, a steady and consistent action should occur until the button is released (or&nbsp;a&nbsp;neighboring button is interacted&nbsp;with).

One way to continuously move a character/object is to simply update its __x__ or __y__ position in a runtime `"enterFrame"` function. We can combine this approach with our directional controller by creating a simple test object, writing a basic listener function, and including some "control" code within the `handleController()` function:

``````{ brush="lua" gutter="true" first-line="35" highlight="[35,36,38,39,40,41,42,58,60]" }
local testObj = display.newRect( display.contentCenterX, display.contentCenterY, 20, 20 )
testObj.deltaPerFrame = { 0, 0 }

local function frameUpdate()
	testObj.x = testObj.x + testObj.deltaPerFrame[1]
	testObj.y = testObj.y + testObj.deltaPerFrame[2]
end
Runtime:addEventListener( "enterFrame", frameUpdate )

local function handleController( event )

	local touchOverButton = detectButton( event )

	if ( event.phase == "began" ) then

		if ( touchOverButton ~= nil ) then
			if not ( buttonGroup.touchID ) then
				-- Set/isolate this touch ID
				buttonGroup.touchID = event.id
				-- Set the active button
				buttonGroup.activeButton = touchOverButton
				-- Take proper action based on button ID
				if ( buttonGroup.activeButton.ID == "left" ) then
					testObj.deltaPerFrame = { -2, 0 }
				elseif ( buttonGroup.activeButton.ID == "right" ) then
					testObj.deltaPerFrame = { 2, 0 }
				end
			end
			return true
		end

	elseif ( event.phase == "moved" ) then
``````

``````{ brush="lua" gutter="true" first-line="79" highlight="[86]" }
	elseif ( event.phase == "ended" and buttonGroup.activeButton ~= nil ) then

		-- Release this touch ID
		buttonGroup.touchID = nil
		-- Set that no button is active
		buttonGroup.activeButton = nil
		-- Stop the action
		testObj.deltaPerFrame = { 0, 0 }
		return true
	end
end
``````

Let's explore the highlighted code in more detail:

1. On <nobr>lines 35 and 36</nobr>, we create a simple test object (vector&nbsp;square) positioned in the center of the content area. We also assign a property to the object, `deltaPerFrame`, which is a table of two values, <nobr>one for __x__</nobr> and <nobr>one for __y__</nobr>. Our object will begin in a stopped/stationary state, so we initially set both of these to `0`.

2. On <nobr>lines 38-41</nobr>, we add a basic function (`frameUpdate()`) to update the object's __x__ and __y__ position, based on the values in its `deltaPerFrame` property. Then, on line&nbsp;42, we start that function running/executing on each runtime frame by adding an `"enterFrame"` event listener.

3. On <nobr>lines 58 and 60</nobr>, we change the object's `deltaPerFrame` property values based on which directional button is pressed. If the __left__ button is pressed, the first value (__x__) is set to `-2`, meaning that the object will begin moving 2&nbsp;pixels to the left on each runtime frame. Similarly, if the __right__ button is pressed, we set the first value to `2` so that the object will move 2&nbsp;pixels to the right per frame. Note that you can increase/decrease these values if you want the object to move faster or slower.

4. Finally, on line&nbsp;86, we reset the `deltaPerFrame` values to `0` to stop the object's movement if the player's touch drifts off a directional button.

### <nobr>Physics-Based</nobr> Movement

Another way to continuously move a character/object is via __physics__. Of course, this assumes that the object is a physical object being managed by the physics engine, a topic beyond the scope of this tutorial (if&nbsp;you&nbsp;need assistance on physics, start with the [Physics Setup][guide/physics/physicsSetup]&nbsp;guide).

In terms of integrating <nobr>physics-based</nobr> movement with a directional controller, the best option is usually to set the object's <nobr>__linear velocity__ &mdash; this is</nobr> because it applies a consistent, steady rate of movement to the object instead of stacking force values or applying momentary impulses.

Let's adjust the code to use physics and linear velocity:

``````{ brush="lua" gutter="true" first-line="35" highlight="[36,37,39,40,56,58]" }
-- Set up physics engine
local physics = require( "physics" )
physics.start()

local testObj = display.newRect( display.contentCenterX, display.contentCenterY, 20, 20 )
physics.addBody( testObj, "kinematic" )

local function handleController( event )

	local touchOverButton = detectButton( event )

	if ( event.phase == "began" ) then

		if ( touchOverButton ~= nil ) then
			if not ( buttonGroup.touchID ) then
				-- Set/isolate this touch ID
				buttonGroup.touchID = event.id
				-- Set the active button
				buttonGroup.activeButton = touchOverButton
				-- Take proper action based on button ID
				if ( buttonGroup.activeButton.ID == "left" ) then
					testObj:setLinearVelocity( -100, 0 )
				elseif ( buttonGroup.activeButton.ID == "right" ) then
					testObj:setLinearVelocity( 100, 0 )
				end
			end
			return true
		end

	elseif ( event.phase == "moved" ) then
``````

``````{ brush="lua" gutter="true" first-line="77" highlight="[84]" }
	elseif ( event.phase == "ended" and buttonGroup.activeButton ~= nil ) then

		-- Release this touch ID
		buttonGroup.touchID = nil
		-- Set that no button is active
		buttonGroup.activeButton = nil
		-- Stop the action
		testObj:setLinearVelocity( 0, 0 )
		return true
	end
end
``````

Exploring the highlighted code in more depth, we perform these actions:

1. On <nobr>lines 36 and 37</nobr>, we `require()` the physics engine and start it running.

2. On <nobr>lines 39 and 40</nobr>, we create a simple test object (vector&nbsp;square) positioned in the center of the content area. We also tell the physics engine to manage this object by assigning it a physical body of [kinematic][api.type.Body.bodyType] type.

3. On <nobr>lines 56 and 58</nobr>, we set the object's linear velocity using [object:setLinearVelocity()][api.type.Body.setLinearVelocity]. If the __left__ button is pressed, we assign a value of `-100` to the __x__ parameter, causing the object to start moving left. Similarly, if the __right__ button is pressed, we assign a value of `100` to the __x__ parameter, causing the object to begin moving right. Note that you can increase/decrease these values if you want the object to move faster or slower.

4. Finally, on line&nbsp;84, we reset both of the object's linear velocity values to `0` to stop its movement if the player's touch drifts off a directional button.


## Conclusion

Hopefully, this tutorial has provided a foundation for handling continuous actions in CORONA_CORE_PRODUCT. This practice may apply to many scenarios beyond those presented and you'll find that, with a little creativity, the sky is the limit!
