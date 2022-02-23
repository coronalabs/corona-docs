# gamecircle.Whispersync.Metadata

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Table][api.type.Table]  
> __Library__           [gamecircle.*][plugin.gamecircle]  
> __Revision__          [REVISION_LABEL](REVISION_URL)  
> __Keywords__          whispersync, metadata, user-generated  
> --------------------- ------------------------------------------------------------------------------------------

## Overview
A table made by the developer that can be tied to numerous data values that can be kept using Whispersync. Is useful including additional date for numbers and single strings. Example: a metatable can be used to save a user's initials for a classical high-score table when that table's scores are stored in a Whispersync HighNumberList. 

## The Rules
The metadata table is something the developer must be generated when using Set functions in Whispersync that can accept metadata as a parameter. The metadata will be stored with the data being assigned in the Set function and, when using a corresponding get function, the same metadata will be returned. 

The metadata table can only be a lua table comprised of string fields with string values in those fields. Number fields and non-string values stored in fields will either be changed into strings, not be stored with the metadata, or can even cause an runtime error in the system.

This is an example of a valid metadata table.

	local metadata = {}
	metadata.initials = "LOL"
	metadata.fullname = " Lewis Oswald Lexington"
	metadata.basescore = "2091768"
	metadata.timebonus = "80000"
	gamecircle.Whispersync.AddToHighNumberList("LocalHighscoreTable", 8675309, "INT", metadata)
	--This metadata is VALID
	

In this example, the metadata table is __invalid__ because the metadata about the total score is  being saved as numbers instead of strings.

	local metadata = {}
	metadata.initials = "LOL"
	metadata.fullname = " Lewis Oswald Lexington"
	metadata.basescore = 2091768
	metadata.timebonus = 80000
	gamecircle.Whispersync.AddToHighNumberList("LocalHighscoreTable", 8675309, "INT", metadata)
	--THIS METADATA IS INVALID, AND MAY NOT BE SAVED CORRECTLY OR COULD CAUSE A CRASH
	

In this example, the metadata table is __invalid__ because it uses number fields.

	local metadata = {}
	metadata[1] = "LOL"
	metadata[2]= " Lewis Oswald Lexington"
	metadata[3]= 2091768
	metadata[4] = 80000
	gamecircle.Whispersync.AddToHighNumberList("LocalHighscoreTable", 8675309, "INT", metadata)
	--THIS METADATA IS INVALID, AND MAY NOT BE SAVED CORRECTLY OR COULD CAUSE A CRASH
	
## Example
 
``````lua  
local numID = "LocalHighscore"  
local gamecircle = require("plugin.gamecircle")  
gamecircle.Init(false, false, true)  
local metadata = {}  
metadata.initials = "LOL"  
metadata.fullname = " Lewis Oswald Lexington"  
metadata.basescore = "2091768"  
metadata.timebonus = "80000"  
gamecircle.Whispersync.SetHighestNumber(numID, 8675309, "INT", metadata)  
local syncNum = gamecircle.WHispersync.GetHighestNumber(numID, "INT")  
print("The highscore " .. syncNum.value .. " was earned by " .. syncNum.metadata.initials)  
``````