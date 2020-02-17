# Saving/Loading Tables Using JSON

Some developers see the term __JSON__ and think that it will be complicated to work with. The [documentation][api.library.json] for JSON can be initially daunting but it's incredibly useful to understand the basics of JSON and how it can be used for saving/loading data.

## What is JSON?

__JSON__ stands for __JavaScript&nbsp;Object&nbsp;Notation__. It's how developers define objects as arrays in JavaScript (tables&nbsp;in&nbsp;Lua) and these objects are defined using <nobr>key-value</nobr> pairs, similar to Lua. The syntax is a little different, but a Lua programmer should be able to comprehend it. Consider this data:

<div class="inner-table vert-compact" style="margin-top: -22px;">

&nbsp;			&nbsp;
--------------	------------------------------------------------------
__Name__		Clark Kent
__Nickname__	Superman
__Address__		Metropolis
__Age__			32
--------------	------------------------------------------------------

</div>

If we create a table for this data in Lua, it might look like this:

``````lua
local hero = {
	name = "Clark Kent",
	nickname = "Superman",
	address = "Metropolis",
	age = 32
}
``````

Alternatively, the same data could be represented in JSON like this:

``````json
var hero = {
	"name":"Clark Kent",
	"nickname":"Superman",
	"address":"Metropolis",
	"age":32
};
``````

Notice the similarities between the JSON and Lua code. In both, we declare <nobr>key-value</nobr> pairs where the __key__ is on the left side of the <nobr>`=` (Lua)</nobr> or <nobr>`:` (JSON)</nobr> and the __value__ is on the right side. One slight difference is that JSON uses a string for the key because one purpose of the notation is to facilitate __serialization__. More specifically, this means turning an <nobr>in-memory</nobr> binary object into something that can be transmitted over a network and then converted back into an <nobr>in-memory</nobr> binary object. Because of this, text, numbers, and booleans (`true`/`false`) are the only individual items that can be specified in JSON data&nbsp;&mdash; you can __not__ include things like Corona display objects or anything dependent on userdata/C memory.

For more complex tables, JSON also supports the use of arrays of items inside square brackets (`[]`) and objects inside of curly braces (`{}`). Let's expand our example data to multiple heroes in a Lua array:

``````lua
local heroes = {
	{ name="Clark Kent", nickname="Superman", address="Metropolis", age=32 },
	{ name="Bruce Wayne", nickname="Batman", address="Gotham", age=36 },
	{ name="Diana Prince", nickname="Wonder Woman", address="New York", age=28 },
}
``````

Or in JSON...

``````json
var heroes = [
	{ "name":"Clark Kent", "nickname":"Superman", "address":"Metropolis", "age":32 },
	{ "name":"Bruce Wayne", "nickname":"Batman", "address":"Gotham", "age":36 },
	{ "name":"Diana Prince", "nickname":"Wonder Woman", "address":"New York", "age":28 },
	]
};
``````

Notice again that it's quite similar to Lua&nbsp;&mdash; this is one reason why JSON is popular among Lua developers. The syntax of JSON is also more compact and lightweight compared to XML where you need both an opening and closing tag in addition to the data. Finally, JSON is also used by many online services which your app may connect to.


## Putting JSON to Work

As a Corona developer, it's not necessary to fully understand JSON to utilize it because we provide two convenient API calls as part of the <nobr>built-in</nobr> [JSON][api.library.json] library. The function [json.encode()][api.library.json.encode] accepts a Lua table and converts it to <nobr>string-formatted JSON</nobr> (this&nbsp;is where the data is&nbsp;__serialized__). Conversely, when handling a string of formatted JSON data, it can be converted back to a Lua table using [json.decode()][api.library.json.decode] (this&nbsp;is where the data <nobr>is __de-serialized__)</nobr>.

Using the example data above, let's __encode__ a Lua table to JSON using [json.encode()][api.library.json.encode] and `print()` its value to the Corona console:

``````{ brush="lua" gutter="false" first-line="1" highlight="[9,10]" }
local json = require( "json" )  -- Include the Corona JSON library

local heroes = {
	{ name="Clark Kent", nickname="Superman", address="Metropolis", age=32 },
	{ name="Bruce Wayne", nickname="Batman", address="Gotham", age=36 },
	{ name="Diana Prince", nickname="Wonder Woman", address="New York", age=28 },
}

local serializedJSON = json.encode( heroes )
print( serializedJSON )
``````

This outputs something like the following:

`````` 
[{"nickname":"Superman","age":32,"name":"Clark Kent","address":"Metropolis"},{"nickname":"Batman","age":36,"name":"Bruce Wayne","address":"Gotham"},{"nickname":"Wonder Woman","age":28,"name":"Diana Prince","address":"New York"}]
``````

Now, to __decode__ this JSON string back into a Lua table, simply call [json.decode()][api.library.json.decode] and `print()` its value to the console. This will output a typical memory reference to the Lua table created, for instance <nobr>`table: 0x6080010613c0`</nobr>, and that table of data can be used just like any other Lua table.

``````{ brush="lua" gutter="false" first-line="1" highlight="[4,5]" }
local serializedJSON = json.encode( heroes )
print( serializedJSON )

local newHeroes = json.decode( serializedJSON )
print( newHeroes )
``````

With these two steps, we converted a Lua table into a JSON string and then converted it back to a Lua table, and it wasn't even necessary to understand JSON. This is how simple JSON can be!


## Saving/Loading Tables to JSON

One of the most useful purposes of encoding and decoding data between Lua and JSON is <nobr>__saving and loading data__</nobr> to/from local storage. This lets you accomplish a myriad of tasks including storing game settings, reading level data/configurations, keeping track of high scores between sessions, and nearly any other task where you need to store a reasonably predictable amount of data.

