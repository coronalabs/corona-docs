# Basic Object Spawning

In game design, a common element is __object&nbsp;spawning__, whether it be spawning a variable number of enemies and placing them randomly about the screen, or spawning items repeatedly on a timer increment. In this tutorial, we'll step through a basic spawning module which includes the following features:

* Set rectangular bounds on the screen within which to spawn objects.
* Spawn an initial number of objects immediately (optional).
* Spawn a flexible amount of objects on a repeating timer.
* Pause, resume, or stop the spawning process.


## Initial Setup

Let's begin with a few initial commands...

``````lua
local spawnTimer
local spawnedObjects = {}

-- Seed the random number generator
math.randomseed( os.time() )
``````

The first variable, `spawnTimer`, is simply a Lua forward reference to the timer object which we'll use to control the spawning process. The second variable, `spawnedObjects`, is a basic table into which we'll insert items as they are spawned, providing us with a basic method to track them, count them, loop over them, etc.

The third command sets the "seed" for the <nobr>pseudo-random</nobr> number generator. On some operating systems, this generator begins with the same initial value which causes random numbers to repeat in a predictable pattern. This addition to our code ensures that the generator always starts with a different seed.


## Spawn Parameters

Now, let's set up a table of basic spawning parameters which we can use to adjust/control the spawning:

``````lua
local spawnParams = {
	xMin = 20,
	xMax = 300,
	yMin = 20,
	yMax = 460,
	spawnTime = 200,
	spawnOnTimer = 12,
	spawnInitial = 4
}
``````

All of these parameters are optional and will default to various values (details&nbsp;later) but they should usually be set to appropriate values for your game. Essentially, the first four parameters define the rectangular region on the screen in which items will spawn, as defined by a minimum and maximum for both __x__ and __y__. The next parameter (`spawnTime`) defines the timed increment, in milliseconds, upon which new items will spawn, assuming an amount of items is defined by the `spawnOnTimer` parameter. Lastly, the `spawnInitial` parameter can be used to instantly spawn a certain number of items, if the game design calls for it.


## Basic Spawning Function

Next, we'll need a basic spawning function which creates the objects:

