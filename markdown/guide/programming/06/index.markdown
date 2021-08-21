# Chapter 6 &mdash; Implementing High Scores


<div class="walkthrough-nav">
<div class="walkthrough-nav-upper-right">

__&lang;__ [Previous][guide.programming.05] _|_ [Next][guide.programming.07] __&rang;__

</div>
</div>


In this chapter, we'll create a scene to display the ten highest scores for the game. We'll also explore how to save these scores to a persistent location.

<div class="guides-toc">

* [Composer-Accessible Data](#accessibledata)
* [High Scores Scene](#highscores)
* [Loading Data](#loaddata)
* [Saving Data](#savedata)
* [Displaying High Scores](#displayscores)
* [Leaving the Scene](#leavescene)
* [Scene Cleanup](#cleanup)
* [Chapter Concepts](#concepts)

</div>


<a id="accessibledata"></a>

## Composer-Accessible Data

For the most part, when you use Composer, scenes remain <nobr>self-contained</nobr>, meaning that variables, functions, and objects which you create within a given scene are isolated to that specific scene. For example, the `lives` and `score` variables that we use within `game.lua` are associated only with that scene.

This is generally good for keeping an app clean and organized, but sometimes you'll need to access variables/objects in one scene from a different scene that's inherently unaware of their existence. In this chapter, for instance, we'll need to access the player's score <nobr>(`score` from `game.lua`)</nobr> inside our new `highscores.lua` scene.

Lua itself provides various ways to pass and access data between modules, but Composer makes it even easier with the following commands:

* `composer.setVariable()` &mdash; Sets a variable declared in one scene to be accessible throughout the entire <nobr>Composer-structured</nobr> app.
* `composer.getVariable()` &mdash; Allows you to retrieve the value of any variable previously set via `composer.setVariable()`.

Armed with these commands, let's update the `endGame()` function:

1. Open your `game.lua` file.

2. Locate the `endGame()` function and __replace__ its contents with the following two commands:

<div class="code-indent">

``````{ brush="lua" gutter="true" first-line="185" highlight="[186,187]" }
local function endGame()
	composer.setVariable( "finalScore", score )
	composer.gotoScene( "highscores", { time=800, effect="crossFade" } )
end
``````

The first new command, <nobr>`composer.setVariable( "finalScore", score )`</nobr>, creates a <nobr>Composer-accessible</nobr> variable named `finalScore` with an assigned value of the `score` variable. With this in place, we'll be able to retrieve the value from the high scores scene.

The second command simply redirects the app to the `highscores.lua` scene instead of the menu scene.

</div>

3. Save your modified `game.lua` file.

<div class="docs-tip-outer">
<div class="docs-tip-inner-left">
<div class="fa fa-cog"></div>
</div>
<div class="docs-tip-inner-right">

You can pass any standard Lua variable type, including tables, as the value for `composer.setVariable()`. You can even use it to make a local function from one scene accessible within another. This flexibility makes `composer.setVariable()` and `composer.getVariable()` two of the most useful APIs within the Composer toolset.

</div>
</div>




<a id="highscores"></a>

## High Scores Scene

Our high scores scene will basically feature the ability to store and retrieve scores, determine the ten highest, and display them.

First, make a copy of the standard <nobr>`scene-template.lua`</nobr> file, included with this chapter's [source files](https://github.com/coronalabs/GettingStarted06/archive/master.zip). Rename this copy to `highscores.lua`, place it within your `StarExplorer` project folder, and open it using your chosen text editor.

As usual, we'll start by initializing some variables. Place the following code in the <nobr>scene-accessible</nobr> code area:

``````{ brush="lua" gutter="true" first-line="6" highlight="[11,12,13,14,15,16]" }
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------

-- Initialize variables
local json = require( "json" )

local scoresTable = {}

local filePath = system.pathForFile( "scores.json", system.DocumentsDirectory )
``````

Let's briefly examine these commands:

* With the first command, we load a new resource for our app: the JSON&nbsp;library. [JSON](https://www.json.org/) is a convenient format for working with data. If you're not familiar with JSON, don't worry&nbsp;&mdash; for the purpose of this app, you just need to learn how to use the <nobr>built-in</nobr> `json.encode()` and `json.decode()` commands. Respectively, these commands let you take a Lua table, store (encode) its contents in a <nobr>well-understood</nobr> format, and later translate (decode) that data back into a Lua table.

* The next command, <nobr>`local scoresTable = {}`</nobr>, simply creates an empty table which will eventually contain the retrieved scores, or an updated list of scores to save.

* The final line generates an absolute path to a JSON file (`scores.json`) which we'll use to save the ten highest scores. Don't worry that this file doesn't actually exist yet&nbsp;&mdash; this command will create the file and initiate a link to it under the variable `filePath`.

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

You may wonder why we're creating a __file__ to store the high scores data. Why not just store them locally in a Lua table? The reason is fundamental to app development in general. Basically, variables which exist in an app's local memory will be destroyed if the app quits/closes!

Essentially, any data which needs to be accessed at some point after the app quits/closes should be stored in a __persistent__ state, and the easiest way to store persistent data is to save it to a file on the device. Furthermore, this file must be stored in a __persistent&nbsp;location__.

To ensure that the `scores.json` file is placed within a persistent location, we specify `system.DocumentsDirectory` as the second parameter of the command we just entered. This tells Solar2D to create the `scores.json` file within the app's internal "documents" directory. While there are other places we could put the file, we won't go into details on them here&nbsp;&mdash; just remember that the documents directory, referenced by the constant `system.DocumentsDirectory`, is the only place which provides truly persistent storage for files that are created from within the app. In other words, even if the player quits the app and doesn't open it again until a month later, the `scores.json` file will still exist.

</div>




<a id="loaddata"></a>

## Loading Data

Now that we've initialized the file for storing scores, let's write a function to check for any scores which were previously saved. Of course there won't be any at this point, but we'll need this function eventually.

Directly following the commands you already added to the <nobr>scene-accessible</nobr> code area, add the following `loadScores()` function:

``````{ brush="lua" gutter="true" first-line="16" highlight="[19,20,21,22,23,24,25,26,27,28,29,30,31,32]" }
local filePath = system.pathForFile( "scores.json", system.DocumentsDirectory )


local function loadScores()

	local file = io.open( filePath, "r" )

	if file then
		local contents = file:read( "*a" )
		io.close( file )
		scoresTable = json.decode( contents )
	end

	if ( scoresTable == nil or #scoresTable == 0 ) then
		scoresTable = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }
	end
end
``````

Dissecting this function, we accomplish the following:

* When working with files containing data, the first step is to confirm that the file exists. The first command inside this function, <nobr>`local file = io.open( filePath, "r" )`</nobr>, attempts to open the file `scores.json` in the `system.DocumentsDirectory` folder (remember&nbsp;that we set the variable `filePath` to point to that file and&nbsp;folder). In this command, also note the second parameter,&nbsp;`"r"`. This tells Solar2D to open the file with __read__ access only, but that's sufficient here because we simply need to read the file contents.

* In the conditional block following, if the file exists, its contents will be dumped into the local variable `contents`. Once we have its contents, we close the file with <nobr>`io.close( file )`</nobr>. Then, using the command `json.decode()`, we decode `contents` and store the values in `scoresTable`&nbsp;&mdash; basically, `json.decode()` converts `scores.json` into a Lua table which can be used in our app.

* In the final conditional block, just in case the `scores.json` file is empty or doesn't exist, we assign `scoresTable` ten default values of `0` so that the scene has something to work with.

<div class="docs-tip-outer">
<div class="docs-tip-inner-left">
<div class="fa fa-cog"></div>
</div>
<div class="docs-tip-inner-right">

If you want to make things more interesting, start the game with ten default scores that the "computer" scored and challenge the player to beat them! For example:

``````lua
scoresTable = { 10000, 7500, 5200, 4700, 3500, 3200, 1200, 1100, 800, 500 }
``````

</div>
</div>




<a id="savedata"></a>

## Saving Data

Saving data is just as easy as reading data. Following the previous function in the <nobr>scene-accessible</nobr> code area, add a `saveScores()` function:

``````{ brush="lua" gutter="true" first-line="29" highlight="[35,36,37,38,39,40,41,42,43,44,45,46,47]" }
	if ( scoresTable == nil or #scoresTable == 0 ) then
		scoresTable = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }
	end
end


local function saveScores()

	for i = #scoresTable, 11, -1 do
		table.remove( scoresTable, i )
	end

	local file = io.open( filePath, "w" )

	if file then
		file:write( json.encode( scoresTable ) )
		io.close( file )
	end
end
``````

This function saves high scores data as follows:

* First, we clear out any unneeded scores from `scoresTable`. Because we only want to save the highest ten scores, anything beyond that can be discarded. Using a `for` loop, we step backwards through the table from its total count (`#scoresTable`) to `11`, effectively removing all but ten scores.

* Next, we open the `scores.json` file. Unlike our `io.open()` call within `loadScores()`, here we specify `"w"` as the second parameter. This tells Solar2D to create (write) a new file or overwrite the file if it already exists. It also tells Solar2D to open the file with __write__ access which is important because, when saving score data, we need to write data to the file.

* Once the file is successfully open, we call `file:write()` to write the `scoresTable` data to the file, converted into JSON via the `json.encode()` command. Finally, we close the file with <nobr>`io.close( file )`</nobr>.




<a id="displayscores"></a>

## Displaying High Scores

Before we show the scores to the player, we need to manipulate the `scoresTable` table slightly. Specifically, we need to add the most recent score to the table and then sort the table entries from highest to lowest.

All of the work for this scene can be done within `scene:create()`, so let's focus our attention on that function:

1. Before we can do anything with score data, we need to load the existing scores. Let's do so by calling the `loadScores()` function:

<div class="code-indent">

``````{ brush="lua" gutter="true" first-line="54" highlight="[60,61]" }
-- create()
function scene:create( event )

	local sceneGroup = self.view
	-- Code here runs when the scene is first created but has not yet appeared on screen

	-- Load the previous scores
	loadScores()
end
``````

</div>

2. Next, let's insert the player's most recent score into the `scoresTable` table. Notice that we get its value by calling `composer.getVariable()` with a sole parameter of `"finalScore"`. This exhibits the power of the `composer.setVariable()` <nobr>command &mdash; added to `game.lua` &mdash;</nobr> for setting a <nobr>Composer-accessible</nobr> variable which we can now access in this scene (`highscores.lua`). Following that, we immediately reset its value to `0` since we won't need further record of it.

<div class="code-indent">

``````{ brush="lua" gutter="true" first-line="60" highlight="[63,64,65]" }
	-- Load the previous scores
	loadScores()
	
	-- Insert the saved score from the last game into the table, then reset it
	table.insert( scoresTable, composer.getVariable( "finalScore" ) )
	composer.setVariable( "finalScore", 0 )
end
``````

</div>

3. At this point, we don't know where our score ranks among the existing high scores. It might not even beat the lowest score among the ten highest! To check this, let's __sort__ the table's values from highest to lowest. This will automatically place our score in the correct order. If it's not high enough to make the top ten, it will remain in the 11th slot, but since we'll only show ten scores, you won't see it on the screen.

<div class="code-indent">

To sort the table, we use the Lua `table.sort()` command. For this to work, we must provide it with the table to sort and a reference to a comparison function (`compare()`) which determines if items need to swap places. Here we've coded the `compare()` function directly inside of `scene:create()` because it doesn't need to be accessible elsewhere.

``````{ brush="lua" gutter="true" first-line="63" highlight="[67,68,69,70,71]" }
	-- Insert the saved score from the last game into the table, then reset it
	table.insert( scoresTable, composer.getVariable( "finalScore" ) )
	composer.setVariable( "finalScore", 0 )

	-- Sort the table entries from highest to lowest
	local function compare( a, b )
		return a > b
	end
	table.sort( scoresTable, compare )
end
``````

The `compare()` function itself takes two values which `table.sort()` provides. Since we are sorting a table of numbers, the two parameters `a` and `b` will be numerical values. The function compares these two values as in <nobr>"is `a` greater than `b`?"</nobr> If true, it returns `true` and `table.sort()` knows that it needs to swap the values. Essentially, when the `table.sort()` process finishes, our `scoresTable` values will be sorted from highest to lowest.

</div>

4. With the table now sorted, let's save the data back out to `scores.json` by calling our `saveScores()` function:

<div class="code-indent">

``````{ brush="lua" gutter="true" first-line="67" highlight="[73,74]" }
	-- Sort the table entries from highest to lowest
	local function compare( a, b )
		return a > b
	end
	table.sort( scoresTable, compare )

	-- Save the scores
	saveScores()
end
``````

</div>

5. Following this, let's create the scene background and a text object&nbsp;&mdash; nothing special here; by now you're an expert at this!

<div class="code-indent">

``````{ brush="lua" gutter="true" first-line="73" highlight="[76,77,78,80]" }
	-- Save the scores
	saveScores()

	local background = display.newImageRect( sceneGroup, "background.png", 800, 1400 )
	background.x = display.contentCenterX
	background.y = display.contentCenterY
	
	local highScoresHeader = display.newText( sceneGroup, "High Scores", display.contentCenterX, 100, native.systemFont, 44 )
end
``````

</div>

6. Next, let's display the scores using a simple `for` loop from `1` to `10`. For each score, we'll first set the intended __y__ position by calculating a local `yPos` variable. This will make the scores run down the screen, evenly spaced apart:

<div class="code-indent">

``````{ brush="lua" gutter="true" first-line="80" highlight="[82,83,84,85,86,87]" }
	local highScoresHeader = display.newText( sceneGroup, "High Scores", display.contentCenterX, 100, native.systemFont, 44 )

	for i = 1, 10 do
		if ( scoresTable[i] ) then
			local yPos = 150 + ( i * 56 )

		end
	end
end
``````

For each score line, we'll display __two__ text objects. On the left will be a rank number from __1)__ to __10)__. Directly to its right will be the actual score:

``````{ brush="lua" gutter="true" first-line="82" highlight="[86,87,88,90,91]" }
	for i = 1, 10 do
		if ( scoresTable[i] ) then
			local yPos = 150 + ( i * 56 )

			local rankNum = display.newText( sceneGroup, i .. ")", display.contentCenterX-50, yPos, native.systemFont, 36 )
			rankNum:setFillColor( 0.8 )
			rankNum.anchorX = 1

			local thisScore = display.newText( sceneGroup, scoresTable[i], display.contentCenterX-30, yPos, native.systemFont, 36 )
			thisScore.anchorX = 0
		end
	end
end
``````

Most of the above code should be straightforward, but we're introducing an important new concept in __anchors__. By default, Solar2D positions the __center__ of any display object at the __x__ and __y__ coordinate given. However, sometimes you'll need to align a series of objects along their edges&nbsp;&mdash; here, the list of scores will look best if each rank number is <nobr>right-aligned</nobr> and each score is <nobr>left-aligned</nobr>.

<div class="float-right" style="max-width: 244px; margin-top: 12px; margin-bottom: 16px; clear: left;">

![][images.docs.anchor-diagram]

</div>

To accomplish this, notice that we set the `anchorX` property of each object. This property typically ranges between `0`&nbsp;(left) and `1`&nbsp;(right), with a default of `0.5`&nbsp;(center). Since we want each rank number to be <nobr>right-aligned</nobr> with the others, we set `anchorX` to `1`, and for each score number, we set `anchorX` to `0` for left alignment.

<div class="docs-tip-outer">
<div class="docs-tip-inner-left">
<div class="fa fa-cog"></div>
</div>
<div class="docs-tip-inner-right">

Naturally, Solar2D also supports vertical anchor points with the `anchorY` property. Similar to its horizontal counterpart, this property typically ranges between `0`&nbsp;(top) and `1`&nbsp;(bottom), with a default of `0.5`&nbsp;(center). Anchors can even be set outside of the `0` to `1` range, although this usage is less common. Setting either `anchorX` or `anchorY` to values less than `0` or greater than `1` will place the anchor point conceptually somewhere in space outside of the object's edge boundaries, which can be useful in some instances.

</div>
</div>
</div>

7. Finally, let's create a button (text&nbsp;object) to go back to the menu. This is just like the text buttons you created in the menu scene, and its `"tap"` event listener will call a basic `gotoMenu()` function which we'll write next.

<div class="code-indent">

``````{ brush="lua" gutter="true" first-line="92" highlight="[95,96,97]" }
		end
	end

	local menuButton = display.newText( sceneGroup, "Menu", display.contentCenterX, 810, native.systemFont, 44 )
	menuButton:setFillColor( 0.75, 0.78, 1 )
	menuButton:addEventListener( "tap", gotoMenu )
end
``````

</div>




<a id="leavescene"></a>

## Leaving the Scene

Back up in the <nobr>scene-accessible</nobr> code area, we need to add the function which handles the `"tap"` event for the `menuButton` object. This is straightforward enough:

``````{ brush="lua" gutter="true" first-line="50" highlight="[50,51,52]" }
local function gotoMenu()
	composer.gotoScene( "menu", { time=800, effect="crossFade" } )
end


-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
``````




<a id="cleanup"></a>

## Scene Cleanup

Similar to the `game.lua` scene, let's remove the `highscores.lua` scene within its own `scene:hide()` function. This will remove the scene from memory when players return to the menu scene.

Inside the `scene:hide()` function, add the following highlighted line:

``````{ brush="lua" gutter="true" first-line="122" highlight="[133]" }
-- hide()
function scene:hide( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		-- Code here runs when the scene is on screen (but is about to go off screen)

	elseif ( phase == "did" ) then
		-- Code here runs immediately after the scene goes entirely off screen
		composer.removeScene( "highscores" )
	end
end
``````

<div class="docs-tip-outer docs-tip-color-action">
<div class="docs-tip-inner-left">
<div class="fa fa-video-camera" style="font-size: 29px; padding-top: 4px;"></div>
</div>
<div class="docs-tip-inner-right">

This wraps up our high score scene! Save your modified `highscores.lua` and `game.lua` files and then relaunch the Simulator. Now you should be able to play the game and see your scores saved/sorted in the high scores scene.

</div>
</div>

<div class="docs-tip-outer" style="background-color: #ffa752;">
<div class="docs-tip-inner-left">
<div class="fa fa-check-square" style="font-size: 34px; padding-left: 1px; padding-top: 4px;"></div>
</div>
<div class="docs-tip-inner-right">

This scene is relatively simple, but if your code isn't working as expected, please compare it to the `highscores.lua` file bundled with this chapter's [source files](https://github.com/coronalabs/GettingStarted06/archive/master.zip).

</div>
</div>




<a id="concepts"></a>

## Chapter Concepts

We've covered several more important concepts in this chapter:

<div class="inner-table">

Command/Property																Description
------------------------------------------------------------------------------	-----------------------------------------
[system.pathForFile()][api.library.system.pathForFile]							Generates an absolute path using <nobr>system-defined</nobr> directories as the base.
[io.open()][api.library.io.open]												Opens a file for reading or writing.
[io.close()][api.library.io.close]												Closes an open file handle.
[file:read()][api.type.File.read]												Reads a file, according to the given formats which specify what to read.
[file:write()][api.type.File.write]												Writes the value of each of its arguments to the file.
[json.decode()][api.library.json.decode]										Decodes a JSON-encoded data structure and returns a Lua table with the data.
[json.encode()][api.library.json.encode]										Converts a Lua table into a <nobr>JSON-encoded</nobr> string.
[composer.setVariable()][api.library.composer.setVariable]						Sets a variable declared in one scene to be accessible throughout the entire Composer app.
[composer.getVariable()][api.library.composer.getVariable]						Allows you to retrieve the value of any variable set via [composer.setVariable()][api.library.composer.setVariable].
[table.sort()][api.library.table.sort]											Sorts table elements in a given order.
[object.anchorX][api.type.DisplayObject.anchorX]								Property which allows you to control the alignment of a display object along the __x__ direction.
[object.anchorY][api.type.DisplayObject.anchorY]								Property which allows you to control the alignment of a display object along the __y__ direction.
------------------------------------------------------------------------------	-----------------------------------------

</div>


##

<div class="walkthrough-nav">

__&lang;__ [Chapter 5 &mdash; Converting the Game to Composer][guide.programming.05] _|_ [Chapter 7 &mdash; Sounds and Music][guide.programming.07] __&rang;__

</div>
