# Chapter 5 &mdash; Converting the Game to Composer


<div class="walkthrough-nav">
<div class="walkthrough-nav-upper-right">

__&lang;__ [Previous][guide.programming.04] _|_ [Next][guide.programming.06] __&rang;__

</div>
</div>


In the last chapter, we learned the basics of scene management. In this chapter, we're going to convert the original game file, <nobr>now `main_original.lua`</nobr>, into our `game.lua` scene.

<div class="guides-toc">

* [Scene Structure](#structure)
* [Accessible Code](#accessible)
* [Creating the Scene](#create)
* [Showing the Scene](#show)
* [Hiding the Scene](#hide)
* [Scene Cleanup](#cleanup)
* [Extra Credit](#extracredit)
* [Chapter Concepts](#concepts)

</div>


<a id="structure"></a>

## Scene Structure

As you learned in the previous chapter, there are dedicated places in a <nobr>Composer-enabled</nobr> Lua file to put different aspects of your program. In our original version of Star&nbsp;Explorer, we had the luxury of writing our code in a linear order, for example creating an object, positioning it on the screen, potentially adding a physical body, linking up event listeners, and then moving on to the next item.

Composer requires that you think a little differently. Using it correctly requires that you consider the scene life cycle functions&nbsp;&mdash; `scene:create()`, `scene:show()`, `scene:hide()`, and <nobr>`scene:destroy()` &mdash;</nobr> and that you run commands depending on whether the scene is on screen or off screen.

Consider this concept like a movie scene: if the director is transitioning into a scene&nbsp;&mdash; fading&nbsp;in, panning the camera to a point,&nbsp;etc.&nbsp;&mdash; the actors in the scene usually won't begin acting until the scene is "ready" and focused. The same approach applies to Composer scenes. For instance, we already added commands to spawn asteroids and put them in motion, but in this `game.lua` scene we're about to create, those commands will only run once the scene is fully on screen.




<a id="accessible"></a>

## Accessible Code

Let's get started! The first point of attack is the <nobr>scene-accessible</nobr> area of the file.

1. Make a copy of the standard <nobr>`scene-template.lua`</nobr> file, included with this chapter's [source files](https://github.com/coronalabs/GettingStarted05/archive/master.zip).

2. Rename this __copy__ to `game.lua` and place it within your `StarExplorer` project folder.

3. Open both `main_original.lua` and `game.lua` in separate editor windows/tabs. You will be copying several blocks of code from `main_original.lua` to `game.lua`, so it's convenient to have both Lua files open simultaneously.

### Physics Setup

Since this game will obviously still utilize the physics engine, there's no reason to defer that setup until later. Copy your physics setup commands from `main_original.lua` and paste them into the <nobr>scene-accessible</nobr> space of `game.lua`, immediately following initialization of the scene:

``````{ brush="lua" gutter="true" first-line="2" highlight="[11,12,13]" }
local composer = require( "composer" )

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------

local physics = require( "physics" )
physics.start()
physics.setGravity( 0, 0 )
``````

<div class="guide-notebox">
<div class="notebox-title">Note</div>

Previously, we followed these commands with the [math.randomseed()][api.library.math.randomseed] command. However, you may recall that we <nobr>re-stated</nobr> that command in our modified `main.lua` file, so there's no reason to copy it over to `game.lua`.

</div>

### Image Sheet

Next we'll need the image sheet configuration. Let's paste that just below the physics commands:

``````{ brush="lua" gutter="true" first-line="11" highlight="[15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52]" }
local physics = require( "physics" )
physics.start()
physics.setGravity( 0, 0 )

-- Configure image sheet
local sheetOptions =
{
	frames =
	{
		{   -- 1) asteroid 1
			x = 0,
			y = 0,
			width = 102,
			height = 85
		},
		{   -- 2) asteroid 2
			x = 0,
			y = 85,
			width = 90,
			height = 83
		},
		{   -- 3) asteroid 3
			x = 0,
			y = 168,
			width = 100,
			height = 97
		},
		{   -- 4) ship
			x = 0,
			y = 265,
			width = 98,
			height = 79
		},
		{   -- 5) laser
			x = 98,
			y = 265,
			width = 14,
			height = 40
		},
	}
}
local objectSheet = graphics.newImageSheet( "gameObjects.png", sheetOptions )
``````

### Initial Variables

Following the image sheet setup, paste in the following localized variables from `main_original.lua`:

``````{ brush="lua" gutter="true" first-line="52" highlight="[54,55,56,57,58,59,60,61,62,63,64]" }
local objectSheet = graphics.newImageSheet( "gameObjects.png", sheetOptions )

-- Initialize variables
local lives = 3
local score = 0
local died = false

local asteroidsTable = {}

local ship
local gameLoopTimer
local livesText
local scoreText
``````

### Display Groups

In our original version, we created three display groups for sorting and layering our game objects: `backGroup`, `mainGroup` and `uiGroup`. We are still going to use them, but a few small modifications will be necessary since we're using Composer.

In the last chapter, you learned how to insert scene objects into the scene's __view__ group (`sceneGroup`). Now,&nbsp;an important concept to understand is that display groups can actually be inserted into other display groups! As&nbsp;such, we can maintain the three display groups from the original game __and__ instill them into the scene's view group.

To facilitate this, we will defer the actual creation of our three groups until we create the scene. However, we still need to define the variables now using the __forward&nbsp;declaration__ method that you learned about earlier. So, instead of associating each variable with a [display.newGroup()][api.library.display.newGroup], just leave them undefined for the moment:

``````{ brush="lua" gutter="true" first-line="61" highlight="[66,67,68]" }
local ship
local gameLoopTimer
local livesText
local scoreText

local backGroup
local mainGroup
local uiGroup
``````

<div class="guide-notebox">
<div class="notebox-title">Note</div>

In our original version, we created the background, ship, lives text, and score text immediately following initialization of the display groups. Now, because we're only creating local references for the display groups, we must defer these actions until later, inside the `scene:create()` function.

</div>

### Game Functions

As we continue past this point in `main_original.lua`, we come to the local functions which power our game's core functionality. Basically, these can be copied over directly into your `game.lua` file, pasted directly below the variables we just defined.

First, copy over the `updateText()` function:

``````{ brush="lua" gutter="true" first-line="66" highlight="[71,72,73,74]" }
local backGroup
local mainGroup
local uiGroup


local function updateText()
	livesText.text = "Lives: " .. lives
	scoreText.text = "Score: " .. score
end
``````

Follow this with the `createAsteroid()` function:

``````{ brush="lua" gutter="true" first-line="71" highlight="[77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104]" }
local function updateText()
	livesText.text = "Lives: " .. lives
	scoreText.text = "Score: " .. score
end


local function createAsteroid()

	local newAsteroid = display.newImageRect( mainGroup, objectSheet, 1, 102, 85 )
	table.insert( asteroidsTable, newAsteroid )
	physics.addBody( newAsteroid, "dynamic", { radius=40, bounce=0.8 } )
	newAsteroid.myName = "asteroid"

	local whereFrom = math.random( 3 )

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

	newAsteroid:applyTorque( math.random( -6,6 ) )
end
``````

The next function, `fireLaser()`, should follow:

``````{ brush="lua" gutter="true" first-line="103" highlight="[107,108,109,110,111,112,113,114,115,116,117,118,119,120,121]" }
	newAsteroid:applyTorque( math.random( -6,6 ) )
end


local function fireLaser()

	local newLaser = display.newImageRect( mainGroup, objectSheet, 5, 14, 40 )
	physics.addBody( newLaser, "dynamic", { isSensor=true } )
	newLaser.isBullet = true
	newLaser.myName = "laser"

	newLaser.x = ship.x
	newLaser.y = ship.y
	newLaser:toBack()

	transition.to( newLaser, { y=-40, time=500,
		onComplete = function() display.remove( newLaser ) end
	} )
end
``````

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

Now observe the line directly following the `fireLaser()` function in `main_original.lua`:

``````{ brush="lua" first-line="1" highlight="[1]" }
ship:addEventListener( "tap", fireLaser )
``````

This creates the event listener function for `ship`, but we haven't created `ship` yet! Thus, we must defer this command until later, following creation of the actual ship object.

As you copy/paste in the next few functions, skip the commands which immediately follow them. Specifically, __omit&nbsp;the following&nbsp;lines__ when you're copying over code from `main_original.lua` to `game.lua`:

``````{ brush="lua" gutter="true" first-line="136" }
ship:addEventListener( "tap", fireLaser )
``````

``````{ brush="lua" gutter="true" first-line="162" }
ship:addEventListener( "touch", dragShip )
``````

``````{ brush="lua" gutter="true" first-line="185" }
gameLoopTimer = timer.performWithDelay( 500, gameLoop, 0 )
``````

``````{ brush="lua" gutter="true" first-line="250" }
Runtime:addEventListener( "collision", onCollision )
``````

</div>

Essentially, the remainder of your <nobr>scene-accessible</nobr> space should be populated as follows:

``````{ brush="lua" gutter="true" first-line="124" }
local function dragShip( event )

	local ship = event.target
	local phase = event.phase

	if ( "began" == phase ) then
		-- Set touch focus on the ship
		display.currentStage:setFocus( ship )
		-- Store initial offset position
		ship.touchOffsetX = event.x - ship.x

	elseif ( "moved" == phase ) then
		-- Move the ship to the new touch position
		ship.x = event.x - ship.touchOffsetX

	elseif ( "ended" == phase or "cancelled" == phase ) then
		-- Release touch focus on the ship
		display.currentStage:setFocus( nil )
	end

	return true  -- Prevents touch propagation to underlying objects
end


local function gameLoop()

	-- Create new asteroid
	createAsteroid()

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


local function onCollision( event )

	if ( event.phase == "began" ) then

		local obj1 = event.object1
		local obj2 = event.object2

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


-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
``````

Great job! We now have all of the <nobr>scene-accessible</nobr> code copied over. In the next few sections, we'll illustrate how the Composer `scene:` functions tie our game together.




<a id="create"></a>

## Creating the Scene

Now we need to actually __create__ the scene. For the menu scene in the previous chapter, we created the background, title, and two buttons within `scene:create()`. For this scene, we'll create the background, ship, and the two text objects. In addition, we'll pause the physics engine and actually create the three display groups required for layering our game objects.

Let's start with physics. Inside the `scene:create()` function, add the command `physics.pause()` as follows:

``````{ brush="lua" gutter="true" first-line="232" highlight="[242]" }
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create( event )

	local sceneGroup = self.view
	-- Code here runs when the scene is first created but has not yet appeared on screen

	physics.pause()  -- Temporarily pause the physics engine
end
``````
<div class="docs-tip-outer">
<div class="docs-tip-inner-left">
<div class="fa fa-cog"></div>
</div>
<div class="docs-tip-inner-right">

What is the purpose of this command at this point in the scene's life cycle? Remember that our game scene isn't truly on screen at this point and, because we don't want the game to start quite yet, we'll immediately pause the physics engine. This allows us to create objects, assign their physical bodies, and position them, but they won't be affected physically until we <nobr>re-start</nobr> the physics engine.

</div>
</div>

Next we need to create the three display groups for which we previously just defined forward references. Add the following highlighted lines:

``````{ brush="lua" gutter="true" first-line="237" highlight="[244,245,246,247,248,249,250,251,252]" }
function scene:create( event )

	local sceneGroup = self.view
	-- Code here runs when the scene is first created but has not yet appeared on screen

	physics.pause()  -- Temporarily pause the physics engine

	-- Set up display groups
	backGroup = display.newGroup()  -- Display group for the background image
	sceneGroup:insert( backGroup )  -- Insert into the scene's view group

	mainGroup = display.newGroup()  -- Display group for the ship, asteroids, lasers, etc.
	sceneGroup:insert( mainGroup )  -- Insert into the scene's view group

	uiGroup = display.newGroup()    -- Display group for UI objects like the score
	sceneGroup:insert( uiGroup )    -- Insert into the scene's view group
end
``````

Here, in addition to creating the groups, we also __insert__ each group into the Composer scene's __view__ group (`sceneGroup`) using `sceneGroup:insert()`. This is how we instill our original display groups into the scene.

<div class="docs-tip-outer">
<div class="docs-tip-inner-left">
<div class="fa fa-cog"></div>
</div>
<div class="docs-tip-inner-right">

As you recall, most CORONA_CORE_PRODUCT display object APIs accept a valid display group variable as a convenient inline shortcut for inserting the object into that group. However, [display.newGroup()][api.library.display.newGroup] is one of the exceptions to this shortcut&nbsp;&mdash; you can't simply supply an inline group reference to insert the new display group into an existing group. Instead, you must use the `object:insert()` command.

</div>
</div>

With the groups in place, let's create the background:

``````{ brush="lua" gutter="true" first-line="244" highlight="[254,255,256,257]" }
	-- Set up display groups
	backGroup = display.newGroup()  -- Display group for the background image
	sceneGroup:insert( backGroup )  -- Insert into the scene's view group

	mainGroup = display.newGroup()  -- Display group for the ship, asteroids, lasers, etc.
	sceneGroup:insert( mainGroup )  -- Insert into the scene's view group

	uiGroup = display.newGroup()    -- Display group for UI objects like the score
	sceneGroup:insert( uiGroup )    -- Insert into the scene's view group

	-- Load the background
	local background = display.newImageRect( backGroup, "background.png", 800, 1400 )
	background.x = display.contentCenterX
	background.y = display.contentCenterY
end
``````

<div class="guide-notebox">
<div class="notebox-title">Note</div>

If you inspect the scene-accessible code area near the top of `game.lua`, you'll notice that we did __not__ include a forward reference to `background` via <nobr>`local background`</nobr>. This is because, once we create and insert the background object into the scene's view, we'll never need to access it elsewhere in the code. Thus, we simply create it as a `local` object inside the `scene:create()` function.

</div>

Now let's create the ship and both text objects:

``````{ brush="lua" gutter="true" first-line="254" highlight="[259,260,261,262,263,264,265,266,267]" }
	-- Load the background
	local background = display.newImageRect( backGroup, "background.png", 800, 1400 )
	background.x = display.contentCenterX
	background.y = display.contentCenterY

	ship = display.newImageRect( mainGroup, objectSheet, 4, 98, 79 )
	ship.x = display.contentCenterX
	ship.y = display.contentHeight - 100
	physics.addBody( ship, { radius=30, isSensor=true } )
	ship.myName = "ship"

	-- Display lives and score
	livesText = display.newText( uiGroup, "Lives: " .. lives, 200, 80, native.systemFont, 36 )
	scoreText = display.newText( uiGroup, "Score: " .. score, 400, 80, native.systemFont, 36 )
end
``````

<div class="docs-tip-outer docs-tip-color-alert">
<div class="docs-tip-inner-left">
<div class="fa fa-exclamation-circle" style="font-size: 35px;"></div>
</div>
<div class="docs-tip-inner-right">

Unlike the background, we create these three objects using the variable __forward&nbsp;references__&nbsp;&mdash; `ship`, `livesText`, and&nbsp;`scoreText`&nbsp;&mdash; that we included earlier in the <nobr>scene-accessible</nobr> code section. This is because other functions will need to know about these objects as the game runs.

Essentially, you can create a forward reference in the <nobr>scene-accessible</nobr> area, assign an actual object to that reference inside a `scene:` function, and then other functions will associate the reference with the new object.

</div>
</div>

<div class="docs-tip-outer">
<div class="docs-tip-inner-left">
<div class="fa fa-cog"></div>
</div>
<div class="docs-tip-inner-right">

Notice that we are still inserting objects into their proper display groups such as `backGroup`, `mainGroup`, and `uiGroup`. This is the correct procedure because all of those groups were inserted into the scene's __view__ group and they are now children of that parent group.

</div>
</div>

Moving onward &mdash; remember how we deferred adding the ship's `"tap"` and `"touch"` event listeners in the <nobr>scene-accessible</nobr> section because `ship` didn't yet exist as an actual object? Now that the ship __does__ exist, let's add its event listeners:

``````{ brush="lua" gutter="true" first-line="265" highlight="[269,270]" }
	-- Display lives and score
	livesText = display.newText( uiGroup, "Lives: " .. lives, 200, 80, native.systemFont, 36 )
	scoreText = display.newText( uiGroup, "Score: " .. score, 400, 80, native.systemFont, 36 )

	ship:addEventListener( "tap", fireLaser )
	ship:addEventListener( "touch", dragShip )
end
``````

That's it! Our initial scene objects will now be created&nbsp;&mdash; albeit off screen&nbsp;&mdash; immediately before Composer proceeds to the next function in the scene's life cycle, `scene:show()`.




<a id="show"></a>

## Showing the Scene

In the menu scene, we didn't need to use `scene:show()` nor its companion function `scene:hide()`, but in this game scene we do. At this point, there are still some essential aspects which we haven't copied over from `main_original.lua`&nbsp;&mdash; primarily, we have not yet enabled collision detection or started the game loop to spawn asteroids. Fortunately, `scene:show()` can be used to put everything in motion!

### Transition Effects

While we didn't utilize one for the menu scene, the [composer.gotoScene()][api.library.composer.gotoScene] command allows you to specify a __transition&nbsp;effect__ such as fading&nbsp;in, sliding&nbsp;in from a screen edge, <nobr>cross-fading</nobr> from the previous scene, etc. Naturally, there is a __time__ duration associated with the start and finish of scene transitions, and this is where __scene&nbsp;phases__ come into play.

### Scene Phases

An important factor to understand <nobr>(in contrast to `scene:create()`)</nobr> is that Composer calls the `scene:show()` function __twice__. Of course it's imperative to know __when__ each of these calls occurs so that we can take the proper actions at the proper time. This distinction is provided via `event.phase` within `scene:show()`. Basically, `scene:show()` calls/phases work like this:

1. The first call occurs when the scene is ready to be shown, essentially after every command within `scene:create()` has been executed. In this case, `event.phase` is `"will"`, effectively indicating that the scene "will&nbsp;show" and the transition effect is about to occur.

2. The second call occurs immediately __after__ the scene has shown&nbsp;&mdash; basically, when the scene transition has completed. In this case, `event.phase` is `"did"`, meaning the scene "did&nbsp;show" and the transition effect completed.

<div class="docs-tip-outer">
<div class="docs-tip-inner-left">
<div class="fa fa-cog"></div>
</div>
<div class="docs-tip-inner-right">

Notice that the scene template already contains a conditional statement to check for each phase of `scene:show()`:

``````{ brush="lua" first-line="1" highlight="[7,8,10,11]" }
-- show()
function scene:show( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		-- Code here runs when the scene is still off screen (but is about to come on screen)

	elseif ( phase == "did" ) then
		-- Code here runs when the scene is entirely on screen

	end
end
``````

</div>
</div>

Now that you understand this concept, simply paste code from your `main_original.lua` file into the proper conditional clause. For this game, we basically want to start the game running&nbsp;&mdash; spawning asteroids, detecting collisions, etc.&nbsp;&mdash; once the scene is fully on screen <nobr>(the `"did"` phase)</nobr>. So, in your `game.lua` file, within the `scene:show()` function, add the three highlighted commands:

``````{ brush="lua" gutter="true" first-line="274" highlight="[285,286,287]" }
-- show()
function scene:show( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		-- Code here runs when the scene is still off screen (but is about to come on screen)

	elseif ( phase == "did" ) then
		-- Code here runs when the scene is entirely on screen
		physics.start()
		Runtime:addEventListener( "collision", onCollision )
		gameLoopTimer = timer.performWithDelay( 500, gameLoop, 0 )
	end
end
``````

Essentially, these commands accomplish the following:

1. Re-start the physics engine with `physics.start()` (remember&nbsp;that we paused it in&nbsp;`scene:create()`).
2. Start collision detection.
3. Start the game loop with our original [timer.performWithDelay()][api.library.timer.performWithDelay] command.

<div class="docs-tip-outer docs-tip-color-action">
<div class="docs-tip-inner-left">
<div class="fa fa-video-camera" style="font-size: 29px; padding-top: 4px;"></div>
</div>
<div class="docs-tip-inner-right">

Let's check the result of our code! Save your modified `game.lua` file and then relaunch the Simulator. As expected, you'll be presented with the menu screen, but now we can actually proceed. Tap/click the __Play__ button and, assuming you did everything up to this point correctly, Composer should proceed to the `game.lua` scene which plays identically to our original version of the game.

</div>
</div>




<a id="hide"></a>

## Hiding the Scene

At this point there's a significant flaw in the game. When the player runs out of lives, the asteroids will continue to build up and there is no way to restart the game. This means that we need to adapt our `game.lua` code so that Composer exits the scene when the player runs out of lives.

When we intend to exit the game scene, remember that the `gameLoopTimer` timer will still be running, spawning asteroids and removing <nobr>off-screen</nobr> asteroids. In addition, the physics engine will still be moving asteroids about. All of these things should be stopped inside the `scene:hide()` function.

Similar to `scene:show()`, `scene:hide()` will be called __twice__ and the distinction is once again provided via `event.phase`. Basically, `scene:hide()` calls/phases work like this:

1. The first call occurs when the scene is about to be hidden <nobr>(transition off screen)</nobr>. In this case, `event.phase` is `"will"`, effectively indicating that the scene "will&nbsp;hide" and the transition effect is about to occur.

2. The second call occurs immediately __after__ the scene is fully off screen. In this case, `event.phase` is `"did"`, meaning the scene "did&nbsp;hide" and the transition effect completed.

For this scene, in the `"will"` and `"did"` phase conditions of `scene:hide()`, we'll "undo" some things by adding three commands:

``````{ brush="lua" gutter="true" first-line="292" highlight="[300,304,305]" }
-- hide()
function scene:hide( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		-- Code here runs when the scene is on screen (but is about to go off screen)
		timer.cancel( gameLoopTimer )

	elseif ( phase == "did" ) then
		-- Code here runs immediately after the scene goes entirely off screen
		Runtime:removeEventListener( "collision", onCollision )
		physics.pause()
	end
end
``````

These commands essentially reverse what we did in the `scene:show()` function:

1. Stop the game loop by canceling the timer associated with `gameLoopTimer`.
2. Stop collision detection by removing the runtime event listener.
3. Pause the physics engine with `physics.pause()`.

<div class="docs-tip-outer">
<div class="docs-tip-inner-left">
<div class="fa fa-cog"></div>
</div>
<div class="docs-tip-inner-right">

Note how we're intentionally using __both__ phases of `scene:hide()`. The first command can occur before the scene begins to hide <nobr>(`phase == "will"`)</nobr> since we don't need to generate new asteroids once the game is over. For the other two commands, we defer them until after the scene is fully off screen because we don't want the remaining asteroids to suddenly stop detecting collisions or stop moving (`physics.pause()`) when the scene transition begins.

</div>
</div>

### Event Link-Up

Our `scene:hide()` function is now complete, but we need to take a few final steps to make sure it actually gets called. Logically, a scene will never be hidden unless you intentionally cause it to hide, and this occurs when you tell Composer to go to a different scene (`composer.gotoScene()`).

In our game, we want to return to the menu&nbsp;&mdash; or eventually go to the high scores scene&nbsp;&mdash; when the player dies and has no remaining lives. This condition has already been accounted for partially in our previous code, so all we need to add is an additional command in the same place.

In `game.lua`, find your `onCollision` function and, toward its end, locate this conditional block:

``````{ brush="lua" gutter="true" first-line="216" highlight="[220,221,222,223,224,225]" }
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

Now, directly below the <nobr>`display.remove( ship )`</nobr> command, add the following highlighted command:

``````{ brush="lua" gutter="true" first-line="220" highlight="[222]" }
				if ( lives == 0 ) then
					display.remove( ship )
					timer.performWithDelay( 2000, endGame )
				else
					ship.alpha = 0
					timer.performWithDelay( 1000, restoreShip )
				end
			end
		end
	end
end
``````

The [timer.performWithDelay()][api.library.timer.performWithDelay] command is nothing new&nbsp;&mdash; this instance simply calls a function `endGame()` after 2000&nbsp;milliseconds (2&nbsp;seconds). Of course, we haven't actually written the `endGame()` function yet, so let's write it now. Directly __above__ your `onCollision()` function, add this new function:

``````{ brush="lua" gutter="true" first-line="185" highlight="[185,186,187]" }
local function endGame()
	composer.gotoScene( "menu", { time=800, effect="crossFade" } )
end


local function onCollision( event )

	if ( event.phase == "began" ) then
``````

For now, this function simply returns to the menu by calling [composer.gotoScene()][api.library.composer.gotoScene].

<div class="docs-tip-outer">
<div class="docs-tip-inner-left">
<div class="fa fa-cog"></div>
</div>
<div class="docs-tip-inner-right">

This time we're including an additional, optional table containing parameters for a scene transition effect. Inside this table, we specify an effect duration (`time`) of 800&nbsp;milliseconds and an `effect` property of `"crossFade"`. This <nobr>built-in</nobr> Composer effect will cause the game scene to fade out while, concurrently, the menu scene fades in.

</div>
</div>




<a id="cleanup"></a>

## Scene Cleanup

Hopefully players will want to play the game again! By default, Composer caches scenes in memory to save processing power when the scene is revisited. So, even though it's hidden at this point, your game scene remains basically as you left it. If you play the game again, the scene comes back into view and new asteroids begin spawning. Unfortunately, there are some problems:

* The asteroids from the previous game are still in the scene.
* Your previous score still appears and lives remain at zero.
* The ship isn't showing!

Depending on the game, cleaning up a scene to restart fresh can involve some effort. In this game, we would need to "undo" some things we did in `scene:create()` as well as remove the references to old asteroids contained in the `asteroidsTable` table. We would also need to reset `score`, `lives`, and the ship's visibility within `scene:show()`. None of this is exceptionally complicated, but wouldn't it be convenient to have an easier way to reset a scene? Fortunately, Composer offers one:

``````{ brush="lua" first-line="1" highlight="[1]" }
composer.removeScene( "game" )
``````

Essentially, this command removes and destroys the `game.lua` scene as if it never existed. By doing so, you lose the caching benefit mentioned above, but for most scenes it's not worth the effort to programmatically reset each aspect individually.

With this simplified approach, let's modify our `scene:hide()` function:

``````{ brush="lua" gutter="true" first-line="298" highlight="[312]" }
-- hide()
function scene:hide( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		-- Code here runs when the scene is on screen (but is about to go off screen)
		timer.cancel( gameLoopTimer )

	elseif ( phase == "did" ) then
		-- Code here runs immediately after the scene goes entirely off screen
		Runtime:removeEventListener( "collision", onCollision )
		physics.pause()
		composer.removeScene( "game" )
	end
end
``````

This addition shoud be clear&nbsp;&mdash; we simply call <nobr>`composer.removeScene( "game" )`</nobr> within the `"did"` phase of `scene:hide()`, effectively destroying the scene after it transitions fully off screen.

<div class="docs-tip-outer docs-tip-color-action">
<div class="docs-tip-inner-left">
<div class="fa fa-video-camera" style="font-size: 29px; padding-top: 4px;"></div>
</div>
<div class="docs-tip-inner-right">

Time to test our changes! Save your modified `game.lua` file and then relaunch the Simulator. Now you should be able to play the game repeatedly and get a clean reset each time.

</div>
</div>

<div class="docs-tip-outer" style="background-color: #ffa752;">
<div class="docs-tip-inner-left">
<div class="fa fa-check-square" style="font-size: 34px; padding-left: 1px; padding-top: 4px;"></div>
</div>
<div class="docs-tip-inner-right">

This chapter was a bit more detailed and required many things to be copied over to very specific places within `game.lua`. If your code isn't working as expected, please compare it to the `game.lua` file bundled with this chapter's [source files](https://github.com/coronalabs/GettingStarted05/archive/master.zip).

</div>
</div>




<div class="float-right" style="max-width: 140px; margin-top: 36px; margin-bottom: 16px; clear: both;">

![][images.simulator.pastel-rocket]

</div>

<a id="extracredit"></a>

## Extra Credit

Earlier in this chapter, you learned about scene __transition&nbsp;effects__. We already applied one to the `composer.gotoScene()` command within the `endGame()` function, so now let's apply one when the game scene comes into view.

If you recall, the game scene is only accessed via the __Play__ button in the menu scene, so we'll modify that file:

1. Open the `menu.lua` file within your `StarExplorer` folder.

2. Find the `gotoGame()` function and add a `"crossFade"` effect with a duration of 800 milliseconds to the [composer.gotoScene()][api.library.composer.gotoScene] command:

<div class="code-indent">

``````{ brush="lua" gutter="true" first-line="11" highlight="[12]" }
local function gotoGame()
	composer.gotoScene( "game", { time=800, effect="crossFade" } )
end
``````

</div>

3. Although we haven't yet created it, the `highscores.lua` scene should also appear with a transition effect. Since `menu.lua` is already open, modify the [composer.gotoScene()][api.library.composer.gotoScene] command within the `gotoHighScores()` function immediately following `gotoGame()`:

<div class="code-indent">

``````{ brush="lua" gutter="true" first-line="11" highlight="[16]" }
local function gotoGame()
	composer.gotoScene( "game", { time=800, effect="crossFade" } )
end

local function gotoHighScores()
	composer.gotoScene( "highscores", { time=800, effect="crossFade" } )
end
``````

</div>

4. Save your modified `menu.lua` file.

Great! Now the game scene&nbsp;&mdash; and the high scores scene, once we create it&nbsp;&mdash; will transition in/out with a nice <nobr>cross-fade</nobr> effect.




<a id="concepts"></a>

## Chapter Concepts

Here's a summary of the concepts we covered in this chapter:

<div class="inner-table">

Command/Property																Description
------------------------------------------------------------------------------	-----------------------------------------
[physics.pause()][api.library.physics.pause]									Pauses the physics engine.
[object:insert()][api.type.GroupObject.insert]									Inserts an object into a group.
[timer.cancel()][api.library.timer.cancel]										Cancels a timer operation initiated with [timer.performWithDelay()][api.library.timer.performWithDelay].
[object:removeEventListener()][api.type.EventDispatcher.removeEventListener]	Removes an event listener from an object.
[composer.removeScene()][api.library.composer.removeScene]						Removes a specific Composer scene.
------------------------------------------------------------------------------	-----------------------------------------

</div>


##

<div class="walkthrough-nav">

__&lang;__ [Chapter 4 &mdash; Creating Scenes][guide.programming.04] _|_ [Chapter 6 &mdash; Implementing High Scores][guide.programming.06] __&rang;__

</div>