``````lua
-- Spawn an item
local function spawnItem( bounds )

	-- Create an item
	local item = display.newCircle( 0, 0, 20 )

	-- Position item randomly within set bounds
	item.x = math.random( bounds.xMin, bounds.xMax )
	item.y = math.random( bounds.yMin, bounds.yMax )

	-- Add item to "spawnedObjects" table for tracking purposes
	spawnedObjects[#spawnedObjects+1] = item
end
``````

The first few lines create a sample item&nbsp;&mdash; in this case a basic white vector circle. Obviously these items could be images, animated sprites, objects which you then enable for physics usage, etc.

The next few lines position the item randomly within the declared bounds. Recall that we declared these as the first four parameters in the `spawnParams` table.

The final line simply adds the new item to the `spawnedObjects` table, providing a simple method to track and manage the spawned objects.


## Spawn Controller

The next step is to create a simple but reasonably powerful "controller" function which allows us to start, stop, pause, and resume the spawning process. This function will accept two arguments: an `action` argument which represents the action to perform and a `params` argument (this&nbsp;represents the `spawnParams` table that we declared&nbsp;above).

``````{ brush="lua" gutter="true" first-line="1" }
local function spawnController( action, params )

	-- Cancel timer on "start" or "stop", if it exists
	if ( spawnTimer and ( action == "start" or action == "stop" ) ) then
		timer.cancel( spawnTimer )
	end

	-- Start spawning
	if ( action == "start" ) then

		-- Gather/set spawning bounds
		local spawnBounds = {}
		spawnBounds.xMin = params.xMin or 0
		spawnBounds.xMax = params.xMax or display.contentWidth
		spawnBounds.yMin = params.yMin or 0
		spawnBounds.yMax = params.yMax or display.contentHeight

		-- Gather/set other spawning params
		local spawnTime = params.spawnTime or 1000
		local spawnOnTimer = params.spawnOnTimer or 50
		local spawnInitial = params.spawnInitial or 0

		-- If "spawnInitial" is greater than 0, spawn that many item(s) instantly
		if ( spawnInitial > 0 ) then
			for n = 1,spawnInitial do
				spawnItem( spawnBounds )
			end
		end

		-- Start repeating timer to spawn items
		if ( spawnOnTimer > 0 ) then
			spawnTimer = timer.performWithDelay( spawnTime,
				function() spawnItem( spawnBounds ); end,
			spawnOnTimer )
		end

	-- Pause spawning
	elseif ( action == "pause" ) then
		timer.pause( spawnTimer )

	-- Resume spawning
	elseif ( action == "resume" ) then
		timer.resume( spawnTimer )
	end
end
``````

Let's examine this function <nobr>step-by-step</nobr>:

* On lines 4-6, we include a few lines to cancel the timer on the start and stop actions. Recall that we <nobr>forward-referenced</nobr> the timer object (`spawnTimer`) at the start, so we can safely use that reference here.

<div class="code-indent">

``````{ brush="lua" gutter="true" first-line="3" highlight="[4,5,6]" }
-- Cancel timer on "start" or "stop", if it exists
if ( spawnTimer and ( action == "start" or action == "stop" ) ) then
	timer.cancel( spawnTimer )
end
``````

<div class="docs-tip-outer">
<div class="docs-tip-inner-left">
<div class="fa fa-cog"></div>
</div>
<div class="docs-tip-inner-right">

It's fairly obvious why we cancel the timer on the __stop__ action, but why do we also cancel it on the __start__ action? Basically, it's just a <nobr>fail-safe</nobr>, so if the function is called multiple times with the start action, the previous timer object is cancelled and it can begin in a clean state.

</div>
</div>

</div>

* In the next block, we handle the most important spawning action: the __start__ action.

<div class="code-indent">

In the initial lines of this conditional block, we gather/set various parameters based on those defined in the `spawnParams` table which was declared earlier. As noted, all of those parameters are optional, so if any are undefined, we set some basic defaults in their place.

``````{ brush="lua" gutter="true" first-line="8" highlight="[11,12,13,14,15,16,17,18,19,20,21]" }
-- Start spawning
if ( action == "start" ) then

	-- Gather/set spawning bounds
	local spawnBounds = {}
	spawnBounds.xMin = params.xMin or 0
	spawnBounds.xMax = params.xMax or display.contentWidth
	spawnBounds.yMin = params.yMin or 0
	spawnBounds.yMax = params.yMax or display.contentHeight

	-- Gather/set other spawning params
	local spawnTime = params.spawnTime or 1000
	local spawnOnTimer = params.spawnOnTimer or 50
	local spawnInitial = params.spawnInitial or 0
``````

Next, we check if the `spawnInitial` parameter is greater than `0` and, if&nbsp;so, we instantly spawn that number of items. Note that we pass the `spawnBounds` table to the `spawnItem()` function so it recognizes the limits in which to spawn the items.

``````{ brush="lua" gutter="true" first-line="8" highlight="[23,24,25,26,27,28]" }
-- Start spawning
if ( action == "start" ) then

	-- Gather/set spawning bounds
	local spawnBounds = {}
	spawnBounds.xMin = params.xMin or 0
	spawnBounds.xMax = params.xMax or display.contentWidth
	spawnBounds.yMin = params.yMin or 0
	spawnBounds.yMax = params.yMax or display.contentHeight

	-- Gather/set other spawning params
	local spawnTime = params.spawnTime or 1000
	local spawnOnTimer = params.spawnOnTimer or 50
	local spawnInitial = params.spawnInitial or 0

	-- If "spawnInitial" is greater than 0, spawn that many item(s) instantly
	if ( spawnInitial > 0 ) then
		for n = 1,spawnInitial do
			spawnItem( spawnBounds )
		end
	end
``````

Following this, we check if the `spawnOnTimer` parameter is greater than `0` and, if&nbsp;so, we start a timer which spawns that amount of items on the set `spawnTime` increment. Note that we set this timer object to the `spawnTimer` reference so we can pause, resume, or stop it later if needed. As above, we pass the `spawnBounds` table to the anonymous function so that all items are spawned within the desired bounds.

``````{ brush="lua" gutter="true" first-line="8" highlight="[30,31,32,33,34,35]" }
-- Start spawning
if ( action == "start" ) then

	-- Gather/set spawning bounds
	local spawnBounds = {}
	spawnBounds.xMin = params.xMin or 0
	spawnBounds.xMax = params.xMax or display.contentWidth
	spawnBounds.yMin = params.yMin or 0
	spawnBounds.yMax = params.yMax or display.contentHeight

	-- Gather/set other spawning params
	local spawnTime = params.spawnTime or 1000
	local spawnOnTimer = params.spawnOnTimer or 50
	local spawnInitial = params.spawnInitial or 0

	-- If "spawnInitial" is greater than 0, spawn that many item(s) instantly
	if ( spawnInitial > 0 ) then
		for n = 1,spawnInitial do
			spawnItem( spawnBounds )
		end
	end

	-- Start repeating timer to spawn items
	if ( spawnOnTimer > 0 ) then
		spawnTimer = timer.performWithDelay( spawnTime,
			function() spawnItem( spawnBounds ); end,
		spawnOnTimer )
	end
``````

</div>

* The final step is to account for the __pause__ and __resume__ actions. This is simply accomplished by adding two more conditional code blocks and calling the necessary timer API:

<div class="code-indent">

``````{ brush="lua" gutter="true" first-line="37" highlight="[37,38,39,41,42,43]" }
	-- Pause spawning
	elseif ( action == "pause" ) then
		timer.pause( spawnTimer )

	-- Resume spawning
	elseif ( action == "resume" ) then
		timer.resume( spawnTimer )
	end
end
``````

</div>


## Calling the Spawn Controller

From this point, the spawn controller can easily be called with four possible actions. Note that calling the `spawnController()` function with `"start"` as the `action` parameter is the sole use case which requires the `spawnParams` table&nbsp;&mdash; the other actions assume that the spawning process is already underway.

``````lua
spawnController( "start", spawnParams )
``````

``````lua
spawnController( "pause" )
``````

``````lua
spawnController( "resume" )
``````

``````lua
spawnController( "stop" )
``````


## Conclusion

Hopefully this tutorial gives you a simple base module atop which to build a more comprehensive spawning methodology involving animated sprites, physics objects, variable time increments, and much more.
