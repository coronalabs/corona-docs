
# Tap/Touch Anatomy

Most Corona developers understand the concepts behind __tap__ and __touch__ events, but the lines get a little blurry when dealing with more complex scenarios, for example overlapping objects with different types of event listeners. This tutorial explains exactly how Corona handles these events and which events are broadcast to which objects.


## Tap vs. Touch

Let's quickly discuss the basics for users who may be new to Corona or mobile development in general. When the user touches the screen of a <nobr>touch-sensitive</nobr> device, this action is regarded in one of two ways:

* __tap__ &mdash; This event is represented by the user quickly touching the screen and lifting off at the same approximate point on the screen.

* __touch__ &mdash; These events provide for a much greater level of screen interactivity. Using touch events, you can detect when the user first touches the screen and when the touch is lifted off the screen. You can also track the motion of the touch as it moves around the screen.

This tutorial won't go into depth about the properties returned from these events&nbsp;&mdash; if you need to explore this topic further, please refer to the [Tap/Touch/Multitouch][guide.events.touchMultitouch] guide.


## Event Distinction

Looking beyond the basic concept of tap vs. touch, let's explore how Corona handles these events. At the core level, it's important to understand that each type is regarded as __distinct__. You may think that "a&nbsp;screen touch is just a screen&nbsp;touch," but the difference will become more apparent as we examine more complex examples.


## Test Project Setup

For purposes of this tutorial, let's quickly set up a test project consisting of two squares that overlap in the center. We'll use these squares to test different types of listeners and explore how/when the events are processed.

1. Open the Corona Simulator.

2. Click __New&nbsp;Project__ from the welcome window or select <nobr>__New Project...__</nobr> from the __File__ menu.

3. For the project/application name, type `TapTouch` and ensure that the __Blank__ template option is selected. Leave the other settings at default and click __OK__ (Windows) or __Next__ (Mac). This will create the basic files for the test project in the location (folder) that you specified.

4. Locate the project folder and open the `main.lua` file in your chosen text editor. Inside, __replace__ the existing lines with this code:

<div class="code-indent">

``````{ brush="lua" gutter="true" first-line="1" }
local backObject = display.newRect( 130, 130, 150, 150 )
backObject:setFillColor( 0.2, 0.4, 0.8 )
backObject.alpha = 0.75
backObject.name = "Back Object"

local frontObject = display.newRect( 190, 190, 150, 150 )
frontObject:setFillColor( 1, 0.2, 0.3 )
frontObject.alpha = 0.75
frontObject.name = "Front Object"

-- Tap listener function
local function tapListener( event )
	local object = event.target
	print( object.name .. " TAP" )
end

-- Touch listener function
local function touchListener( event )
	local object = event.target
	print( object.name .. " TOUCH (" .. event.phase .. ")" )
end

-- Add event listener to back object
backObject:addEventListener( "tap", tapListener )

-- Add event listener to front object
frontObject:addEventListener( "tap", tapListener )
``````

</div>


## Tap Over Tap

Working with this example, let's explore the most simple case of overlapping objects: one __tap__ object overlapping another __tap__ object. When you click/tap in the center section where the squares __overlap__ and observe the output in the console, you'll notice that (by&nbsp;default) tap events transmit through&nbsp;&mdash; or "propagate" through&nbsp;&mdash; to underlying objects. In other words, the front (red) square doesn't block the tap event from reaching the back (blue) square, and the console reflects this:

``````
Front Object TAP
Back Object TAP
``````

This is by design, but how do you prevent this from occurring when such behavior is not desired? The solution is to simply <nobr>`return true`</nobr> at the end of the listener function for associated objects, in this case `tapListener()`. Doing so will prevent tap events on an object from propagating through to <nobr>tap-able</nobr> objects behind it.

To test this concept, add the following line to your code:

``````{ brush="lua" gutter="true" first-line="11" highlight="[15]" }
-- Tap listener function
local function tapListener( event )
	local object = event.target
	print( object.name .. " TAP" )
	return true  -- Prevent propagation to underlying tap objects
end
``````

Now refresh/reload the project and, once again, click/tap in the center section where the squares __overlap__. By inspecting the console, you'll notice that the tap now only reaches the __front__ square:

``````
Front Object TAP
``````

## Touch Over Touch

As expected, the same principle applies to __touch__ events. Let's <nobr>`return true`</nobr> at the end of our touch event listener function (`touchListener()`) exactly as we did for the tap listener function:

``````{ brush="lua" gutter="true" first-line="18" highlight="[22]" }
-- Touch listener function
local function touchListener( event )
	local object = event.target
	print( object.name .. " TOUCH (" .. event.phase .. ")" )
	return true  -- Prevent propagation to underlying touch objects
end
``````

In addition, let's change both squares to __touch__ objects instead of tap objects and associate them with the `touchListener()` function. This can be done on lines&nbsp;26&nbsp;and&nbsp;29 by changing `"tap"` to `"touch"` and changing `tapListener` to `touchListener`.

``````{ brush="lua" gutter="true" first-line="25" highlight="[26,29]" }
-- Add event listener to back object
backObject:addEventListener( "touch", touchListener )

