# Database Access Using SQLite

The topic of databases is <nobr>far-reaching</nobr> in the world of programming, especially for web developers, and for good reason. Databases are great for storing and organizing a lot of information, and when it comes to retrieving that data for later use, there's rarely a better option.

For instance, if you are writing a "notes" app, you should ideally store the user's individual notes in a database. Sure, you could just store each note as a separate text file, but then you'd potentially have a large number of files to deal with separately, versus a consolidated database file. An even bigger hindrance would be that tasks such as sorting and searching&nbsp;&mdash; both commonplace in the world of databases&nbsp;&mdash; would be nearly impossible.

In this tutorial, we'll walk through creating a database, saving it to a file, storing information, and retrieving that data for use in a Corona app.

<div class="guide-notebox">
<div class="notebox-title">What About JSON?</div>

Developers familiar with [JSON][api.library.json] know that it's great for storing similar types of information easily, because a decoded JSON string in Corona comes back as a Lua table. So why would you use JSON in favor of a database or <nobr>vice-versa?</nobr> Both are powerful tools, but they have key differences which should be leveraged depending on the needs of your app&nbsp;&mdash; in other words, let the best tool for the job win!

A basic rule of thumb when deciding which one to use is, if it's a large amount of data&nbsp;&mdash; and especially if the data needs to be searched or sorted&nbsp;&mdash; a database is the clear winner every time. However, for smaller sets of data such as tables that store configuration data, JSON wins because of its simplicity.

For more details on saving and loading data in JSON format, please see the [Saving/Loading Tables Using JSON][tutorial.data.jsonSaveLoad] tutorial.

</div>


## Creating a Database

There are two ways you can go about creating a SQLite database:

1. Create an <nobr>in-memory</nobr> database with a lifespan that only extends as far as the runtime of the app.
2. Create a database file that can be stored and accessed at any time.

Since you almost certainly want to store data for future access, this tutorial will only discuss the second method.

This example shows how to open a saved database file and/or create a database file that does not yet exist:

``````lua
-- Require the SQLite library
local sqlite3 = require( "sqlite3" )

-- Create a file path for the database file "data.db"
local path = system.pathForFile( "data.db", system.DocumentsDirectory )

-- Open the database for access
local db = sqlite3.open( path )
``````

<div class="docs-tip-outer">
<div class="docs-tip-inner-left">
<div class="fa fa-cog"></div>
</div>
<div class="docs-tip-inner-right">

Note that the recommended location for creating a database is `system.DocumentsDirectory`, as shown in this example. Your project resource directory cannot be written to, and the temporary/cache directories are periodically wiped clean by the OS, so using the documents directory will ensure that you're able to read/write from/to your database and that it resides in a safe, persistent location.

</div>
</div>


## Creating a Table

Some common terms you'll hear when working with SQLite databases include __tables__ (not&nbsp;Lua&nbsp;tables, but&nbsp;SQL&nbsp;tables), __columns__, and __rows__. Basically, SQL __tables__ can be thought of as "categories" of data. Each table, in turn, can have multiple __columns__ which can be thought of as "properties" of the table, for example `UserID`, `FirstName`, `LastName`, etc. Finally, the individual "records" which are inserted into tables are known as __rows__.

Rows&nbsp;&mdash; and more specifically their properties&nbsp;&mdash; are the actual data you'll most commonly be working with, but before we can add rows, we must set up a table with specific columns:

``````lua
local tableSetup = [[CREATE TABLE IF NOT EXISTS test ( UserID INTEGER PRIMARY KEY autoincrement, FirstName, LastName );]]
db:exec( tableSetup )
``````

In the above code, `tableSetup` is a string that represents an __SQL&nbsp;query__&nbsp;&mdash; basically, a command that tells the database what to do. In this case, we will create a __table__ called `test` with three __columns__:

1. `UserID`
2. `FirstName`
3. `LastName`

Following that, we simply "execute" the query on the database object we created above (`db`).

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

* The first column in a table is usually an "ID" column that is set to be an <nobr>auto-incrementing</nobr> __primary&nbsp;key__. This is an extremely important column in almost every database table because it provides you with a permanent, unique identification value for each __row__ in the database. This identification value lets you access a specific row, update a property of that row, or even delete the entire row if necessary. Essentially, you should always set up an <nobr>auto-incrementing</nobr> primary&nbsp;key unless you have a very specific reason not to.

* Note that the query string is wrapped in double brackets <nobr>(`[[` and `]]`)</nobr> instead of quotes. This is because it's possible to use both single and double quotes in a SQL query, so using brackets is the safest option.

</div>


## Creating New Rows

Creating new rows is accomplished via the `INSERT` statement. First, we'll illustrate the basic usage, then we'll go over a more dynamic example.

