
# Radial Gravity

Although Corona's Box2D-powered physics engine can easily simulate __x__ and __y__ directional gravity, __radial&nbsp;gravity__ isn't <nobr>built-in</nobr> functionality. Fortunately, it can be accomplished relatively easily using standard physics collision events and a __touch&nbsp;joint__.

For those who don't know what radial gravity is, it's essentially like the simulated gravitational pull of a planet, or a magnet pulling outlying metal objects toward it. This tutorial will outline how to build a basic radial gravity simulation with properties that can be easily altered, including the size and strength of the gravitational field.


## Test Project Setup

For purposes of this tutorial, let's quickly create a test project:

1. Open the Corona Simulator.

2. Click __New&nbsp;Project__ from the welcome window or select <nobr>__New Project...__</nobr> from the __File__ menu.

3. For the project/application name, type `RadialGravity` and ensure that the __Blank__ template option is selected. Leave the screen size settings at default but set __Default&nbsp;Orientation__ to __Sideways__, then click __OK__ (Windows) or __Next__ (Mac). This will create the basic files for the test project in the location (folder) that you specified.

4. Locate the project folder, open the `main.lua` file in your chosen text editor, then insert these lines of code:

<div class="code-indent">

``````{ brush="lua" gutter="false" first-line="1" }
local physics = require( "physics" )
physics.start()  -- Start the physics engine
physics.setGravity( 0, 0 )  -- Set "space" gravity
math.randomseed( os.time() )  -- Seed the pseudo-random number generator

-- Set radial gravity simulation values
local fieldRadius = 120
local fieldPower = 0.4
``````


## Creating the Radial Field

The first step is to create the gravitational field that will exert a pull force on objects that enter it. In Corona, we can create this field as a simple __radial&nbsp;body__ set as a __sensor__. In your project, add the following lines:

``````{ brush="lua" gutter="false" first-line="1" }
local field = display.newCircle( display.contentCenterX, display.contentCenterY, fieldRadius )
field.alpha = 0.2

-- Add physical body (sensor) to field
physics.addBody( field, "static", { isSensor=true, radius=fieldRadius } )
``````


## Objects Colliding With Field

The common method behind other objects being affected by radial gravity is their collision with this field. Essentially, when an object __enters__ the field&nbsp;&mdash; collision phase of `"began"`&nbsp;&mdash; we'll create a physics __touch&nbsp;joint__ between the object and the center of the field. Similarly, if an object __exits__ the field <nobr>(collision phase of `"ended"`)</nobr>, we'll break (remove) the touch joint and let the object go about its normal physical behavior.

### Objects Entering Field

First, let's add the following code to the project to handle objects which __enter__ the gravitational field:

``````{ brush="lua" gutter="false" first-line="1" highlight="[3,5,8,9,10,11,12,13,14,15,16,17,18]" }
local function collideWithField( self, event )

	local objectToPull = event.other

	if ( event.phase == "began" and objectToPull.touchJoint == nil ) then

		-- Create touch joint after short delay (10 milliseconds)
		timer.performWithDelay( 10,
			function()
				-- Create touch joint
				objectToPull.touchJoint = physics.newJoint( "touch", objectToPull, objectToPull.x, objectToPull.y )
				-- Set physical properties of touch joint
				objectToPull.touchJoint.frequency = fieldPower
				objectToPull.touchJoint.dampingRatio = 0.0
				-- Set touch joint "target" to center of field
				objectToPull.touchJoint:setTarget( self.x, self.y )
			end
		)
	end
end
field.collision = collideWithField
field:addEventListener( "collision" )
``````

Inspecting this in more detail, we do the following:

1. First, with <nobr>`local objectToPull = event.other`</nobr>, we create a local reference to the object which collided with the field.

2. With the first conditional check, we confirm that the `"began"` phase has occurred __and__ that the object doesn't already have a touch joint applied (this&nbsp;second condition is simply an <nobr>additional fail-safe)</nobr>.

3. After a short timer delay (see&nbsp;notes&nbsp;below), we add a touch joint to the object, set the basic joint properties, and then set its __target__ to the center of the gravitational field <nobr>(`self.x`/`self.y`)</nobr>.

<div class="guide-notebox">
<div class="notebox-title">Notes</div>

* Because certain physical actions like creating joints can't be done in the exact same time step as a collision, we must do so following a short timer <nobr>(here, 10 milliseconds)</nobr>. For simplicity, we use an anonymous function inside the `timer.performWithDelay()` call to create the touch joint.

* In the case of a touch joint, you don't actually join the object to another object as you would with most physical joints. For this joint type, the "target" is simply a point in world coordinates.

</div>

### Objects Exiting Field

So that the gravitational field doesn't maintain permanent control over objects which __exit__ its radius, we need to add some code to break (remove) the object's touch joint.

In your project, add the following code __inside__ the existing `collideWithField()` function:

``````{ brush="lua" gutter="false" first-line="1" highlight="[20,21,22,23]" }
local function collideWithField( self, event )

	local objectToPull = event.other

	if ( event.phase == "began" and objectToPull.touchJoint == nil ) then

		-- Create touch joint after short delay (10 milliseconds)
		timer.performWithDelay( 10,
			function()
				-- Create touch joint
				objectToPull.touchJoint = physics.newJoint( "touch", objectToPull, objectToPull.x, objectToPull.y )
				-- Set physical properties of touch joint
				objectToPull.touchJoint.frequency = fieldPower
				objectToPull.touchJoint.dampingRatio = 0.0
				-- Set touch joint "target" to center of field
				objectToPull.touchJoint:setTarget( self.x, self.y )
			end
		)

	elseif ( event.phase == "ended" and objectToPull.touchJoint ~= nil ) then

		objectToPull.touchJoint:removeSelf()
		objectToPull.touchJoint = nil
	end
end
``````

This addition is simple: in the `"ended"` collision phase, we remove the touch joint, effectively allowing the object to continue on with its normal physical behavior.


## Generating Objects

Let's complete our project by generating 5 objects which approach the gravitational field at random speeds. Add the following code to your project following the previous lines:

``````lua
for i = 1,5 do

	local object = display.newCircle( 0, (i*50)+10, 10 )
	physics.addBody( object, { radius=10 } )

	local velocity = math.random( 80, 120 )
	object:setLinearVelocity( velocity, 0 )
end
``````

Now save the project, refresh/reload it, and you'll see 5 white circles move toward the field. Upon contacting it, each circle will be drawn/attracted to the center of the field. Those moving fast enough may break free of the field's radius and fly off on their own natural path, while those that remain inside the field will be continually pulled closer toward the center.

To test behavior variations, change the `fieldPower` variable value near the beginning of the project to something higher or lower. A lower value like `0.2` will make the field's pull more gentle, while a higher value like `0.8` will pull objects very strongly toward the center.


## Conclusion

As you can see, simulating radial gravity is easily accomplished with some basic physics setup and one collision detection function. This concept can be used for planets with gravitational pull, magnets, or literally any other type of game object where you want to pull one or more objects toward another. Enjoy experimenting with the possibilities!
