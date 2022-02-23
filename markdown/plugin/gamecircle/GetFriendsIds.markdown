# gamecircle.GetFriendsIds()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [function][api.type.Function]  
> __Library__           [gamecircle.*][plugin.gamecircle]  
> __Return value__      None  
> __Revision__          [REVISION_LABEL](REVISION_URL)  
> __Keywords__          gamecircle, player, profile  
> --------------------- ------------------------------------------------------------------------------------------


## Overview
This function allows you to fetch the ids of the current player's friends.

## Syntax

``````lua
gamecircle.GetFriendIds(callback)
``````
	
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