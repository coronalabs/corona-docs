# gamecircle.FriendsReturn

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Table][api.type.Table]  
> __Library__           [gamecircle.*][plugin.gamecircle]  
> __Revision__          [REVISION_LABEL](REVISION_URL)  
> __Keywords__          player, friends, return, value, table  
> --------------------- ------------------------------------------------------------------------------------------

## Overview
Table that encapulates the error values and return value from the [GetBatchFriends][plugin.GetBatchFriends] function.
	
## Properties
- __isError__ - _[Boolean][api.type.Boolean]_  
	If the GameCircle SDK encountered an error, this value will be true.
- __errorMessage__ - _[String][api.type.String]_  
	If the GameCircle SDK encountered an error, this string will be populated with an error message.
- __num__ - _[Number][api.type.Number]_  
	The number of friend ids returned with the request. 
- __[]__ ___Square Bracket Accessor___ - _[Player][plugin.gamecircle.Player]_   
	The returned ids are stored as numerically-indexed entires on the table, ranging in value from 1 to "num". They can also be access using an ipairs interation, as in the example below.


## Example
 
``````lua
local gamecircle = require("plugin.gamecircle")  
gamecircle.Init(true, false, false)  
function FriendIdsCallback(returnTable)
	if returnTable.isError == true then
		print("Friend Ids Callback had an error: " .. returnTable.errorMessage)
	else
		print("===================Friend Ids Callback has returned!")
		for i = 1, returnTable.num do
			print("Friend Ids Found + " .. returnTable[i])
		end
		gamecircle.GetBatchFriends(returnTable, BatchFriendsCallback)
	end
end

function BatchFriendsCallback(returnTable)
	if returnTable.isError == true then
		print("Batch Friends Callback had an error: " .. returnTable.errorMessage)
	else
		print("===================Batch Friends Callback has returned!")
		for i = 1, returnTable.num do
			print("--Friend Found: " .. returnTable[i].alias)
		end
		gamecircle.GetBatchFriends(returnTable, BatchFriendsCallback)
	end
end
gamecircle.GetFriendIds(FriendIdsCallback)  
``````