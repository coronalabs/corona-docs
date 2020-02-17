# The Value of <nobr>Well-Formatted</nobr> Code

Inevitably, there will be a time in your app development where you'll need to show your code to someone else. Perhaps it's because you're asking for help in the forums or you're working on a team and your teammates need to read your code. Maybe you want to share a useful module with someone, or even sell a game template in the [Corona Marketplace](https://marketplace.coronalabs.com).

In all of these instances, having <nobr>well-formatted</nobr> code is a major aspect of how successful you'll be as a programmer. Unfortunately, code formatting can prompt a heated argument between different programmers: do you use 3 spaces or 4 spaces per indent? Do you indent with tabs or spaces? Do you put your opening curly&nbsp;brace&nbsp;(`{`) on the end of the line or the beginning? And so forth...

Before we look at some key ways you can improve your code formatting, consider this block of code:

``````lua
local function doit()
local variableA = 0
local s = 0
local hs = 0
local sd = display.newText("0",160,10,native.systemFont,16)
local function sum(variableA,s)
local variableb=s+variableA


sd.text = variableb
			if variableb>hs then
hs = variableb

end
return variableb
	end
sum(variableA,s)

print(variableb)
end
		doit()
``````

While the code above technically works, it's confusing to figure out what it's actually doing. Now compare it to this version:

``````lua
local function showScore()

	local count = 0
	local score = 0
	local highScore = 0
	local scoreDisplay = display.newText( "0", 160, 10, native.systemFont, 16 )

	local function addToScore( count, score )

		local newScore = score + count
		scoreDisplay.text = newScore

		if ( newScore > highScore ) then
			highScore = newScore
		end

		return newScore
	end

	addToScore( count, score )
	print( newScore )
end

showScore()
``````

As you can see, proper code formatting makes this version __much__ easier to read and understand. The `showScore()` function is clearly started and ended, variables and functions are accurately named, spaces and indentations are added for improved readability, everything is properly scoped, and even the `addToScore()` function is cleanly nested within its parent `showScore()` function.

In the following sections, we'll look at common code formatting issues and how you can improve your own code.


## Indentation

Many new developers don't know what __indentation__ means. Simply put, code is broken into __blocks__ and blocks have a beginning and an end. For instance, when you define a function, you are creating a block of code. At some point, that block ends, using the Lua keyword `end`. As a general definition, __indentation__ is the intentional shifting (to&nbsp;the&nbsp;right) of code within a block, effectively making it more readable. For&nbsp;instance:

``````lua
local function addNumbers( numberOne, numberTwo )

	return numberOne + numberTwo  -- This line is indented
end
``````

In Lua, blocks are defined using any of the following keywords:

* `function`
* `if`
* `while`
* `for`
* `repeat`

Since all of these keywords __start__ a code block, they require that an `end` statement completes them. To adhere to the rules of proper indentation, the keyword <nobr>(for instance `if`)</nobr> and its matching `end` should be the same distance from the left side of the editor screen.

For purposes of indentation, depending on your personal preference, you can indent your code using either multiple <nobr>__spaces__ &mdash; 3-4 is most common &mdash;</nobr> or __tab__ indentations. If you prefer spaces, you should use enough spaces so that it's obvious that the interior code is "inside" the block. In the case of tabs, most editors allow you to set a single tab to represent 3&nbsp;or&nbsp;4 spaces and, when you backspace/delete to remove the indent, it conveniently removes the entire tab instead of forcing you to erase multiple spaces individually.

### Multi-Level Indentation

Frequently, you will have blocks inside of other blocks, for example an `if` statement inside a function and another command inside of that `if` block. In these cases, you should indent the interior block/line one further "level" than its containing block:

``````lua
local function touchHandler( event )

	if ( event.phase == "ended" ) then  -- First level of indentation
		composer.gotoScene( "game" )    -- Second level of indentation
	end

	return true
end
``````

<!---

A few final notes on indentation: it's very important that you be consistent with your indentations! Don't <nobr>over-indent</nobr> a block and don't <nobr>under-indent</nobr> it either. While proper indentation takes a little more focus and effort while you're coding, if you fail to properly indent blocks, anybody else reading your code will struggle to understand it, and even you may become confused if you return later to inspect <nobr>non-indented</nobr> code blocks.

-->


## Variable Names

Back in the early days of programming, for example with languages like BASIC, programmers only had access to variable names like `A`, `B`, `I`, `X`, `Y`, etc. These letters were used in a fairly standard way&nbsp;&mdash; `A` for arrays, `X`/`Y` for coordinates, or `I` for "index" <nobr>(as in a `for` loop index)</nobr>.

Modern programming languages allow us to use far more verbose variable names, and Lua has a few general guidelines which work well. For instance, `i` might be a good index variable in a very narrow scope, but it's a horrible name for something "broader" to the overall project. Generally, the broader the scope, the more descriptive the variable name should be. Shorter names like `move` or `player` are fine for <nobr>narrow-scoped</nobr> variables, but the broader the scope, the longer the name should be, and frequently it should contain multiple words like `playerUniformColor`.


## Block Length and Nested Blocks

In Lua, it's easy to write code that can contain a lot of nested blocks. However, the longer a block gets, the harder it becomes to read and maintain. In any modern programming language, the purpose of functions is to write manageable blocks of code that will be executed over and over, and the key term here is __manageable__. When you have a series of `function()`, `if`, `for` and other blocks nested inside each other along with `end` statements associated with each, even proper indentation may not be enough to clarify the flow of logic. If an overall block of code becomes this large, it may be best to pull some of the logic out and move it to another function.


## Module Length

Just like avoiding long functions and other blocks, consider avoiding long Lua modules. When a single module gets too long, it becomes hard to manage. If you are constantly scrolling up and down in your text editor to find things, the module may be "unmanageable" and it might be wise to move parts of that module's functionality to a new module. Excessively long modules may also run up against Lua's limit of 200 local variables, so keeping modules shorter and more concise is good practice.


## White Space

While some white space (including&nbsp;indentations) improves readability, excessive white space can be both problematic and pointless. On the other hand, __avoiding__ white space can make your code appear cluttered and jumbled. Generally, you should use one line break between blocks, and one space between keywords like `function` and its parameters. Consider this function:

``````lua
local function			addToScore(count,score)


	local newScore=score+count
	scoreDisplay.text=newScore




	if
				newScore>highScore then
				highScore=newScore
	end
			return newScore
end
``````

Now compare it with the following function which is identical in behavior but, by using a sensible amount of white space, this version is much easier to read:

``````lua
local function addToScore( count, score )

	local newScore = score + count
	scoreDisplay.text = newScore

	if ( newScore > highScore ) then
		highScore = newScore
	end

	return newScore
end
``````


## Using a Proper Editor

Using a full-featured code/text editor application will greatly improve your code. These will usually manage your indentations automatically as you move down further into a block of code. In addition, they will often provide full Lua syntax coloring where keywords, values, and variables are colored differently to assist in readability. For example, an editor might label strings in green, and if you forget to include a string's ending quote (`"`), a much larger block of code may turn green, indicating you forgot that ending quote.

Another important feature of a proper editor is the ability to show line numbers. When Corona encounters an error in code, it reports the line number where the problem occurred (see&nbsp;the [Debugging Guide][guide.basics.debugging] for more&nbsp;information). Thus, if your editor shows line numbers, it's much easier to track down the issue.

See our [Getting Started][guide.programming.01] guide for a list of recommended text editors.


## Conclusion

If you follow the practices in this tutorial, not only will you find your own code easier to read, but when you need help from other developers, more will be willing to assist you. Collectively, the techniques and tips we've discussed will make you a more efficient and productive developer!
