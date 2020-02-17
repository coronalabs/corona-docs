# Chapter 7 &mdash; Sounds and Music


<div class="walkthrough-nav">
<div class="walkthrough-nav-upper-right">

__&lang;__ [Previous][guide.programming.06] _|_ [Next][guide.programming.08] __&rang;__

</div>
</div>

Sound effects and background music are an important part of the gameplay experience. Proper use of these components can turn a boring game into a riveting adventure!

<div class="guides-toc">

* [Preloading and Streaming](#methods)
* [Adding Sound Effects](#sounds)
* [Adding Background Music](#music)
* [Disposing Audio](#disposing)
* [Extra Credit](#extracredit)
* [Chapter Concepts](#concepts)

</div>


<a id="methods"></a>

## Preloading and Streaming

There are two ways to load audio in your Corona app. Which one you use typically depends on how the audio file will be utilized.

### Preloading

The first method is to use the `audio.loadSound()` command. This loads and <nobr>pre-processes</nobr> the entire audio file, after which it can be played on demand. For&nbsp;instance:

``````lua
local explosionSound = audio.loadSound( "explosion.wav" )
``````

Once loaded, the sound can be played as many times as needed using the `audio.play()` command along with the audio __handle__ you created via `audio.loadSound()`.

<div class="docs-tip-outer docs-tip-color-alert">
<div class="docs-tip-inner-left">
<div class="fa fa-exclamation-circle" style="font-size: 35px;"></div>
</div>
<div class="docs-tip-inner-right">

This is a crucial aspect to understand&nbsp;&mdash; you do __not__ play an audio file by directly specifying the file name. Instead, specify the __handle__ variable assigned to `audio.loadSound()`.

</div>
</div>

For example, if our game has four objects explode simultaneously and each requires the `explosion.wav` sound to be played, we could issue these commands:

``````lua
audio.play( explosionSound )
audio.play( explosionSound )
audio.play( explosionSound )
audio.play( explosionSound )
``````

In other words, there is no need to preload the same audio file multiple times with `audio.loadSound()`&nbsp;&mdash; using the commands above, the `explosion.wav` sound will play four times and, by&nbsp;default, each instance will be assigned to a distinct audio __channel__. Then, once each instance has finished playing, the audio system will release/clear its channel so that another sound can be played upon it.

<div class="docs-tip-outer">
<div class="docs-tip-inner-left">
<div class="fa fa-cog"></div>
</div>
<div class="docs-tip-inner-right">

The `audio.loadSound()` method is very convenient, but if you load large audio files or a considerable number of audio files at the same time, there may be a noticeable pause/skip as they load. Thus, if you need to load a large audio file such as a background music track, it's usually better to use the __streaming__ method discussed in the next section.

</div>
</div>

### Streaming

The second method to load audio into your app is `audio.loadStream()`. This will gradually load and process small chunks of the audio file as needed. This command is best used in situations where possible latency will not have a critical impact upon the usability of the app. Streaming does not use as much memory, so it's usually the best choice for large audio files such as background music.

``````lua
local backgroundMusic = audio.loadStream( "musicTrack1.wav" )
``````

<div class="guide-notebox">
<div class="notebox-title">Note</div>

Unlike `audio.loadSound()`, audio files loaded with `audio.loadStream()` can only be played on one channel at a time. If you need the same audio file to stream on multiple channels, you'll need to load two distinct audio handles, for&nbsp;instance:

``````lua
local backgroundMusic1 = audio.loadStream( "musicTrack1.wav" )
local backgroundMusic2 = audio.loadStream( "musicTrack1.wav" )
``````

</div>




<a id="sounds"></a>

## Adding Sound Effects

### Including Audio Files

Let's add sound effects to our game! To begin, you'll need to download the sample audio files, courtesy of <a href="http://www.soundimage.org" target="_new">Eric Matyas</a>. Within the `audio` subfolder of this chapter's [source files](https://github.com/coronalabs/GettingStarted07/archive/master.zip), you'll find the following audio files:

<div class="inner-table">

File								Usage
----------------------------------	----------------------------------------------
`Escape_Looping.wav`				Music for the menu scene.
`explosion.wav`						Sound effect when an asteroid is hit.
`fire.wav`							Sound effect when the ship fires a laser.
`80s-Space-Game_Looping.wav`		Main soundtrack for the gameplay.
`Midnight-Crawlers_Looping.wav`		Music for the high scores scene.
----------------------------------	----------------------------------------------

</div>

<div class="docs-tip-outer">
<div class="docs-tip-inner-left">
<div class="fa fa-cog"></div>
</div>
<div class="docs-tip-inner-right">

For this project, copy the entire `audio` subfolder and all of its contents into your `StarExplorer` project folder. If you're planning to use several audio files in a game, it's helpful to keep them organized in a subfolder.

</div>
</div>

### Loading Sounds

First, we need to load the sounds. Since our sound effects are only going to occur during gameplay, we can load them in `game.lua`:

1. First, in the <nobr>scene-accessible</nobr> code area where you've already <nobr>pre-declared</nobr> some variables, add the following forward references:

<div class="code-indent">

``````{ brush="lua" gutter="true" first-line="66" highlight="[70,71]" }
local backGroup
local mainGroup
local uiGroup

local explosionSound
local fireSound


local function updateText()
	livesText.text = "Lives: " .. lives
	scoreText.text = "Score: " .. score
end
``````

</div>

2. Next, locate the `scene:create()` function and, directly before its `end` line, add the following highlighted commands:

<div class="code-indent">

``````{ brush="lua" gutter="true" first-line="279" highlight="[282,283]" }
	ship:addEventListener( "tap", fireLaser )
	ship:addEventListener( "touch", dragShip )

	explosionSound = audio.loadSound( "audio/explosion.wav" )
	fireSound = audio.loadSound( "audio/fire.wav" )
end
``````

</div>

Now, when the scene first loads, the sound files will be loaded into the variable handles `explosionSound` and `fireSound`.

<div class="docs-tip-outer">
<div class="docs-tip-inner-left">
<div class="fa fa-cog"></div>
</div>
<div class="docs-tip-inner-right">

Notice that instead of specifying just the file name, we append it with `audio/` because our audio files are located inside the `audio` subfolder.

</div>
</div>

### Playing Sounds

With the sounds loaded, we can now play them with `audio.play()` whenever they're needed:

1. The explosion sound should play whenever a laser hits an asteroid. That event is detected in the `onCollision()` function, so let's add an `audio.play()` command in the first conditional block, directly following the `display.remove()` commands that remove the laser and asteroid:

<div class="code-indent">

``````{ brush="lua" gutter="true" first-line="194" highlight="[208,209]" }
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

			-- Play explosion sound!
			audio.play( explosionSound )

			for i = #asteroidsTable, 1, -1 do
				if ( asteroidsTable[i] == obj1 or asteroidsTable[i] == obj2 ) then
					table.remove( asteroidsTable, i )
					break
				end
			end
``````

</div>

2. The explosion sound should also play whenever an asteroid hits the ship. That event is detected by the second conditional clause of the `onCollision()` function, so let's add an `audio.play()` command directly after the <nobr>`died = true`</nobr> command:

<div class="code-indent">

``````{ brush="lua" gutter="true" first-line="222" highlight="[228,229]" }
		elseif ( ( obj1.myName == "ship" and obj2.myName == "asteroid" ) or
				 ( obj1.myName == "asteroid" and obj2.myName == "ship" ) )
		then
			if ( died == false ) then
				died = true

				-- Play explosion sound!
				audio.play( explosionSound )

				-- Update lives
				lives = lives - 1
				livesText.text = "Lives: " .. lives

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

</div>

3. Finally, let's add the sound effect for firing lasers. At the beginning of the `fireLaser()` function, add another `audio.play()` command:

<div class="code-indent">

``````{ brush="lua" gutter="true" first-line="110" highlight="[112,113]" }
local function fireLaser()

	-- Play fire sound!
	audio.play( fireSound )

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

</div>

4. Save your modified `game.lua` file.




<a id="music"></a>

## Adding Background Music

To enhance the game further, let's add background music. In the overall span of our game, there are three scenes. We could play the same music for each scene, but it's better to play different audio tracks in each scene and set the tone for the action. For instance, in the menu scene, a more passive track can play, but when we get to the game scene where the action gets intense, it helps to have a <nobr>faster-paced</nobr> audio track. Finally, when the game is over, you may want something more solemn.

### Loading Music

As discussed above, background music files tend to be large, so it's best to use `audio.loadStream()`. Let's use an approach similar to the sound effects:

1. In the <nobr>scene-accessible</nobr> code area of `game.lua` where you've already declared the two forward references for sounds, add a forward reference for the music track:

<div class="code-indent">

``````{ brush="lua" gutter="true" first-line="70" highlight="[72]" }
local explosionSound
local fireSound
local musicTrack
``````

</div>

2. Now, near the end of the `scene:create()` function where you called `audio.loadSound()` to load both sound effects, add an `audio.loadStream()` command to begin streaming the music on the `musicTrack` variable you just declared:

<div class="code-indent">

``````{ brush="lua" gutter="true" first-line="292" highlight="[294]" }
	explosionSound = audio.loadSound( "audio/explosion.wav" )
	fireSound = audio.loadSound( "audio/fire.wav" )
	musicTrack = audio.loadStream( "audio/80s-Space-Game_Looping.wav")
end
``````

</div>

### Playing Music

Now it's time to play the music! This time we're going to step deeper into audio setup with __channel&nbsp;management__. Basically, for our sound effects, we simply let the audio library pick a free channel on which to play any new sound instance. For music however, it's often useful to __reserve__ a specific channel and play all of the background music on that channel&nbsp;&mdash; after&nbsp;all, it's unlikely that you'll want to have multiple music files playing at the same time, overlapping and audibly conflicting with each other. By reserving one dedicated channel for music, we can use it for all of the background music throughout the game.

To accomplish this, we need to provide a bit more information to our `audio.play()` command for the music, and also do a little extra work in preparation for using a dedicated channel.

1. First, to reserve a channel for music throughout the game, let's add a simple command to the `main.lua` file. Open that file in your chosen editor and, before the <nobr>`composer.gotoScene( "menu" )`</nobr> command, add the following:

<div class="code-indent">

``````{ brush="lua" gutter="true" first-line="7" highlight="[15,16]" }
local composer = require( "composer" )

-- Hide status bar
display.setStatusBar( display.HiddenStatusBar )

-- Seed the random number generator
math.randomseed( os.time() )

-- Reserve channel 1 for background music
audio.reserveChannels( 1 )
``````

Basically, the <nobr>`audio.reserveChannels( 1 )`</nobr> command tells the Corona audio library to reserve channel `1`. While reserved, no audio file will play on the channel unless we explicitly command it to.

</div>

2. Next, let's reduce the overall volume of channel `1`. This is sometimes necessary when you obtain audio files from <nobr>third-party</nobr> sources where you didn't have any control of the sample volume. It can also be useful to control channel volume if you want to eventually build in functionality that lets the user control the volume level of the game music, or even mute it completely.

<div class="code-indent">

Below the lines you just added, include the following:

``````{ brush="lua" gutter="true" first-line="15" highlight="[17,18]" }
-- Reserve channel 1 for background music
audio.reserveChannels( 1 )
-- Reduce the overall volume of the channel
audio.setVolume( 0.5, { channel=1 } )
``````

This essentially tells the audio system to play back any audio file on channel `1` at <nobr>50% volume (`0.5`)</nobr>. You may want to adjust this in your game if you feel the music is either too loud or too quiet in relation to the sound effects.

</div>

3. Now, save `main.lua` and return to `game.lua` in your editor. We will begin playing the music when the scene comes fully on screen, so in the `"did"` phase condition of the `scene:show()` function, add the following lines:

<div class="code-indent">

``````{ brush="lua" gutter="true" first-line="298" highlight="[312,313]" }
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
		-- Start the music!
		audio.play( musicTrack, { channel=1, loops=-1 } )
	end
end
``````

This `audio.play()` command simply starts playing the music. It's similar to how we play the sound effects except that it includes a Lua table as the second argument containing options for the command. Specifically, `channel=1` instructs the audio library to explicitly play the music on channel `1` and <nobr>`loops=-1`</nobr> tells the audio system to repeat (loop) the file indefinitely.

</div>

<div class="docs-tip-outer docs-tip-color-action">
<div class="docs-tip-inner-left">
<div class="fa fa-video-camera" style="font-size: 29px; padding-top: 4px;"></div>
</div>
<div class="docs-tip-inner-right">

These additions should get music playing in your app. Make sure that you save your modified `main.lua` and `game.lua` files and then relaunch the Simulator. Play a game and you should now hear a looping music track in addition to the sound effects.

</div>
</div>

### Stopping Music

Unlike sound effects which are typically short and get cleared from their channel upon completion, streaming music should usually be stopped at an appropriate time when you're about to leave the scene. This can be easily handled in the `"did"` phase condition of the `scene:hide()` function. Locate this block within `game.lua` and add the <nobr>`audio.stop( 1 )`</nobr> command:

``````{ brush="lua" gutter="true" first-line="318" highlight="[332,333]" }
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
		-- Stop the music!
		audio.stop( 1 )
		composer.removeScene( "game" )
	end
end
``````

That's it! When the scene goes fully off screen, the music playing on channel `1` will stop, clearing the way for a different music track to play on the channel in the next scene.




<a id="disposing"></a>

## Disposing Audio

Whether preloaded or streaming, audio takes up memory and it's a resource that is __not__ automatically managed or cleaned up by Composer. As a result, there's one final important step in this chapter:&nbsp;__disposing&nbsp;audio__. This is where the `scene:destroy()` function comes in handy, since it gets triggered as a result of calling [composer.removeScene()][api.library.composer.removeScene] or when Composer itself destroys the scene.

In your `game.lua` file, locate the `scene:destroy()` function near the bottom. Within it, add three `audio.dispose()` commands as shown here:

``````{ brush="lua" gutter="true" first-line="339" highlight="[344,345,346,347]" }
-- destroy()
function scene:destroy( event )

	local sceneGroup = self.view
	-- Code here runs prior to the removal of scene's view
	-- Dispose audio!
	audio.dispose( explosionSound )
	audio.dispose( fireSound )
	audio.dispose( musicTrack )
end
``````

Using these commands, we effectively release the memory taken up by the audio file. 

<div class="docs-tip-outer docs-tip-color-alert">
<div class="docs-tip-inner-left">
<div class="fa fa-exclamation-circle" style="font-size: 35px;"></div>
</div>
<div class="docs-tip-inner-right">

Similar to `audio.play()`, notice that we supply an audio __handle__ to the `audio.dispose()` command, for example `explosionSound`. You should __not__ attempt to dispose audio by simply indicating an audio file name.

</div>
</div>




<div class="float-right" style="max-width: 140px; margin-top: 36px; margin-bottom: 16px; clear: both;">

![][images.simulator.pastel-rocket]

</div>

<a id="extracredit"></a>

## Extra Credit

Although we've done it for you in this chapter's [source files](https://github.com/coronalabs/GettingStarted07/archive/master.zip), challenge yourself to implement music inside the other two scenes, using the same audio techniques and scene event concepts that you learned above!

<div class="inner-table">

Scene				Music File
------------------	----------------------------------
`menu.lua`			`Escape_Looping.wav`
`highscores.lua`	`Midnight-Crawlers_Looping.wav`
------------------	----------------------------------

</div>




<a id="concepts"></a>

## Chapter Concepts

We've covered several concepts in this chapter, all related to audio:

<div class="inner-table">

Command/Property													Description
------------------------------------------------------------------	-----------------------------------------
[audio.loadSound()][api.library.audio.loadSound]					Loads an entire file completely into memory and returns a reference to the audio data.
[audio.loadStream()][api.library.audio.loadStream]					Loads (opens) a file to be read as streaming audio.
[audio.reserveChannels()][api.library.audio.reserveChannels]		Reserves a certain number of channels so they won't be automatically assigned to play on.
[audio.setVolume()][api.library.audio.setVolume]					Sets the volume either for a specific channel, or sets the master volume.
[audio.play()][api.library.audio.play]								Plays the audio specified by the audio handle on a channel.
[audio.stop()][api.library.audio.stop]								Stops playback on a channel <nobr>(or all channels)</nobr> and clears the channel(s) so they can be played on again.
[audio.dispose()][api.library.audio.dispose]						Releases audio memory associated with a handle.
------------------------------------------------------------------	-----------------------------------------

</div>


##

<div class="walkthrough-nav">

__&lang;__ [Chapter 6 &mdash; Implementing High Scores][guide.programming.06] _|_ [Chapter 8 &mdash; Deployment][guide.programming.08] __&rang;__

</div>
