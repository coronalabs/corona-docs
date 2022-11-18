# Chapter 4 &mdash; Creating Scenes


<div class="walkthrough-nav">
<div class="walkthrough-nav-upper-right">

__&lang;__ [Previous][guide.programming.03] _|_ [Next][guide.programming.05] __&rang;__

</div>
</div>


Just as movies, television shows, and plays are organized into scenes for the telling of a story, apps are similarly arranged. In&nbsp;this chapter, you'll learn the basics of __scene&nbsp;management__ in CORONA_CORE_PRODUCT.

<div class="guides-toc">

* [Game Flow](#scenes)
* [Scene Management](#composer)
* [Menu Scene](#menu)
* [Chapter Concepts](#concepts)

</div>


<a id="scenes"></a>

## Game Flow

 A __scene__ is an isolated view or "page" of the app and everything that the player sees is contained in that scene. When an app starts, you're usually presented with a title/intro scene. From there, you may be able to navigate to a settings scene or proceed to a tutorial. Each level in a game might also be a dedicated scene, depending on the design goals.

This game will have three core scenes:

<div class="float-right" style="max-width: 240px; clear: left;">

![][images.docs.sbs-scene-diagram]

</div>

1. __Menu__ &mdash; Title/intro scene containing various options.
2. __Game__ &mdash; The actual game scene.
3. __High&nbsp;Scores__	&mdash; A list of high scores.




<a id="composer"></a>

## Scene Management

CORONA_CORE_PRODUCT uses a system called __Composer__ to handle moving from scene to scene. To make development easier, each Composer scene is a separate Lua file&nbsp;&mdash; this helps keep your game more organized.

<div class="docs-tip-outer docs-tip-color-alert">
<div class="docs-tip-inner-left">
<div class="fa fa-exclamation-circle" style="font-size: 35px;"></div>
</div>
<div class="docs-tip-inner-right">

In this chapter, we're going to make changes to your previous code that will __temporarily__ create errors in the Simulator. For now, you can either ignore the errors or exit the Simulator until you're ready to see the results.

</div>
</div>

Let's modify the existing project to use Composer:

1. Within your project folder, make a __copy__ of the `main.lua` file and rename it to `main_original.lua`. We&nbsp;will need this original code in the next chapter, so it's important to keep a copy for reference.

2. Using your chosen text editor, open the `main.lua` file (not&nbsp;the&nbsp;copy). In this file, erase __all__ of your previous code&nbsp;&mdash; remember, you still have the copy to work with later.

3. In its place, add the following commands:

<div class="code-indent">

``````{ brush="lua" gutter="true" first-line="7" }
local composer = require( "composer" )

-- Hide status bar
display.setStatusBar( display.HiddenStatusBar )

-- Seed the random number generator
math.randomseed( os.time() )

-- Go to the menu screen
composer.gotoScene( "menu" )
``````

</div>

Let's inspect these commands in a little more detail:

* The first line, <nobr>`local composer = require( "composer" )`</nobr>, creates a local variable called `composer`, and the `require()` command tells CORONA_CORE_PRODUCT to load all of the information about the Composer scene management library into the app.

* The next command hides the status bar at the top of the device. Although you included this line in the previous chapter's code, it's logical to hide the status bar within `main.lua` of any <nobr>Composer-enabled</nobr> app so that it never appears in any scene.

* Next, we set the "seed" for the <nobr>pseudo-random</nobr> number generator (recall&nbsp;that this command was included in our original&nbsp;project). Essentially, if you're using [math.random()][api.library.math.random] anywhere in an app, it's a good idea to call [math.randomseed()][api.library.math.randomseed] inside `main.lua` so that the seed is reset each and every time the app runs.

* Just one more command and we're finished with `main.lua`. The <nobr>`composer.gotoScene( "menu" )`</nobr> command takes advantage of the first line where we loaded Composer into the app. By doing so, we can now use this `composer.gotoScene()` command to tell CORONA_CORE_PRODUCT to load a different scene. As mentioned earlier, each of our scenes will be contained in their own Lua files: `menu.lua`, `game.lua`, and `highscores.lua`.

<div class="code-indent">
<div class="docs-tip-outer">
<div class="docs-tip-inner-left">
<div class="fa fa-cog"></div>
</div>
<div class="docs-tip-inner-right">

For this command, you don't need to include `.lua` in the quotation marks because CORONA_CORE_PRODUCT already expects the file to have the `.lua` extension. Thus, you can simply use `"menu"` to go to the scene that will be contained in `menu.lua`.

``````lua
composer.gotoScene( "menu" )
``````

</div>
</div>
</div>

That's it for `main.lua` &mdash; remember to save your changes! Unlike the previous project, this `main.lua` file is very short because we're only using it to initialize Composer, hide the status bar, seed the random number generator, and move to the menu scene where the action starts.




<a id="menu"></a>

## Menu Scene

It's time to create our first scene! The menu scene will consist of a background, title image, and two text objects which will behave as buttons.

<div class="docs-tip-outer" style="background-color: #ffa752;">
<div class="docs-tip-inner-left">
<div class="fa fa-check-square" style="font-size: 34px; padding-left: 1px; padding-top: 4px;"></div>
</div>
<div class="docs-tip-inner-right">

When using Composer for scene management, we suggest that you begin with our standard __scene&nbsp;template__ <nobr>(`scene-template.lua`)</nobr>, included with this chapter's [source files](https://github.com/coronalabs/GettingStarted04/archive/master.zip). Please obtain this template file before you proceed further.

</div>
</div>

### Including Images

For this scene, you'll need to copy or create one additional image file and place it within your `StarExplorer` project folder. The default image is available for download as part of this chapter's [source files](https://github.com/coronalabs/GettingStarted04/archive/master.zip).

<div class="inner-table">

File					Size (w&times;h)	Usage
----------------------	------------------	--------------------------------------------------
`title.png`				500 &times; 80		The game title image; will overlay our existing stars background.
----------------------	------------------	--------------------------------------------------

</div>

### Scene Setup

Once you have the <nobr>`scene-template.lua`</nobr> file, make a copy of it. Rename this __copy__ to `menu.lua` and place it inside your `StarExplorer` project folder. Using your text editor, open this `menu.lua` file and briefly inspect it. It may look overwhelming, but don't worry, we'll step through it together.

To begin, inspect these initial two commands:

``````{ brush="lua" gutter="true" first-line="2" highlight="[2,4]" }
local composer = require( "composer" )

local scene = composer.newScene()
``````

The first line, <nobr>`local composer = require( "composer" )`</nobr>, tells CORONA_CORE_PRODUCT to utilize the Composer library in this Lua file. This line must be included in every Composer scene.

The second line, <nobr>`local scene = composer.newScene()`</nobr>, essentially creates a new variable named `scene` that holds a Composer scene object. This variable (`scene`) will become important later in the file, as you'll see shortly.

### Accessible Code

Next, you'll see a comment block talking about the execution of __scene&nbsp;event&nbsp;functions__, followed by a few blank lines. This is where you should usually write your functions which pertain to scene behavior, declare variables which the scene must have persistent access&nbsp;to,&nbsp;etc. Don't worry too much about this now&nbsp;&mdash; you'll learn how it all works as we go along.

For this menu screen, we only need two simple functions:

1. The `gotoGame()` function which tells Composer to move to the game scene (we'll&nbsp;create this scene in the next&nbsp;chapter).
2. The `gotoHighScores()` function that will show the high scores scene (we'll&nbsp;create this scene in a later&nbsp;chapter).

Let's write these functions in this <nobr>scene-accessible</nobr> space:

``````{ brush="lua" gutter="true" first-line="6" highlight="[11,12,13,15,16,17]" }
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------

local function gotoGame()
	composer.gotoScene( "game" )
end

local function gotoHighScores()
	composer.gotoScene( "highscores" )
end
``````

These functions are about as basic as they come&nbsp;&mdash; each contains just one command, <nobr>`composer.gotoScene()`</nobr> , which you'll recognize from earlier as the Composer command to change scenes.

### Scene Events

Following this, you'll see a section reserved for __scene&nbsp;event&nbsp;functions__. Composer scenes can utilize four (4) life cycle events, each triggered at different points in the scene's life:

<div class="inner-table">

Scene Event				Life Cycle Point
----------------------	------------------------------------------------------
__create__				Occurs when the scene is first created but has not yet appeared on screen.
__show__				Occurs twice, immediately before and immediately after the scene appears on screen.
__hide__				Occurs twice, immediately before and immediately after the scene exits the screen.
__destroy__				Occurs if the scene is destroyed.
----------------------	------------------------------------------------------

</div>

Our standard template can handle all four events, but the __create__ event is what we'll focus on in this scene. A bit further down in the file, inspect the following highlighted code:

``````{ brush="lua" gutter="true" first-line="20" highlight="[25,26,27,28,29,30]" }
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create( event )

	local sceneGroup = self.view
	-- Code here runs when the scene is first created but has not yet appeared on screen

end
``````

As you recall, the keyword `function` tells CORONA_CORE_PRODUCT that this block of code is a function. However, this declaration varies slightly&nbsp;&mdash; instead of prefacing `function` with the `local` keyword, we use the Lua __object&nbsp;method__ discussed in the first chapter to associate this function with the `scene` variable created near the top of the file <nobr>(`local scene = composer.newScene()`)</nobr>.

Essentially, <nobr>`:create( event )`</nobr> indicates that this function will be associated with the Composer __create__ scene event and that a table of data that we reference with `event` will be passed to the function.

### Scene Creation

The `scene:create()` function is already set up for you, but it doesn't really do anything yet. Let's start modifying it to create the actual scene.

First, inspect the initial line already inside the function, `local sceneGroup = self.view`:

``````{ brush="lua" gutter="true" first-line="25" highlight="[27]" }
function scene:create( event )

	local sceneGroup = self.view
	-- Code here runs when the scene is first created but has not yet appeared on screen

end
``````

<div class="docs-tip-outer docs-tip-color-alert">
<div class="docs-tip-inner-left">
<div class="fa fa-exclamation-circle" style="font-size: 35px;"></div>
</div>
<div class="docs-tip-inner-right">

This important line creates a local reference to the scene's __view__ group, automatically created by Composer, which should contain all of the display objects used in the scene. Essentially, any display object which should be part of the scene __must__ be inserted into the scene's view group, and that group is referenced by `sceneGroup` inside each of the template's default `scene:` functions.

</div>
</div>

Following the <nobr>`local sceneGroup = self.view`</nobr> command, enter the following highlighted lines to add a background image to the scene. For this project, we'll simply use the same background image (`background.png`) that we used for the actual game in the previous chapter, although you're free to use a different image.

``````{ brush="lua" gutter="true" first-line="25" highlight="[30,31,32]" }
function scene:create( event )

	local sceneGroup = self.view
	-- Code here runs when the scene is first created but has not yet appeared on screen

	local background = display.newImageRect( sceneGroup, "background.png", 800, 1400 )
	background.x = display.contentCenterX
	background.y = display.contentCenterY
end
``````

<div class="docs-tip-outer">
<div class="docs-tip-inner-left">
<div class="fa fa-cog"></div>
</div>
<div class="docs-tip-inner-right">

Pertaining directly to the important note above, we insert this background image into `sceneGroup` so that it will be automatically managed by Composer as part of this scene.

</div>
</div>

Next, let's add the title image to the scene with these commands:

``````{ brush="lua" gutter="true" first-line="30" highlight="[34,35,36]" }
	local background = display.newImageRect( sceneGroup, "background.png", 800, 1400 )
	background.x = display.contentCenterX
	background.y = display.contentCenterY

	local title = display.newImageRect( sceneGroup, "title.png", 500, 80 )
	title.x = display.contentCenterX
	title.y = 200
end
``````

Finally, let's create two objects which will become menu choices for the player. One will prompt the player to start the game and the other will load the high scores scene. For simplicity at this point, we'll use text objects instead of graphical buttons:

``````{ brush="lua" gutter="true" first-line="34" highlight="[38,39,41,42]" }
	local title = display.newImageRect( sceneGroup, "title.png", 500, 80 )
	title.x = display.contentCenterX
	title.y = 200
	
	local playButton = display.newText( sceneGroup, "Play", display.contentCenterX, 700, native.systemFont, 44 )
	playButton:setFillColor( 0.82, 0.86, 1 )

	local highScoresButton = display.newText( sceneGroup, "High Scores", display.contentCenterX, 810, native.systemFont, 44 )
	highScoresButton:setFillColor( 0.75, 0.78, 1 )
end
``````

<div class="float-right" style="max-width: 240px; margin-top: 16px; margin-bottom: 16px; clear: both;">

![][images.docs.sbs-starexplorer-10]

</div>

<div class="docs-tip-outer docs-tip-color-action">
<div class="docs-tip-inner-left">
<div class="fa fa-video-camera" style="font-size: 29px; padding-top: 4px;"></div>
</div>
<div class="docs-tip-inner-right">

Let's check the result of our code so far. Save your modified `menu.lua` file and then relaunch/restart the Simulator. If all went well, the menu background and text buttons should now be showing.

</div>
</div>

Finally, now that we have our visual objects in place, let's tie together the scene functionality. This will be similar to the previous project where we made the balloon detect the player's taps. Each text object will have its own tap handler which will call the `gotoGame()` and `gotoHighScores()` functions respectively.

Following the previous commands, add the following highlighted lines:

``````{ brush="lua" gutter="true" first-line="38" highlight="[44,45]" }
	local playButton = display.newText( sceneGroup, "Play", display.contentCenterX, 700, native.systemFont, 44 )
	playButton:setFillColor( 0.82, 0.86, 1 )

	local highScoresButton = display.newText( sceneGroup, "High Scores", display.contentCenterX, 810, native.systemFont, 44 )
	highScoresButton:setFillColor( 0.75, 0.78, 1 )

	playButton:addEventListener( "tap", gotoGame )
	highScoresButton:addEventListener( "tap", gotoHighScores )
end
``````

This should be clear &mdash; each command simply adds a `"tap"` event listener to the appropriate text object. With these in place, the `gotoGame()` function that we wrote earlier will be called when the player taps anywhere on the `playButton` text, and likewise for `gotoHighScores()` when the `highScoresButton` text is tapped.

<div class="docs-tip-outer docs-tip-color-alert">
<div class="docs-tip-inner-left">
<div class="fa fa-exclamation-circle" style="font-size: 35px;"></div>
</div>
<div class="docs-tip-inner-right">

Tapping either of the buttons now will result in an error because we haven't yet created the target scenes. In the next chapter, we will convert our previous game code into the `game.lua` Composer scene, and later create the `highscores.lua` scene as well.

</div>
</div>

<div class="docs-tip-outer" style="background-color: #ffa752;">
<div class="docs-tip-inner-left">
<div class="fa fa-check-square" style="font-size: 34px; padding-left: 1px; padding-top: 4px;"></div>
</div>
<div class="docs-tip-inner-right">

If your code isn't working as expected, please compare it to the `menu.lua` file bundled with this chapter's [source files](https://github.com/coronalabs/GettingStarted04/archive/master.zip). Fortunately, this scene is relatively easy because we only need to account for its `scene:create()` function.

</div>
</div>




<a id="concepts"></a>

## Chapter Concepts

We've introduced just a couple more concepts in this chapter, both related to Composer:

<div class="inner-table">

Command/Property															Description
--------------------------------------------------------------------------	-----------------------------------------
[composer.newScene()][api.library.composer.newScene]						Creates a new scene object which can be used with the Composer library.
[composer.gotoScene()][api.library.composer.gotoScene]						Transitions to a specific Composer scene.
--------------------------------------------------------------------------	-----------------------------------------

</div>


##

<div class="walkthrough-nav">

__&lang;__ [Chapter 3 &mdash; Bringing it to Life][guide.programming.03] _|_ [Chapter 5 &mdash; Converting the Game to Composer][guide.programming.05] __&rang;__

</div>
