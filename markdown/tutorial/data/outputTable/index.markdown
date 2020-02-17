# Outputting Table Contents

In Lua, you will commonly need to store items or references in a table, and sometimes it's necessary to know which items/members exist inside that table. This is simple enough to do with a <nobr>key-value</nobr> loop using the Lua `pairs()` function:

``````{ brush="lua" gutter="false" first-line="1" highlight="[8,9,10]" }
local myTable = {
	firstName = "Fred",
	lastName = "Bob",
	phoneNumber = "(555) 555-1212",
	age = 30
}

for k,v in pairs(myTable) do
	print( k,v )
end
``````

This will output something like the following to the console:

``````
firstName	Fred
age	30
lastName	Bob
phoneNumber	(555) 555-1212
``````

Note that the order may differ since the `pairs()` function does not necessarily iterate through the table in the same order in which the <nobr>key-values</nobr> were declared. However, if you only need to check for a key's existence and its value, this loop method is perfectly acceptable.


## What About Sub-Tables?

What if your table has <nobr>__sub-tables__</nobr> as in the following example?

``````{ brush="lua" gutter="false" first-line="1" highlight="[6,7]" }
local myTable = {
	firstName = "Fred",
	lastName = "Bob",
	phoneNumber = "(555) 555-1212",
	age = 30,
	favoriteSports = { "Baseball", "Hockey", "Soccer" },
	favoriteTeams  = { "Cowboys", "Panthers", "Lightning" }
}
``````

In this case, the `pairs()` loop method will output something like this:

``````
firstName	Fred
favoriteSports	table: 0x7fb1bbd00750
phoneNumber	(555) 555-1212
favoriteTeams	table: 0x7fb1bbd00340
lastName	Bob
age	30
``````

As you can see, the loop will display the internal references to those tables, for example `0x7fb1bbd00750`, but it won't display the actual __content__ <nobr>(keys or values)</nobr> of the <nobr>sub-tables</nobr>.


## Convenience Function

Fortunately, we can use a powerful function that will intelligently step through tables __and__ <nobr>sub-tables</nobr>, revealing the contents for your reference. Here is the function in its entirety:

``````lua
local function printTable( t )

	local printTable_cache = {}

	local function sub_printTable( t, indent )

		if ( printTable_cache[tostring(t)] ) then
			print( indent .. "*" .. tostring(t) )
		else
			printTable_cache[tostring(t)] = true
			if ( type( t ) == "table" ) then
				for pos,val in pairs( t ) do
					if ( type(val) == "table" ) then
						print( indent .. "[" .. pos .. "] => " .. tostring( t ).. " {" )
						sub_printTable( val, indent .. string.rep( " ", string.len(pos)+8 ) )
						print( indent .. string.rep( " ", string.len(pos)+6 ) .. "}" )
					elseif ( type(val) == "string" ) then
						print( indent .. "[" .. pos .. '] => "' .. val .. '"' )
					else
						print( indent .. "[" .. pos .. "] => " .. tostring(val) )
					end
				end
			else
				print( indent..tostring(t) )
			end
		end
	end

	if ( type(t) == "table" ) then
		print( tostring(t) .. " {" )
		sub_printTable( t, "  " )
		print( "}" )
	else
		sub_printTable( t, "  " )
	end
end
``````

This function will navigate through the <nobr>tables/sub-tables</nobr> and output the contents. To use it, simply call the function and pass in the table reference you want to output, for example:

``````lua
printTable( myTable )
``````

In this case, the output becomes:

``````
table: 0x600001260c00 {
  [firstName] => "Fred"
  [favoriteSports] => table: 0x600001260c00 {
                        [1] => "Baseball"
                        [2] => "Hockey"
                        [3] => "Soccer"
                      }
  [phoneNumber] => "(555) 555-1212"
  [favoriteTeams] => table: 0x600001260c00 {
                       [1] => "Cowboys"
                       [2] => "Panthers"
                       [3] => "Lightning"
                     }
  [lastName] => "Bob"
  [age] => 30
}
``````

As you can see, this function makes the table contents significantly easier to read! Also, when applicable, it shows the __index&nbsp;value__ of <nobr>non-key</nobr> items within a table, for instance <nobr>`[2] => "Hockey"`</nobr>, which can be extremely useful when accessing table contents in associated code within your app.


## Alternative Reference

Since this function is for outputting table contents, it may not be intuitive to use it directly as in:

``````lua
printTable( myTable )
``````

Thus, an alternative is to add the `printTable()` function to the Lua `table` library object as so:

``````lua
table.print = printTable
``````

Then, calling it via the reference becomes more sensible:

``````
table.print( myTable )
``````


## Conclusion

Using tables to store items and references is focal to any serious development in Lua and Corona, and knowing the content of those tables is often essential to debugging. Hopefully this convenience function will help you throughout the course of your development!