``````lua
local insertQuery = [[INSERT INTO test VALUES ( NULL, "John", "Smith" );]]
db:exec( insertQuery )
``````

This example is rather straightforward:

* In the previous code, we created a table called `test` and now we "insert&nbsp;into" that `test` table.

* For the row's values, we list them within parentheses (`()`) following the `VALUES` term in the __same&nbsp;order__ as the declaration of columns when we created the table. This consistent ordering is very important!

<div class="code-indent">
<div class="docs-tip-outer">
<div class="docs-tip-inner-left">
<div class="fa fa-cog"></div>
</div>
<div class="docs-tip-inner-right">

Remember that `UserID` will <nobr>auto-increment</nobr> to the next number because of the `autoincrement` flag&nbsp;&mdash; this is why we're able to pass `NULL` as that column value instead of an actual number.

</div>
</div>
</div>


## Lua Table to SQL Table

Now, let's get creative with a more dynamic example. The following code will insert three rows into the SQL table (`test`) based on values extracted from a Lua table (this&nbsp;assumes that you've already created the database and the `test`&nbsp;table).

``````lua
local people = {
	{
		FirstName = "John",
		LastName = "Smith",
	},
	{
		FirstName = "James",
		LastName = "Nelson",
	},
	{
		FirstName = "Tricia",
		LastName = "Cole",
	},
}

for i = 1,#people do
	local q = [[INSERT INTO test VALUES ( NULL, "]] .. people[i].FirstName .. [[","]] .. people[i].LastName .. [[" );]]
	db:exec( q )
end
``````

## Updating Existing Rows

You won't always need to create a new row&nbsp;&mdash; in fact, you'll often need to __update__ a row that already exists. In the following example, we'll assume that the three rows from the previous example are already inserted into the `test` table.

``````lua
local q = [[UPDATE test SET FirstName="Trisha" WHERE UserID=3;]]
db:exec( q )
``````

Essentially, this query finds the row where `UserID` <nobr>(the primary key)</nobr> equals `3` and changes the `FirstName` value to `Trisha`. While you don't necessarily need to use the primary&nbsp;key column to find the row, it's often the easiest way to locate a specific row since it will always be unique.


## Deleting a Row

The SQL query for __deleting__ a row looks very similar to the query we used to update a row, with the primary difference being the use of <nobr>`DELETE FROM`</nobr> rather than `UPDATE`. The following example removes the <nobr>`John Smith`</nobr> row from the `test` table:

``````lua
local q = [[DELETE FROM test WHERE UserID=1;]]
db:exec( q )
``````


## Retrieving Data

There are several ways to retrieve data from an SQL database. Sometimes you'll want a single specific row, while other times you might need __all__ of the rows in a specific table. In other instances, to narrow it down slightly, you might want only a subset of rows in a certain table based on specific criteria. All of this (and&nbsp;more) is possible with SQLite!

The following example illustrates how to load an existing database from a file and populate a Lua array from the rows of a specific query. This assumes that `data.db` has our <nobr>3-person</nobr> table (`test`) included within it:

``````{ brush="lua" gutter="true" first-line="1" }
-- Require the SQLite library
local sqlite3 = require( "sqlite3" )

-- Create a file path for the database file "data.db"
local path = system.pathForFile( "data.db", system.DocumentsDirectory )

-- Open the database for access
local db = sqlite3.open( path )

-- Create empty "people" table
local people = {}

-- Loop through database table rows via a SELECT query
for row in db:nrows( "SELECT * FROM test" ) do

	print( "Row:", row.UserID )

	-- Create sub-table at next available index of "people" table
	people[#people+1] =
	{
		FirstName = row.FirstName,
		LastName = row.LastName
	}
end
``````

The most important point of focus is line&nbsp;14 where we execute a SQL `SELECT` statement and return an iterator via the `nrows()` method to be used in conjunction with a `for` loop, making it easy to go through all of the rows which were found. In this example, we simply copy the data over to the `people` array so that we can use it later in the app.

<div class="docs-tip-outer">
<div class="docs-tip-inner-left">
<div class="fa fa-cog"></div>
</div>
<div class="docs-tip-inner-right">

For more information on using the `SELECT` command to filter data, read [this article](http://zetcode.com/db/sqlite/).

</div>
</div>


## Closing the Database

When you're finished accessing a database, it's very important that you close the "connection" to it by calling the `close()` method on the database object, for example `db:close()`:

``````lua
if ( db and db:isopen() ) then
	db:close()
end
``````

Of course this code must exist in the correct scope of the database object you're closing&nbsp;&mdash; the `db` object in the example above&nbsp;&mdash; so that Lua understands which database it should close.


## Conclusion

That wraps up the essentials of database access in Corona. However, we've only scratched the surface of what's possible with SQLite, so we encourage you to explore further to discover what's possible, starting with our SQLite [documentation][api.library.sqlite3].
