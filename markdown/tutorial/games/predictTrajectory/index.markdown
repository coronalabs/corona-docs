# Predicting Trajectory

Predicting trajectory has traditionally been a confusing endeavor, and some developers simply "guess" and hope for the best. In this tutorial, we'll discuss the real solution!


## Test Project Setup

For purposes of this tutorial, let's quickly create a test project:

1. Open the Corona Simulator.

2. Click __New&nbsp;Project__ from the welcome window or select <nobr>__New Project...__</nobr> from the __File__ menu.

3. For the project/application name, type `TestLaunch` and ensure that the __Blank__ template option is selected. Leave the screen size settings at default but set __Default&nbsp;Orientation__ to __Sideways__, then click __OK__ (Windows) or __Next__ (Mac). This will create the basic files for the test project in the location (folder) that you specified.

4. Locate the project folder, open the `main.lua` file in your chosen text editor, and insert these lines of code:

<div class="code-indent">

``````{ brush="lua" gutter="false" first-line="1" }
local physics = require( "physics" )
physics.start()  -- Start the physics engine
physics.setGravity( 0, 9.8 )  -- Set typical Earth gravity

-- Create display group for predicted trajectory
local predictedPath = display.newGroup()

-- Create function forward references
local getTrajectoryPoint
local launchProjectile
``````

</div>


## Touch Handling

The core task of predictive trajectory is gathering some basic data like the starting position and starting velocity of the projectile you want to launch. This can be accomplished with a `"touch"` event listener, so add the following code to your test project after the previous commands:

``````{ brush="lua" gutter="false" first-line="1" highlight="[3,6,7,9,11,12,13,14,15]" }
local function screenTouch( event )

	if ( event.phase == "moved" ) then

		-- Remove trajectory path group (to clear previous path), then re-create it
		display.remove( predictedPath )
		predictedPath = display.newGroup()

		local startingVelocity = { x=event.x-event.xStart, y=event.y-event.yStart }

		for i = 1,240,2 do
			local s = { x=event.xStart, y=event.yStart }
			local trajectoryPosition = getTrajectoryPoint( s, startingVelocity, i )
			local dot = display.newCircle( predictedPath, trajectoryPosition.x, trajectoryPosition.y, 4 )
		end

	elseif ( event.phase == "ended" ) then

		launchProjectile( event )
	end
	return true
end
Runtime:addEventListener( "touch", screenTouch )
``````

Let's inspect this code in more detail:

1. The core of this function works on the `"moved"` touch phase. This allows us to start touching at a certain point on the screen (this&nbsp;will be the origin of the&nbsp;projectile) and then drag around to render a dotted path that represents the predicted trajectory.

2. Inside the conditional `"moved"` phase block, we first remove the `predictedPath` display group created earlier, then we <nobr>re-create</nobr> it. It may seem odd to remove the group then immediately <nobr>re-create</nobr> it, but this is a simple way to remove all of the <nobr>previously-drawn</nobr> dots before drawing an entirely new set which represents the adjusted trajectory.

3. Following that, we calculate the starting __x__ and __y__ "velocity" values by subtracting the starting touch location (`event.xStart`/`event.yStart`) from the current touch location (`event.x`/`event.y`).

4. Finally, with this basic information, we run a `for` loop which draws the predicted trajectory path in 240 steps&nbsp;&mdash; 4&nbsp;seconds of launch time at <nobr>60 frames-per-second &mdash;</nobr> using vector circles (you&nbsp;could use images if&nbsp;desired). Note that we iterate by `2` in the loop since, for test purposes, 120&nbsp;path&nbsp;points (dots) is enough to clearly represent the predicted trajectory.


## Calculating Trajectory

Within the `for` loop in the above function, the core calculation is done via the following function which uses the <nobr>frames-per-second</nobr> in "time&nbsp;steps" along with the starting position and velocity. Add this code block to your project following the previous lines:

``````{ brush="lua" gutter="false" first-line="1" }
getTrajectoryPoint = function( startingPosition, startingVelocity, n )

	-- Velocity and gravity are given per second but we want time step values
	local t = 1/display.fps  -- Seconds per time step at 60 frames-per-second (default)
	local stepVelocity = { x=t*startingVelocity.x, y=t*startingVelocity.y }
	local gx, gy = physics.getGravity()
	local stepGravity = { x=t*gx, y=t*gy }

	return {
		x = startingPosition.x + n * stepVelocity.x + 0.25 * (n*n+n) * stepGravity.x,
		y = startingPosition.y + n * stepVelocity.y + 0.25 * (n*n+n) * stepGravity.y
	}
end
``````

<div class="guide-notebox">
<div class="notebox-title">Note</div>

This trajectory calculation is based on an app running at 60 <nobr>frames-per-second</nobr> <nobr>(`fps` value within `config.lua`)</nobr>. If you wish to use 30 frames per second, change each instance of `0.25` in the returned `x` and `y` values to `0.5` and everything should mesh up perfectly.

</div>


## Launching a Projectile

On touch release, firing the projectile is simple. We simply generate the projectile, add a physical body, and assign the velocity values that we gathered to send it flying across the trajectory path in a perfect match. To test, add this code block to your project following the previous lines:

``````lua
launchProjectile = function( event )
	
	-- Create projectile object
	local proj = display.newCircle( event.xStart, event.yStart, 24 )
	proj:setFillColor( 1,0.2,0.2 )

	-- Add physical body to object
	physics.addBody( proj, { bounce=0.2, density=1.0, radius=24 } )

	-- Apply velocity values to object
	local vx, vy = event.x-event.xStart, event.y-event.yStart
	proj:setLinearVelocity( vx, vy )
end
``````

Now save the project, refresh/reload it, and touch/drag around the screen to draw a predicted trajectory path. Upon release, a projectile (red&nbsp;circle) should generate at the starting point and it should perfectly follow the predicted path!


## Conclusion

Hopefully this tutorial illustrates that predictive trajectory is not an insurmountable task, nor one that requires a "best&nbsp;guess" sort of operation. With these calculations, accurate trajectory paths are easily accomplished in Corona!
