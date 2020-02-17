# Displaying and Saving Scores

A frequently asked question from game developers new to Corona/Lua is <nobr>"How do I keep score?"</nobr> This tutorial will walk you through the entire process, including:

1. Setting up a variable to hold the score.
2. Displaying the score.
3. Saving (and&nbsp;retrieving) the score for future use.


## The Score Module

Corona does not have a <nobr>built-in</nobr> "score" module, so let's build one which you can implement in your apps, beginning with a basic initialization function.

To begin, create a new empty Lua file within your project directory. Name this file `score.lua`. Open the file in your text editor and insert the following code:

``````{ brush="lua" gutter="true" first-line="1" }
local M = {}

M.score = 0  -- Set the score to 0 initially

function M.init( options )

	local customOptions = options or {}
	local opt = {}
	opt.fontSize = customOptions.fontSize or 24
	opt.font = customOptions.font or native.systemFont
	opt.x = customOptions.x or display.contentCenterX
	opt.y = customOptions.y or opt.fontSize*0.5
	opt.maxDigits = customOptions.maxDigits or 6
	opt.leadingZeros = customOptions.leadingZeros or false

	local prefix = ""
	if ( opt.leadingZeros ) then 
		prefix = "0"
	end
	M.format = "%" .. prefix .. opt.maxDigits .. "d"

	-- Create the score display object
	M.scoreText = display.newText( string.format( M.format, 0 ), opt.x, opt.y, opt.font, opt.fontSize )

	return M.scoreText
end

return M
``````

Here, we first set up a basic module <nobr>table `M` &mdash;</nobr> this table will contain all of the functions we create so that they can be called from whatever module includes this module. Following that, we set a `score` property for the `M` table and initially set it to `0`. For the `init()` function, we accept one parameter, `options`, which is a Lua table of <nobr>key-value</nobr> pairs. The supported options include:

* `fontSize` &mdash; The size of the displayed score text.
* `font` &mdash; The font used for the displayed score text. See the [Using Custom Fonts][guide.system.customFont] guide for details on using custom fonts within a Corona app.
* `x` &mdash; The __x__ location to draw the score display.
* `y` &mdash; The __y__ location to draw the score display.
* `maxDigits` &mdash; The estimated maximum number of digits for the score.
* `leadingZeros` &mdash; `true` or `false` depending on whether you want leading zeros.

If any of the supported options are __not__ specified, we fall back to reasonable defaults, in this case the default system font at 24&nbsp;point size, centered at the top of the screen, with a maximum of 6 digits.

<div class="guide-notebox">
<div class="notebox-title">Notes</div>

* We could extend this with alignment properties and other settings. For example, we could add options to control the anchor point for <nobr>left-aligned</nobr> or <nobr>right-aligned</nobr> score text. 

* The score text uses the `string.format()` API to format the number. Here, the string will either be prefixed by spaces or by zeros, depending on the settings. This format setting is also saved to the module (`M.format`) for usage in other functions. For more details on string formatting, please see the [Formatting String Values][tutorial.data.formattingStrings] tutorial.

</div>


## Set, Get, and Add Functions

Next, let's include some functions for __setting__, __getting__, and __adding__ to the score:

``````{ brush="lua" gutter="true" first-line="28" highlight="[28,29,30,31,32,34,35,36,37,39,40,41,42,43]" }
function M.set( value )

	M.score = tonumber(value)
	M.scoreText.text = string.format( M.format, M.score )
end

function M.get()

	return M.score
end

function M.add( amount )

	M.score = M.score + tonumber(amount)
	M.scoreText.text = string.format( M.format, M.score )
end

return M
``````

Let's quickly inspect these three new functions:

* If we call the `set()` function, the score display object (`M.scoreText`) will visibly update to the new value.

* The `get()` method simply returns the current score for some other use.

* The `add()` function allows us to add a value to the current score and update the display object. While this concept could be extended to an additional "subtract" function, it would be more efficient to just pass a negative value as `amount`.


## Saving and Loading the Score

The last thing our module needs is the ability to save and load the score. This is essential functionality if the score must be saved as a high score, in which case it must persist between app sessions:

``````{ brush="lua" gutter="true" first-line="45" highlight="[45,46,47,48,49,50,51,53,54,55,56,57,58,59,60,61,62]" }
function M.save()

	local saved = system.setPreferences( "app", { currentScore=M.score } )
	if ( saved == false ) then
		print( "ERROR: could not save score" )
	end
end

function M.load()

	local score = system.getPreference( "app", "currentScore", "number" )

	if ( score ) then
		return tonumber(score)
	else
		print( "ERROR: could not load score (score may not exist in storage)" )
	end
end

return M
``````

Both of these functions are relatively straightforward:

* The `save()` function saves the current score (`M.score`) to the app's local storage under the key `currentScore`. If the process fails, it outputs an error message to the console.

* The `load()` function loads the associated key from the app's local storage and sets it to the variable `score`. If the process succeeds, it returns that value, otherwise it outputs an error message to the console.


## Using the Module

With our `score.lua` module created and the basic functions written, we can now use it within our app. In another scene or Lua module, for&nbsp;instance, the score module can be implemented like this:

``````lua
local score = require( "score" )

local scoreText = score.init(
{
	fontSize = 20,
	font = "CoolCustomFont.ttf",
	x = display.contentCenterX,
	y = 30,
	maxDigits = 7,
	leadingZeros = true
})
``````

The first line is the mandatory `require()` line which includes the `score.lua` module in the project, providing access to all of the functions we wrote above. The second block calls the module's `init()` function with a series of basic parameters. This creates the text display, centers it near the top of the screen, and sets it to a <nobr>zero-filled</nobr> <nobr>7-digit</nobr> score.

From this point, the following actions can be executed with just one line:

<div class="inner-table">

Command												Result
--------------------------------------------------	----------------
`score.set( value )`								Sets the score to `value`.
<nobr>`local currentScore = score.get()`</nobr>		Gets the current score.
`score.add( value )`								<nobr>Adds `value` to the current score. &nbsp;</nobr>
`score.save()`										Saves the score to local storage.
`local savedScore = score.load()`					Loads the previously-saved score.
--------------------------------------------------	----------------

</div>


## Conclusion

Hopefully this tutorial illustrates just how easy it is to work with scores in Corona, including saving and loading scores to the device for persistence between app sessions.
