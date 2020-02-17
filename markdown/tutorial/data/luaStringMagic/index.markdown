# Lua String Magic

This tutorial features Lua string manipulation and parsing techniques which can be useful in several applications, especially business or <nobr>database-powered</nobr> apps where you need to check and confirm that text is formatted properly.


## Splitting Strings

Do you have some data that's in the form of a long string and you need to break it up into smaller strings based on a custom pattern? A common example is street addresses:

``````
Flintstone, Fred, 101 Rockledge, Bedrock, 98775, 555-555-1212
Rubble, Barney, 103 Rockledge, Bedrock, 98775, 555-555-1313
``````

Now, let's assume you want to parse out each piece of data separated by a comma. Lua does not have a "split" function native to its string library, but with a small function, you can implement the same functionality. Inspect the following code:

``````lua
function string:split( inSplitPattern )

	local outResults = {}
	local theStart = 1
	local theSplitStart, theSplitEnd = string.find( self, inSplitPattern, theStart )

	while theSplitStart do
		table.insert( outResults, string.sub( self, theStart, theSplitStart-1 ) )
		theStart = theSplitEnd + 1
		theSplitStart, theSplitEnd = string.find( self, inSplitPattern, theStart )
	end

	table.insert( outResults, string.sub( self, theStart ) )
	return outResults
end
``````

This function accomplishes the desired task gracefully, providing a <nobr>user-defined</nobr> pattern to split on, and it returns a table with the split elements.

Calling the function can be done in two ways with equal results:

``````{ brush="lua" gutter="false" first-line="1" highlight="[3]" }
local myString = "Flintstone, Fred, 101 Rockledge, Bedrock, 98775, 555-555-1212"

local myTable = myString:split( ", " )

for i = 1,#myTable do
	print( myTable[i] )
end
``````

``````{ brush="lua" gutter="false" first-line="1" highlight="[3]" }
local myString = "Flintstone, Fred, 101 Rockledge, Bedrock, 98775, 555-555-1212"

local myTable = string.split( myString, ", " )

for i = 1,#myTable do
	print( myTable[i] )
end
``````


## Trimming Strings

Trimming strings can be useful in several cases, especially if you're working with data from an external source, or data that is input by the user via the device's keyboard. As with the "split" functionality, string trimming is not native to Lua's string library, but it can be accomplished easily enough. Inspect the following function:

``````lua
local function trimString( s )

	return string.match( s, "^()%s*$" ) and "" or string.match( s, "^%s*(.*%S)" )
end
``````

Using it is as simple as passing an untrimmed string as the sole parameter:

``````lua
local trimmedString = trimString( "   Some untrimmed string here.     " )

print( "[" .. trimmedString .. "]" )  --> [Some untrimmed string here.]
``````


## Formatting as Title Case

Occasionally it's useful to convert a string into "title&nbsp;case" in which the first letter of each word is converted to uppercase while the remaining letters are set as lowercase. As an example, let's assume that a name was entered in a very sloppy format like:

``````
Obi-waN kEnObi
``````

Of course, you probably want to correct this, and doing so requires just one simple function:

``````lua
local function titleCase( s )

	local result = string.gsub( s, "(%a)([%w_']*)",
		function( first, rest )
			return first:upper() .. rest:lower()
		end
	)
	return result
end
``````

If you pass the unformatted string to this function as the sole parameter, the result is exactly as expected: <nobr>`Obi-Wan Kenobi`</nobr>.

``````lua
local characterName = titleCase( "Obi-waN kEnObi" )

print( characterName )  --> Obi-Wan Kenobi
``````


## Strict Line Wrapping

Sometimes you'll have a long string (paragraph) of text which needs to be <nobr>line-wrapped</nobr> at a specific character interval, not a pixel distance. Corona's [display.newText()][api.library.display.newText] API handles line wrapping if you provide the `width` parameter, but if you want <nobr>interval-specific</nobr> control, you may prefer the following function which allows you to set a maximum number of characters per line as the `limit` argument. In addition, it allows you to set indent values&nbsp;&mdash; as optional strings, not integers&nbsp;&mdash; for both the start of the paragraph and/or each following line.

``````lua
local function textWrap( str, limit, indent, indentFirst )

	limit = limit or 72
	indent = indent or ""
	indentFirst = indentFirst or indent

	local here = 1 - #indentFirst
	return indentFirst .. str:gsub( "(%s+)()(%S+)()",
		function( sp, st, word, fi )
			if fi - here > limit then
				here = st - #indent
				return "\n" .. indent .. word
			end
		end
	)
end
``````

Let's examine the function arguments in order:

	textWrap( str, limit, indent, indentFirst )

* `str` (required [string][api.type.String]) &mdash; The string of text which you want to <nobr>line-wrap</nobr>.
* `limit` (optional [integer][api.type.Number]) &mdash; The maximum character interval at which to wrap the lines.
* `indent` (optional [string][api.type.String]) &mdash; Indention string for each line.
* `indentFirst` (optional [string][api.type.String]) &mdash; Indention string for the first line only.

With this in mind, we could call the function like this and get the following output:

``````lua
local initialText = "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet."

local wrappedText = textWrap( initialText, 36, nil, "    " )

print( wrappedText )
``````

``````
    Lorem ipsum dolor sit amet,
consetetur sadipscing elitr, sed
diam nonumy eirmod tempor invidunt
ut labore et dolore magna aliquyam
erat, sed diam voluptua. At vero eos
et accusam et justo duo dolores et
ea rebum. Stet clita kasd gubergren,
no sea takimata sanctus est Lorem
ipsum dolor sit amet.
``````


## Confirm Email Format

Another useful string check is confirming that a user has entered an email address in the proper format. Of course, this function can't check if the actual address is valid and functional, but at least it confirms that the format is basically correct.

``````lua
local function confirmEmail( s )

	if ( s:match("[A-Za-z0-9%.%%%+%-]+@[A-Za-z0-9%.%%%+%-]+%.%w%w%w?%w?") ) then
		return true
	else
		return false
	end
end
``````

If you pass the email address as the sole parameter, you can see that the function simply returns a boolean `true` or `false`, depending on whether the email address is formatted correctly.

``````lua
local isEmailFormat = confirmEmail( "username@domain.com" )

print( isEmailFormat )  --> true
``````


## Stripping Emoticons

Emoticons, or "emojis," are visual symbols which let people easily express a thought or feeling via text. Unfortunately, these characters can wreak havoc if you need to save strings containing emoticons to a SQLite&nbsp;database, encode/decode strings using JSON, etc.

If your app accepts user text input <nobr>(custom player names, etc.)</nobr> in which players may include emoticons, but you need to strip them out for data storage/conversion purposes, the following function accomplishes the task:

``````lua
local function stripNonStandardCharacters( s )

	local res = ""
	for i = 1, utf8.len(s) do
		local c = utf8.sub( s, i, i )
		if utf8.codepoint( c ) <= 65535 then
			res = res .. c
		end
	end
	return res
end
``````

<div class="docs-tip-outer">
<div class="docs-tip-inner-left">
<div class="fa fa-cog"></div>
</div>
<div class="docs-tip-inner-right">

Note that this function requires usage of the free Corona [UTF-8][plugin.utf8] plugin, so you'll need to include it in your project and `require()` it in the module which includes this <nobr>emoticon-stripping</nobr> function. See the plugin [documentation][plugin.utf8] for details.

</div>
</div>


## Conclusion

This wraps up our tutorial on Lua string "magic." Hopefully you can find a place for these convenient functions in your apps!
