# sqlite3.* (database)

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Library][api.type.Library]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          sqlite3, database, sqlite
> __See also__          [LuaSQLite Documentation](http://lua.sqlite.org/index.cgi/doc/tip/doc/lsqlite3.wiki)
>								[SQLite Language Reference](http://www.sqlite.org/lang.html)
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Solar2D includes support for SQLite databases on all platforms. The documentation for LuaSQLite can be viewed [here](http://lua.sqlite.org/index.cgi/doc/tip/doc/lsqlite3.wiki).


## Gotchas

When providing a file path to `open()`, make sure to use [system.pathForFile()][api.library.system.pathForFile]. Providing just a plain file name such as `my.db` will not work consistently across the Simulator and devices, especially on Android.


## Quick Start

* `sqlite3.open( path )` &mdash; Opens the SQLite file. Note that the path should be the full path to the database, not just the file name. In case of an error, the function returns `nil`, an error code, and an error message.

* `sqlite3.version()` &mdash; Returns the version of SQLite in use. Returns a string with SQLite version information in the form `x.y[.z]`.

* `file:exec( SQL_Command )` &mdash; Executes a SQL command in the database. Typically this is used to create tables, insert, update, append, or retrieve data from a database. In case of an error, this function returns a numerical [error&nbsp;code](http://lua.sqlite.org/index.cgi/doc/tip/doc/lsqlite3.wiki#numerical%20error%20and%20result%20codes).

* `file:nrows( SQL_Command )` &mdash; Returns successive rows from the SQL statement. Each call to the iterator returns a table in which the named fields correspond to the columns in the database. 

* `file:close()` &mdash; Closes the database. In case of an error, this function returns a numerical [error&nbsp;code](http://lua.sqlite.org/index.cgi/doc/tip/doc/lsqlite3.wiki#numerical%20error%20and%20result%20codes).


## Examples

##### Create Table

``````lua
local sqlite3 = require( "sqlite3" )
local db = sqlite3.open_memory()
 
db:exec[[
  CREATE TABLE test (id INTEGER PRIMARY KEY, content);
  INSERT INTO test VALUES (NULL, 'Hello World');
  INSERT INTO test VALUES (NULL, 'Hello Lua');
  INSERT INTO test VALUES (NULL, 'Hello Sqlite3')
]]
 
print( "version " .. sqlite3.version() )
 
for row in db:nrows("SELECT * FROM test") do
  local t = display.newText( row.content, 20, 30*row.id, nil, 16 )
  t:setFillColor( 1, 0, 1 )
end
``````

##### Open File-Based Database

``````lua
local sqlite3 = require( "sqlite3" )

-- Open "data.db". If the file doesn't exist, it will be created
local path = system.pathForFile( "data.db", system.DocumentsDirectory )
local db = sqlite3.open( path )   

-- Handle the "applicationExit" event to close the database
local function onSystemEvent( event )
	if ( event.type == "applicationExit" ) then              
		db:close()
	end
end
 
-- Set up the table if it doesn't exist
local tablesetup = [[CREATE TABLE IF NOT EXISTS test (id INTEGER PRIMARY KEY, content, content2);]]
print( tablesetup )
db:exec( tablesetup )
 
-- Add rows with an auto index in 'id'. You don't need to specify a set of values because we're populating all of them.
local testvalue = {}
testvalue[1] = "Hello"
testvalue[2] = "World"
testvalue[3] = "Lua"
local tablefill = [[INSERT INTO test VALUES (NULL, ']]..testvalue[1]..[[',']]..testvalue[2]..[['); ]]
local tablefill2 = [[INSERT INTO test VALUES (NULL, ']]..testvalue[2]..[[',']]..testvalue[1]..[['); ]]
local tablefill3 = [[INSERT INTO test VALUES (NULL, ']]..testvalue[1]..[[',']]..testvalue[3]..[['); ]]
db:exec( tablefill )
db:exec( tablefill2 )
db:exec( tablefill3 )
 
-- Print the SQLite version
print( "SQLite version " .. sqlite3.version() )
 
-- Print the table contents
for row in db:nrows("SELECT * FROM test") do
	local text = row.content .. " " .. row.content2
	local t = display.newText( text, 20, 30*row.id, nil, 16 )
	t:setFillColor( 1, 0, 1 )
end

-- Setup the event listener to catch "applicationExit"
Runtime:addEventListener( "system", onSystemEvent )
``````