<div class="guide-notebox">
<div class="notebox-title">Note</div>

If you need to handle a larger amount of data in __database__ format, or if you need to sort and filter data based on varying parameters, JSON is __not__ an ideal solution. In cases like these, consult the [Database Access Using SQLite][tutorial.data.databaseAccess] tutorial for details on how to save, load, and utilize data in SQLite databases.

</div>

Let's begin by creating a convenient Lua module to contain the necessary functions. You can study this concept further in the [External Modules in Corona][tutorial.basics.externalModules] tutorial, but basically we'll begin with a typical setup:

``````{ brush="lua" gutter="true" first-line="1" }
local M = {}

local json = require( "json" )
local defaultLocation = system.DocumentsDirectory

return M
``````

Save this file to your main project directory as `loadsave.lua`. Essentially, this initial code sets up a Lua table `M` which will store the functions we create in the following sections, and it returns that table so that those functions will be accessible to any module which <nobr>`require()`-s</nobr> this module. Additionally, since we're obviously going to use JSON, we include the Corona JSON library and set the default persistent location (`system.DocumentsDirectory`) to save/load JSON files to/from.

### Save Function

Now let's add a __save__ function to the `loadsave.lua` module:

``````{ brush="lua" gutter="true" first-line="1" highlight="[7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31]" }
local M = {}

local json = require( "json" )
local defaultLocation = system.DocumentsDirectory


function M.saveTable( t, filename, location )

	local loc = location
	if not location then
		loc = defaultLocation
	end

	-- Path for the file to write
	local path = system.pathForFile( filename, loc )

	-- Open the file handle
	local file, errorString = io.open( path, "w" )

	if not file then
		-- Error occurred; output the cause
		print( "File error: " .. errorString )
		return false
	else
		-- Write encoded JSON data to file
		file:write( json.encode( t ) )
		-- Close the file handle
		io.close( file )
		return true
	end
end

return M
``````

This function is relatively straightforward and it follows the basic example in the [Reading and Writing Files][guide.data.readWriteFiles#writing-files] guide. Essentially it works like this:

* This function accepts three parameters: `t`, `filename`, and `location`&nbsp;&mdash; `t` is the Lua table which should be converted to JSON and saved, `filename` is the name of the target JSON file, and `location` is the local storage location at which to save the file.

* Inside the function, we first set the local storage location. If the `location` parameter is not defined, we set this to `defaultLocation` (`system.DocumentsDirectory`) which is where files should be saved in 99% of cases.

* Next, we create the path to the destination file based on the `filename` parameter and location.

* Following this, we open the file handle with __write__ access (`"w"`) since we're saving (writing) the file.

* Finally, assuming the file handle is valid, we write the <nobr>JSON-encoded</nobr> table <nobr>(`json.encode( t )`)</nobr> to the destination file path, close the file handle, and return `true`.

### Load Function

Saving data isn't very useful without a method to load it back into memory, so let's add a __load__ function to the `loadsave.lua` module:

``````{ brush="lua" gutter="true" first-line="34" highlight="[34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60]" }
function M.loadTable( filename, location )

	local loc = location
	if not location then
		loc = defaultLocation
	end

	-- Path for the file to read
    local path = system.pathForFile( filename, loc )

	-- Open the file handle
	local file, errorString = io.open( path, "r" )

	if not file then
		-- Error occurred; output the cause
		print( "File error: " .. errorString )
	else
		-- Read data from file
		local contents = file:read( "*a" )
		-- Decode JSON data into Lua table
		local t = json.decode( contents )
		-- Close the file handle
		io.close( file )
		-- Return table
		return t
	end
end

return M
``````

This function is also fairly basic:

* This time, just two parameters are needed: `filename` and `location`&nbsp;&mdash; `filename` is the name of the JSON file to read and `location` is its local storage location.

* Inside the function, we first determine the local storage location. As with the `saveTable()` function, this is set to a default of `system.DocumentsDirectory` unless otherwise specified by the `location` parameter.

* Next, we create the path to the file based on the `filename` parameter and location.

* Following this, we open the file handle with __read__ access (`"r"`) since we're loading (reading) the file.

* Finally, assuming the file handle is valid, we read the file data into a `contents` string, decode it back to a Lua table <nobr>(`json.decode( contents )`)</nobr>, close the file handle, and return `t` so that the Lua table is returned when calling this function.

### Using the Functions

As a very simple example, let's assume that we have a table containing various game settings. Using this table, we can save the data using the `saveTable()` function. This will encode the Lua table to JSON and save it to `system.DocumentsDirectory()` (default) as `settings.json`.

``````lua
local loadsave = require( "loadsave" )

local gameSettings = {
	musicOn = true,
	soundOn = true,
	difficulty = "easy",
	highScore = 10000,
	highestLevel = 7
}

loadsave.saveTable( gameSettings, "settings.json" )
``````

Then, to load the data back in, we can use the `loadTable()` function, requesting the file that was just saved:

``````lua
local loadedSettings = loadsave.loadTable( "settings.json" )
``````

<div class="docs-tip-outer">
<div class="docs-tip-inner-left">
<div class="fa fa-cog"></div>
</div>
<div class="docs-tip-inner-right">

If you frequently save and load data with multiple keys/values, a __table&nbsp;output__ function may be extremely useful to inspect exactly what's contained within the loaded table. Several examples of this concept exist online, but one proven and powerful version can be found in the [Outputting Table Contents][tutorial.data.outputTable] tutorial.

</div>
</div>


## Conclusion

As illustrated in this tutorial, JSON provides a lightweight method to convert Lua tables into serialized text strings which can be exchanged between online services or saved to local files. Then, with just one line, they can be restored to the original Lua format.
