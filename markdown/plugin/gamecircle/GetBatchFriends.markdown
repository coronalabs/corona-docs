# gamecircle.GetBatchFriends()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [function][api.type.Function]  
> __Library__           [gamecircle.*][plugin.gamecircle]  
> __Return value__      None  
> __Revision__          [REVISION_LABEL](REVISION_URL)  
> __Keywords__          gamecircle, player, profile  
> --------------------- ------------------------------------------------------------------------------------------


## Overview
This function allows you to fetch the _[Player][plugin.gamecircle.Player]_ information of the local player's friends based on provided Id's.

## Syntax

``````lua
gamecircle.GetBatchFriends(idsTable, callback)
``````
	
##### idsTable ~^(required)^~
_[Table][api.type.Table]._ A table of ids for the local player's friends. These Id's can be fetched using [GetFriendsIds][gamecircle.GetFriendsIds]. As seen in the example below, the result of [GetFriendsIds][gamecircle.GetFriendsIds] can be fed straight into this function to provide ids. If, however, you wish to build your own table of ids, then the ids must be stored correctly. They must be of type _[String][api.type.String]_ and stored in a table via square bracket accessors with consecuitive numbering.
	
##### callback ~^(required)^~
_[Function][api.type.Function]._ Pass to a callback function since the request requires the GameCircle SDK to contact Amazon's servers. The callback will recieve a single parameter of a [FriendIdsReturn][gamecircle.FriendIdsReturn].


## Examples

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