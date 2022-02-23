# gameNetwork.show()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [gameNetwork.*][api.library.gameNetwork]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          gameNetwork, Google Play Game Services
> __See also__          [gameNetwork.init()][plugin.gameNetwork-google.init]
>								[gameNetwork.request()][plugin.gameNetwork-google.request]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Displays the requested game network information to the user.


## Syntax

	gameNetwork.show( command [, params ] )

##### command ~^(required)^~
_[String][api.type.String]._ String value as supported by Google Play Game Services:

* `"leaderboards"`
* `"achievements"`
* `"selectPlayers"`
* `"waitingRoom"`
* `"invitations"`

##### params ~^(optional)^~
_[Table][api.type.Table]._ Table of parameters allowed by Google Play Game Services &mdash; see the next section for details.


## Parameter Reference

Depending on the specified `command` parameter, the contents of the `params` table will vary.

### Listener Function

For most calls to `gameNetwork.show()`, the `params` table supports a `listener` key with its value as a callback function to monitor the call result, for example:

``````lua
gameNetwork.show( "invitations", { listener=invitationListener } )
``````

### Leaderboards

For the `command` parameter of `"leaderboards"`, this function shows the leaderboard screen. Once there, the user can navigate to the different types of leaderboards. This function does not require a `params` table or callback listener.

``````lua
gameNetwork.show( "leaderboards" )
``````

### Achievements

For the `command` parameter of `"achievements"`, this function shows the achievements screen. This screen includes both achievements that the player has obtained and those achievements not yet obtained. This function does not require a `params` table or callback listener.

``````lua
gameNetwork.show( "achievements" )
``````

### Select Players

For the `command` parameter of `"selectPlayers"`, this function shows a screen where the player can select which players to invite to a game or, alternatively, choose to use <nobr>auto-match</nobr>.

``````lua
local function selectPlayersListener( event )
	print( event.data[1], event.data[2], event.data[3] ) --selected player IDs
	print( event.data.minAutoMatchPlayers )
	print( event.data.maxAutoMatchPlayers )
	print( event.data.phase )
end

gameNetwork.show( "selectPlayers",
	{
		minPlayers = 1,  --this value does not include the current player
		maxPlayers = 3,  --this value does not include the current player
		listener = selectPlayersListener
	}
)
``````

Inside the the `params` table, the following optional keys apply:

* `minPlayers` &mdash; Number which specifies the minimum number of players in a multiplayer game. This value does __not__ include the current player.

* `maxPlayers` &mdash; Number which specifies the maximum number of players in a multiplayer game. This value does __not__ include the current player.

When handling the results of a `"selectPlayers"` call, `event.data` in the callback listener contains an array of player&nbsp;IDs selected. Additionally, `event.data` contains the following properties:

* `minAutoMatchPlayers` ([number][api.type.Number]) &mdash; The minimum number of <nobr>auto-matched</nobr> players.
* `maxAutoMatchPlayers` ([number][api.type.Number]) &mdash; The maximum number of <nobr>auto-matched</nobr> players.
* `phase` ([string][api.type.String]) &mdash; The phase value of either `"selected"` or `"cancelled"`.

### Waiting Room

For the `command` parameter of `"waitingRoom"`, this function shows the waiting room screen.

``````lua
local function waitingRoomListener( event )
	print( event.type )  --"waitingRoom"
	print( event.data[1], event.data[2], event.data[3] )  --participant IDs
	print( event.data.roomID )
	print( event.data.phase )
	print( event.data.isError )
end

-- Display the waiting room screen for a specific room
-- If the user exits the waiting room, he/she will exit the room automatically
gameNetwork.show( "waitingRoom",
	{
		roomID = "3487324234",
		minPlayers = 2,
		listener = waitingRoomListener
	}
)
``````

Inside the the `params` table, the following keys apply:

* `roomID` &mdash; String value representing the room ID of the waiting room.

* `minPlayers` &mdash; Specifies the minimum number of players required before the game can begin.

When handling the results of a `"waitingRoom"` call, `event.data` in the callback listener contains an array of participant&nbsp;IDs. Additionally, `event.data` contains the following properties:

* `roomID` ([string][api.type.String]) &mdash; The room ID of the waiting room.
* `phase` ([string][api.type.String]) &mdash; Value of `"start"` when the game can begin or `"cancel"` if the user exited the waiting room screen.
* `isError` ([boolean][api.type.Boolean]) &mdash; Boolean specifying if an error occurred or not.

### Invitations

For the `command` parameter of `"invitations"`, this function shows the current invitations for the user.

````lua
local function invitationListener( event )
	print( event.data.roomID )
	print( event.data.phase )
	print( event.data.isError )
end

gameNetwork.show( "invitations",
	{
		listener = invitationListener
	}
)
`````

When handling the results of a `"invitations"` call, `event.data` in the callback listener contains the following properties:

* `roomID` ([string][api.type.String]) &mdash; ID of the room the player selected.
* `phase` ([string][api.type.String]) &mdash; The phase value of either `"selected"` or `"cancelled"`.
* `isError` ([boolean][api.type.Boolean]) &mdash; Boolean specifying if an error occurred or not.