-- Add event listener to front object
frontObject:addEventListener( "touch", touchListener )
``````

Refresh/reload the project and then click/drag on the front (red) square. While doing so, inspect the console and you'll notice output messages that look like this:

``````
Front Object TOUCH (began)
Front Object TOUCH (moved)
Front Object TOUCH (moved)
Front Object TOUCH (moved)
Front Object TOUCH (moved)
...
``````


## Tap/Touch Over Touch/Tap

Things get a little more complicated when you have objects with different listener types overlapping each other, but you still need to control the propagation of tap and touch events. For testing purposes, let's adjust the sample project so it becomes a __tap__ object (red&nbsp;square) over a __touch__ object (blue&nbsp;square). Do this by editing line&nbsp;29, changing `"touch"` to `"tap"` and `touchListener` to `tapListener`:

``````{ brush="lua" gutter="true" first-line="25" highlight="[29]" }
-- Add event listener to back object
backObject:addEventListener( "touch", touchListener )

-- Add event listener to front object
frontObject:addEventListener( "tap", tapListener )
``````

Now refresh/reload the project and click/tap in the center section where the squares __overlap__. In the console, the output messages may look similar to this:

``````
Back Object TOUCH (began)
Back Object TOUCH (ended)
Front Object TAP
``````

Notice that the back square __still receives touch events__ despite the fact that we've added <nobr>`return true`</nobr> to both the `tapListener()` and `touchListener()` functions. This is why it's important to understand, as noted earlier, that tap and touch events are actually __distinct__ from Corona's standpoint, despite some similarities from the user's standpoint.

The behavior is similar if we change the sample project to a __touch__ object over a __tap__ object. To test this, edit the code as follows:

1. On line 26, change `"touch"` to `"tap"` and `touchListener` to `tapListener`.
2. On line 29, change `"tap"` to `"touch"` and `tapListener` to `touchListener`.

``````{ brush="lua" gutter="true" first-line="25" highlight="[26,29]" }
-- Add event listener to back object
backObject:addEventListener( "tap", tapListener )

-- Add event listener to front object
frontObject:addEventListener( "touch", touchListener )
``````

Refresh/reload the project and, once again, click/tap in the center section where the squares __overlap__. In the console, the output messages may look similar to this:

``````
Front Object TOUCH (began)
Front Object TOUCH (ended)
Back Object TAP
``````


## Working with Overlaps

The above examples of overlapping objects with different listener types is fairly common in app development, so you'll need an approach to handle these situations. Some examples include:

* Objects with __tap__ listeners over a larger region that must detect __touch__ events, for example basic <nobr>tap-able</nobr> objects placed over a background that can be scrolled/moved as the user touches and drags it.

* A draggable __touch__ object that can be moved around over underlying __tap__ objects which the user can tap on to collect/activate.

For both of these cases, and numerous others, there is a tactic to prevent the "wrong&nbsp;type" of event from propagating through to an underlying object with a different listener type, as follows:

1. In the instance where a front object should behave as a __tap__ object, and objects behind are __touch__ objects, we can add a listener of __both__ types (tap&nbsp;and&nbsp;touch) to the front object, with the `"touch"` event listener being simply an anonymous function which returns `true`:

<div class="code-indent">

``````{ brush="lua" gutter="false" first-line="1" highlight="[6]" }
-- Add event listener to back object
backObject:addEventListener( "touch", touchListener )

-- Add two event listeners to front object
frontObject:addEventListener( "tap", tapListener )
frontObject:addEventListener( "touch", function() return true; end )
``````

In addition, we can use the `:setFocus()` method in the `touchListener()` function to give focus to the background object. This works nicely because, since we effectively blocked touch propagation from passing through the front object, any touch object behind it will only receive focus if the touch point is __outside__ of the front object's bounds.

``````{ brush="lua" gutter="false" first-line="1" highlight="[5,6,7,8,9]" }
-- Touch listener function
local function touchListener( event )
	local object = event.target

	if ( event.phase == "began" ) then
		display.getCurrentStage():setFocus( object )
	elseif ( event.phase == "ended" or event.phase == "cancelled" ) then
		display.getCurrentStage():setFocus( nil )
	end

	print( object.name .. " TOUCH (" .. event.phase .. ")" )
	return true  -- Prevent propagation to underlying touch objects
end
``````

</div>

2. If the front object should behave as a __touch__ object, and objects behind are __tap__ objects, the same concept applies. Just add a listener of both types to the front object and define its `"tap"` event listener as an anonymous function which returns `true`:

<div class="code-indent">

``````{ brush="lua" gutter="false" first-line="1" highlight="[6]" }
-- Add event listener to back object
backObject:addEventListener( "tap", tapListener )

-- Add two event listeners to front object
frontObject:addEventListener( "touch", touchListener )
frontObject:addEventListener( "tap", function() return true; end )
``````

</div>


## Conclusion

Every project will vary slightly in the exact way that it should behave in regards to tap and touch, but understanding these core concepts is essential to the ultimate user experience. Experiment with the different types and phases, and always remember to test, test, and test again!
