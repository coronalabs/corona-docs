
# gameNetwork.show()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [gameNetwork.*][api.library.gameNetwork]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          gameNetwork, Game Center
> __See also__          [gameNetwork.init()][plugin.gameNetwork-apple.init]
>						[gameNetwork.request()][plugin.gameNetwork-apple.request]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Displays the requested game network information to the user.


## Syntax

	gameNetwork.show( command [, params ] )

##### command ~^(required)^~
_[String][api.type.String]._ String value as supported by Game Center.

* `"leaderboards"`
* `"achievements"`
* `"friendRequest"`
* `"matches"`
* `"createMatch"`

##### params ~^(optional)^~
_[Table][api.type.Table]._ Table of parameters allowed by Game Center — see the next section for details.


## Parameter Reference

Depending on the specified `command` parameter, the contents of the `params` table will vary.

### Listener Function

For all calls to `gameNetwork.show()`, the `params` table supports a `listener` key with its value as a callback function to monitor the call result, for example:

``````lua
gameNetwork.show( "achievements", { listener=showAchievements } )
``````

### Achievements

For the `command` parameter of `"achievements"`, this function shows the player's completed achievements for the app.

``````lua
gameNetwork.show( "achievements", { listener=showAchievements } )
``````

### Leaderboards

For the `command` parameter of `"leaderboards"`, `"leaderboard"` is an optional key in the `params` table which in turn accepts another table. This table may contain the following optional keys:

* `"category"` — The leaderboard to show.

``````lua
gameNetwork.show( "leaderboards",
	{
		leaderboard = {
			category = "com.appledts.EasyTapList"
		},
		listener = showLeaders
	}
)
``````

<!---

* `"playerScope"` — String of either `"Global"` or `"FriendsOnly"`. The latter setting will restrict the shown scores to only friends.

* `"timeScope"` — String value of either `"Today"`, `"Week"`, or `"AllTime"`.

* `"range"` — Array of two integer values which filters scores to a specific range. For example, `{ 1,10 }` returns the best 10 scores.

``````lua
gameNetwork.show( "leaderboards",
	{
		leaderboard = {
			category = "com.appledts.EasyTapList",
			playerScope = "Global",
			timeScope = "Week",
			range = { 1,100 }
		},
		listener = showLeaders
	}
)
``````

-->

### Friend Request

For the `command` parameter of `"friendRequest"`, the `params` table may contain the following optional keys:

* `message` — String value which pre-populates the message field with custom text.

* `playerIDs` — Array of strings of Game Center player IDs representing the players you want to send a friend request to.

* `emailAddresses` — Array of strings representing email addresses of players you want to send a friend request to.

``````lua
local parameters = {
	message = "Be my friend please",
	playerIDs = { "G:194669300", "G:1435127232" },
	emailAddresses = { "me@me.com" },
	listener = requestFriends
}
gameNetwork.show( "friendRequest", parameters )
``````

Note that the total number of player IDs and email addresses must not exceed the Game Center maximum limit or the OS will throw an exception. You can read this limit by calling `gameNetwork.request( "loadFriendRequestMaxNumberOfRecipients" )`.

### Matches

For the `command` parameter of `"matches"`, this function shows the current/active matches __and__ allows the player to create a new match from the same interface screen. The following keys are accepted in the `params` table:

* `minPlayers` — Number which specifies the minimum number of players in a multiplayer game.

* `maxPlayers` — Number which specifies the maximum number of players in a multiplayer game.

* `playerGroup` — An arbitrary number used to <nobr>auto-match</nobr> only players whose match request shares the same number. Setting this property to `0` allows the player to be <nobr>auto-matched</nobr> into any waiting match.

* `playerAttributes` — Mask that specifies the role that the local player would like to play in the game.

``````lua
local parameters = {
	minPlayers = 2,
	maxPlayers = 3,
	playerGroup = 0,
	playerAttributes = { 1, 4, 6 },
	listener = showMatches
}
gameNetwork.show( "matches", parameters )
``````

### Create Match

For the `command` parameter of `"createMatch"`, this function shows the Game Center interface screen which allows players to create/manage a match. The following keys are accepted in the `params` table:

* `playerIDs` — Optional array of strings representing the player IDs of people to initially invite to the match.

* `minPlayers` — Optional value for the minimum number of players required in the match.

* `maxPlayers` — Optional value for the maximum number of players allowed in the match.

* `playerGroup` — An arbitrary number used to <nobr>auto-match</nobr> only players whose match request shares the same number. Setting this property to `0` allows the player to be <nobr>auto-matched</nobr> into any waiting match.

* `playerAttributes` — Mask that specifies the role that the local player would like to play in the game.

* `inviteMessage` — Custom invitation message for the match.

``````lua
local parameters = {
	playerIDs = { "w4o98y3498hg349h", "wrighfq547hg543" },
	minPlayers = 2,
	maxPlayers = 3,
	playerGroup = 0,
	playerAttributes = { 1, 4, 6 },
	inviteMessage = "Hi, please join our match!",
	listener = createNewMatch
}
gameNetwork.show( "createMatch", parameters )
``````


## Example

`````lua
local function onGameNetworkPopupDismissed( event )
	-- Game Center popup was closed
	for k,v in pairs( event ) do
		print( k,v )
	end
end

-- Display a leaderboard
gameNetwork.show( "leaderboards",
	{
		leaderboard = {
			category = "com.appledts.EasyTapList"
		},
		listener = onGameNetworkPopupDismissed
	}
)

-- Display the player's achievements
gameNetwork.show( "achievements", { listener=onGameNetworkPopupDismissed } )

-- Display a friend request popup
local friendRequestParams = {
	message = "Let's match up in Game Center!",
	playerIDs = { "G:194669300", "G:1435127232" },
	emailAddresses = { "me@me.com" },
	listener = onGameNetworkPopupDismissed
}
gameNetwork.show( "friendRequest", friendRequestParams )

-- Display a popup which shows the current/active matches AND allows the player to create a new match
local matchesParams = {
	minPlayers = 2,
	maxPlayers = 3,
	listener = onGameNetworkPopupDismissed
}
gameNetwork.show( "matches", matchesParams )

-- Display a popup which lets the user create a new match and invite other players
local createMatchParams = {
	playerIDs = { "w4o98y3498hg349h", "wrighfq547hg543" },
	minPlayers = 2,
	maxPlayers = 3,
	inviteMessage = "Hi, please join our match!",
	listener = onGameNetworkPopupDismissed
}
gameNetwork.show( "createMatch", createMatchParams )
`````