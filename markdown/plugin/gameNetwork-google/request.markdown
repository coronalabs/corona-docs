# gameNetwork.request()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [gameNetwork.*][api.library.gameNetwork]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          gameNetwork, Google Play Game Services
> __See also__          [gameNetwork.init()][plugin.gameNetwork-google.init]
>								[gameNetwork.show()][plugin.gameNetwork-google.show]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Send or request information to/from [Google Play Game Services](http://developer.android.com/google/play-services/games.html).


## Syntax

    gameNetwork.request( command [, params] )

##### command ~^(required)^~
_[String][api.type.String]._ String value as supported by Google Play Game Services &mdash; see [Command&nbsp;Reference](#commands) below.

##### params ~^(optional)^~
_[Table][api.type.Table]._ Table of parameters allowed by Google Play Game Services &mdash; see [Parameter&nbsp;Reference](#params) below.


<a id="commands">

## Command Reference

For the `command` parameter, Google Play Game Services supports the following values:

* `"setHighScore"`
* `"loadScores"`
* `"loadLocalPlayer"`
* `"loadPlayers"`
* `"loadFriends"`
* `"loadAchievements"`
* `"unlockAchievement"`
* `"loadAchievementDescriptions"`
* `"loadLeaderboardCategories"`
* `"isConnected"`
* `"login"`
* `"logout"`
* `"createRoom"`
* `"joinRoom"`
* `"leaveRoom"`
* `"setRoomListener"`
* `"sendMessage"`
* `"setMessageReceivedListener"`
* `"setInvitationReceivedListener"`


<a id="params">

## Parameter Reference

Depending on the specified `command` parameter, the contents of the `params` table will vary.

### Listener Function

For most calls to `gameNetwork.request()`, the `params` table supports a `listener` key with its value as a callback listener function to monitor the call result. In the callback listener, `event.type` indicates the request that was executed, along with other data specific to each request type as outlined below.

``````lua
local function requestCallback( event )

	if ( event.type == "setHighScore" ) then
		--high score has been set
	end
end

gameNetwork.request( "setHighScore",
	{
		localPlayerScore = { category="Cy_sd893DEewf3", value=25 },
		listener = requestCallback
	}
)
``````

### Set High Score

For the `command` parameter of `"setHighScore"`, this function sets a high score for the currently <nobr>logged-in</nobr> user for the specified leaderboard (`category`). If the high score is not higher than the one currently on the server, the server will keep the highest value.

``````lua
gameNetwork.request( "setHighScore",
	{
		localPlayerScore = { category="Cy_sd893DEewf3", value=25 },
		listener = requestCallback
	}
)
``````

In the `params` table, `localPlayerScore` is a required table within which the following <nobr>key-values</nobr> apply:

* `category` &mdash; String that matches the ID of the leaderboard you want to register the score with as entered in Google's developer console.

* `value` &mdash; Number representing the score.

When handling the results of a `"setHighScore"` call, `event.data` in the callback listener is an array of items (tables). Each contains the following properties:

* `playerID` ([string][api.type.String])
* `category` ([string][api.type.String])
* `value` ([number][api.type.Number])
* `formattedValue` ([string][api.type.String]) &mdash; The formatted value of the submitted score.

### Load Scores

For the `command` parameter of `"loadScores"`, this function retrieves scores based on various filters.

``````lua
gameNetwork.request( "loadScores",
	{
		leaderboard =
		{
			category = "Cy_SLDWING4334h",
			playerScope = "Global",   -- Global, FriendsOnly
			timeScope = "AllTime",    -- AllTime, Week, Today
			range = { 1,5 },
			playerCentered = true
		},
		listener = requestCallback
	}
)
``````

Inside the `params` table, `leaderboard` is a required table within which the following <nobr>key-values</nobr> apply:

* `category` &mdash; Required string that matches the name of the board from which you want to fetch scores.

* `playerScope` &mdash; Optional string of either `"Global"` or `"FriendsOnly"`. The latter setting will restrict the fetched scores to people in the player's circles.

* `timeScope` &mdash; Optional string of either `"AllTime"`, `"Week"`, or `"Today"` which limits the fetched scores to a specified time range.

* `range` &mdash; Optional array of two integer values. For Google Play Game Services, the first value is ignored, while the second value represents the number of players to retrieve (no&nbsp;more&nbsp;than&nbsp;25). The default range is `{ 1,25 }`.

* `playerCentered` &mdash; Optional boolean value. If `true`, the call will return the scores that are centered around the currently <nobr>logged-in</nobr> user. If `false`, the call will simply return the top scores.

When handling the results of a `"loadScores"` call, `event.data` in the callback listener is an array of items (tables). Each contains the following properties:

* `playerID` ([string][api.type.String])
* `category` ([string][api.type.String])
* `value` ([number][api.type.Number])
* `date` ([string][api.type.String])
* `formattedValue` ([string][api.type.String])
* `rank` ([integer][api.type.Number])
* `unixTime` ([integer][api.type.Number])

``````lua
event.data[1].playerID  --ID of the first player in the request
event.data[3].rank      --rank of the third player in the request
``````

### Load Local Player

For the `command` parameter of `"loadLocalPlayer"`, this function requests data for the currently <nobr>logged-in</nobr> player.

``````lua
gameNetwork.request( "loadLocalPlayer", { listener=requestCallback } )
``````

When handling the results of a `"loadLocalPlayer"` call, `event.data` in the callback listener contains the following properties:

* `playerID` ([string][api.type.String])
* `alias` ([string][api.type.String])

<div style="width: 400px;">

``````lua
event.data.playerID
event.data.alias
``````

</div>

### Load Players

For the `command` parameter of `"loadPlayers"`, this function requests data for a list of players based on their player IDs.

``````lua
gameNetwork.request( "loadPlayers",
	{
		playerIDs =
		{
			"45987354897345345",
			"32238975789573445",
			"17891241248435990"
		},
		listener = requestCallback
	}
)
``````

When handling the results of a `"loadPlayers"` call, `event.data` in the callback listener is an array of items (tables). Each contains the following properties:

* `playerID` ([string][api.type.String])
* `alias` ([string][api.type.String])

``````lua
event.data[1].playerID  --ID of the first player in the request
event.data[3].alias     --alias of the third player in the request
``````

### Load Friends

For the `command` parameter of `"loadFriends"`, this function requests the friends of the currently <nobr>logged-in</nobr> player.

``````lua
gameNetwork.request( "loadFriends", { listener=requestCallback } )
``````

When handling the results of a `"loadFriends"` call, `event.data` in the callback listener is an array of items (tables) corresponding to each friend.

<div style="width: 400px;">

``````lua
event.data[2].playerID
event.data[2].alias
``````

</div>

### Load Achievements / Load Achievement Descriptions

For the `command` parameter of `"loadAchievements"` or `"loadAchievementDescriptions"`, this function loads a list of the player's completed achievements for the app.

``````lua
gameNetwork.request( "loadAchievements", { listener=requestCallback } )
``````

When handling the results of a `"loadAchievements"` or `"loadAchievementDescriptions"` call, `event.data` in the callback listener is an array of items (tables) representing each achievement. Each table contains the following properties:

* `identifier` ([string][api.type.String])
* `title` ([string][api.type.String])
* `description` ([string][api.type.String])
* `isCompleted` ([boolean][api.type.Boolean])
* `isHidden` ([boolean][api.type.Boolean])
* `lastReportedDate` ([number][api.type.Number])

``````lua
event.data[4].identifier   --identifier for the fourth achievement
event.data[2].description  --description of the second achievement 
``````

### Unlock Achievement

For the `command` parameter of `"unlockAchievement"`, this function unlocks/sets the specified achievement (`identifier`).

``````lua
gameNetwork.request( "unlockAchievement",
	{
		achievement =
		{
			identifier = "CY_w895w9w55w454"
		},
		listener = requestCallback
	}
)
``````

Inside the `params` table, `achievement` is a required table wherein `identifier` ([string][api.type.String]) must match the name of the achievement you want to unlock/report, as entered in Google's developer console.

When handling the results of a `"unlockAchievement"` call, `event.data` in the callback listener contains an `achievementId` identifier ([string][api.type.String]).

### Load Leaderboard Categories

For the `command` parameter of `"loadLeaderboardCategories"`, this function requests a list of leaderboard categories for the app.

``````lua
gameNetwork.request( "loadLeaderboardCategories", { listener=requestCallback } )
``````

When handling the results of a `"loadLeaderboardCategories"` call, `event.data` is an array of items (tables). Each contains the following leaderboard properties:

* `category` ([string][api.type.String])
* `title` ([string][api.type.String])

``````lua
event.data[1].category  --> "CY_a49t8h4t43t43t"
event.data[1].title     --> "Easy"
``````

### Is Connected

For the `command` parameter of `"isConnected"`, this call checks if the user is currently logged into Google Play Game Services, returning `true` if the user is currently logged in and `false` if not. This function returns immediately with the result so there is no need to supply it with a callback listener.

### Login

For the `command` parameter of `"login"`, this function attempts to log the user into Google Play Game Services.

``````lua
gameNetwork.request( "login",
	{
		userInitiated = true,
		listener = requestCallback
	}
)
``````

Inside the `params` table, `userInitated` is a boolean with a default of `true`. When `true`, this call will try to resolve any problems with the login process by, for example, show the login popup. If it's set to `false`, this call will simply attempt to connect without trying to resolve any errors. Setting `userInitated` to `false` is useful for automatically logging the user in while avoiding a repetitive prompt for each session.

When handling the results of a `"login"` call, `event.data` in the callback listener contains an `isError` property ([boolean][api.type.Boolean]) which indicates if there was an error with the login process.

### Logout

For the `command` parameter of `"logout"`, this call logs the user out of Google Play Game Services. This function does not accept a callback listener

``````lua
gameNetwork.request( "logout" )
``````

### Create Room

For the `command` parameter of `"createRoom"`, this function creates a <nobr>real-time</nobr> multiplayer match with the specified players. Specifying a listener function when calling this will override any room listener that was set via `gameNetwork.setRoomListener()`.

``````lua
local function requestCallback( event )
	print( event.data.roomID )  --ID of the room that was created
end

gameNetwork.request( "createRoom",
	{
		playerIDs =  --array of players to invite
		{
			"45987354897345345",
			"32238975789573445",
			"17891241248435990"
		},
		maxAutoMatchPlayers = 3,     --optional, defaults to 0
		minAutoMatchPlayers = 1,     --optional, defaults to 0
		listener = requestCallback   --including this will override any listener set in 'gameNetwork.setRoomListener()'
	}
)
``````

### Join Room

For the `command` parameter of `"joinRoom"`, this function joins a room that has already been created. Specifying a listener function when calling this will override any room listener that was set via `gameNetwork.setRoomListener()`.

Inside the `params` table, `roomID` is the ID which was created by `gameNetwork.request( "createRoom", ... )`.

``````lua
local function requestCallback( event )
	print( event.data.roomID )  --ID of the room that was joined
end

gameNetwork.request( "joinRoom",
	{
		roomID = "o345t9348th",
		listener = requestCallback  --including this will override any listener set in 'gameNetwork.setRoomListener()'
	}
)
``````

### Leave Room

For the `command` parameter of `"leaveRoom"`, this function leaves the room that the player is currently in and closes any connections. Specifying a listener function when calling this will override any room listener that was set via `gameNetwork.setRoomListener()`.

``````lua
local function requestCallback( event )
	print( event.data.roomID )  --ID of the room that was left
end

gameNetwork.request( "leaveRoom",
	{
		roomID = "o345t9348th",
		listener = requestCallback  --including this will override any listener set in 'gameNetwork.setRoomListener()'
	}
)
``````

### Set Room Listener

For the `command` parameter of `"setRoomListener"`, this function sets the listener function that will be called when a room event occurs. Calling this will override any listener set from within a `"createRoom"`, `"joinRoom"`, or `"leaveRoom"` request. Note that this callback function may be triggered multiple times, for example if one player declines an invitation and then another person declines after that.

``````lua
local function requestCallback( event )
	print( event.data.roomID )
	--print( event.data[1] )  --this will be populated if there are players involved in this event
end

gameNetwork.request( "setRoomListener",
	{
		listener = requestCallback
	}
)
``````

When handling the results of a `"setRoomListener"` call, the `event` table is structured as follows:

* `event.data` ([table][api.type.Table]) &mdash; Array which contains the list of players affected, for example `event.data[1].alias` or `event.data[2].playerID`.
* `event.data.roomID` ([string][api.type.String]) &mdash; Room ID on which this event occurred.
* `event.data.isError` ([boolean][api.type.Boolean]) &mdash; Boolean indicating if there was an error.
* `event.type` &mdash; (see below)

In addition to the data above, `event.type` includes:

* `createRoom` &mdash; The logged in player created a room.
* `joinRoom` &mdash; The logged in player joined a room.
* `leaveRoom` &mdash; The logged in player left the room.
* `connectedRoom` &mdash; All invited players have accepted and the auto matchmaking has completed.
* `peerAcceptedInvitation` &mdash; The list of players who accepted an invitation to join the room.
* `peerDeclinedInvitation` &mdash; The list of players who declined an invitation to join the room.
* `peerLeftRoom` &mdash; The list of players who left the room.
* `peerDisconnectedFromRoom` &mdash; The list of players who disconnected from the room.

### Send Message

For the `command` parameter of `"sendMessage"`, this function sends a message to other player(s).

``````lua
gameNetwork.request( "sendMessage",
	{
		roomID = "o345t9348th",
		playerIDs =
		{
			"45987354897345345",
			"32238975789573445",
			"17891241248435990"
		},
		message = "Get ready!",
		reliable = true,
		listener = requestCallback
	}
)
``````

Inside the `params` table, the following <nobr>key-values</nobr> apply:

* `roomID` ([string][api.type.String]) &mdash; ID of the room that the other player(s) are in.
* `playerIDs` ([table][api.type.Table]) &mdash; Array of players to send the message to.
* `message` ([string][api.type.String]) &mdash; Message to send.
* `reliable` ([boolean][api.type.Boolean]) &mdash; Optional parameter which, if `true`, sends a reliable message. Messages can be dropped if they're not reliable but they will reach other players faster. Default is `true`.

### Set Message Received Listener

For the `command` parameter of `"setMessageReceivedListener"`, this function sets the listener function that will be called when a message has been received. This function will only be called for messages transmitted to the room that the current player is connected&nbsp;to.

``````lua
local function requestCallback( event )
	print( event.data.participantID )
	print( event.data.message )
end

gameNetwork.request( "setMessageReceivedListener",
	{
		listener = requestCallback
	}
)
``````

When handling the results of a `"setMessageReceivedListener"` call, `event.data` in the callback listener contains the following properties:

* `participantID` ([string][api.type.String]) &mdash; ID of the participant who sent the message.
* `message` ([string][api.type.String]) &mdash; The message that was sent from the participant.

### Set Invitation Received Listener

For the `command` parameter of `"setInvitationReceivedListener"`, this function sets the listener function that will be called when an invitation has been received.

``````lua
local function requestCallback( event )
	print( event.data.roomID )
	print( event.data.alias )
	print( event.data.playerID )
end

gameNetwork.request( "setInvitationReceivedListener",
	{
		listener = requestCallback
	}
)
``````

When handling the results of a `"setInvitationReceivedListener"` call, `event.data` in the callback listener contains the following properties:

* `roomID` ([string][api.type.String]) &mdash; Room ID associated with the invitation.
* `alias` ([string][api.type.String]) &mdash; Alias of the player who invited you.
* `playerID` ([string][api.type.String]) &mdash; ID of the player who invited you.
