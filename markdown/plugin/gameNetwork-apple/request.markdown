# gameNetwork.request()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [gameNetwork.*][api.library.gameNetwork]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          gameNetwork, Game Center
> __See also__          [gameNetwork.init()][plugin.gameNetwork-apple.init]
>						[gameNetwork.show()][plugin.gameNetwork-apple.show]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Send or request information to/from [Game Center](https://developer.apple.com/game-center/).


## Syntax

    gameNetwork.request( command [, params] )

##### command ~^(required)^~
_[String][api.type.String]._ String value as supported by Game Center &mdash; see [Command&nbsp;Reference](#commands) below.

##### params ~^(optional)^~
_[Table][api.type.Table]._ Table of parameters allowed by Game Center &mdash; see [Parameter&nbsp;Reference](#params) below.


<a id="commands"></a>

## Command Reference

For the `command` parameter, Game&nbsp;Center supports the following values:

* `"setHighScore"`
* `"loadScores"`
* `"loadLocalPlayer"`
* `"loadPlayers"`
* `"loadFriends"`
* `"loadAchievements"`
* `"unlockAchievement"`
* `"resetAchievements"`
* `"loadAchievementDescriptions"`
* `"loadFriendRequestMaxNumberOfRecipients"`
* `"loadLeaderboardCategories"`
* `"loadPlayerPhoto"`
* `"loadAchievementImage"`
* `"loadPlaceholderCompletedAchievementImage"`
* `"loadIncompleteAchievementImage"`
* `"loadCurrentPlayer"`
* `"createMatch"`
* `"quitMatch"`
* `"endMatch"`
* `"removeMatch"`
* `"setEventListener"`
* `"loadMatchData"`
* `"endTurn"`
* `"loadMatches"`
* `"loadTurnBasedMatchMaxNumberOfParticipants"`

<a id="params"></a>

## Parameter Reference

Depending on the specified `command` parameter, the contents of the `params` table will vary.

### Listener Function

For all calls to `gameNetwork.request()`, the `params` table supports a `listener` key with its value as a callback listener function to monitor the call result. In the callback listener, `event.type` indicates the request that was executed, along with other data specific to each request type as outlined below.

``````lua
local function requestCallback( event )

	if ( event.type == "setHighScore" ) then
		-- High score has been set
	end
end

gameNetwork.request( "setHighScore",
	{
		localPlayerScore = { category="com.appledts.EasyTapList", value=25 },
		listener = requestCallback
	}
)
``````

### Set High Score

For the `command` parameter of `"setHighScore"`, this function sets a high score for the currently <nobr>logged-in</nobr> user for the specified leaderboard (`category`). If the high score is not higher than the one currently on the server, the server will keep the highest value.

``````lua
gameNetwork.request( "setHighScore",
	{
		localPlayerScore = { category="com.appledts.EasyTapList", value=25 },
		listener = requestCallback
	}
)
``````

In the `params` table, `localPlayerScore` is a required table inside which the following <nobr>key-values</nobr> apply:

* `category` &mdash; String that matches the leaderboard ID for which you want to register the score, as configured in iTunes&nbsp;Connect.

* `value` &mdash; Number representing the score. Note that Apple allows for <nobr>64-bit</nobr> integers, but all numbers in Lua are of type double. This means that your maximum and minimum values are restricted to the range of double which is about `2^51` instead of `2^64`.

### Load Scores

For the `command` parameter of `"loadScores"`, this function retrieves scores based on various filters.

``````lua
gameNetwork.request( "loadScores",
	{
		leaderboard =
		{
			category = "com.appledts.EasyTapList",
			playerScope = "Global",  -- "Global" or "FriendsOnly"
			timeScope = "AllTime",   -- "AllTime", "Week", or "Today"
			range = { 1,5 }
		},
		listener = requestCallback
	}
)
``````

Inside the `params` table, `leaderboard` is a required table inside which the following <nobr>key-values</nobr> apply:

* `category` &mdash; Required string that matches the leaderboard ID from which you want to fetch scores, as configured in iTunes&nbsp;Connect.

* `playerScope` &mdash; Optional string of either `"Global"` or `"FriendsOnly"`. The latter setting will restrict the fetched scores to only friends.

* `timeScope` &mdash; Optional string of either `"AllTime"`, `"Week"`, or `"Today"` which limits the fetched scores to a specified time range.

* `range` &mdash; Optional array of two integer values. The first value is a start index and the second value is the number of players to retrieve (less&nbsp;than&nbsp;100). The default range is `{ 1,25 }`.

When handling the results of a `"loadScores"` call, `event.data` in the callback listener is an array of items (tables), each of which contains the following properties:

* `playerID` ([string][api.type.String])
* `category` ([string][api.type.String])
* `value` ([number][api.type.Number])
* `context` ([number][api.type.Number])
* `date` ([string][api.type.String])
* `formattedValue` ([string][api.type.String])
* `rank` ([integer][api.type.Number])
* `shouldSetDefaultLeaderboard` ([boolean][api.type.Boolean])
* `unixTime` ([integer][api.type.Number])

``````lua
event.data[1].playerID  -- ID of the first player in the request
event.data[3].rank      -- Rank of the third player in the request
``````

In addition, the `event.localPlayerScore` table is accessible for the <nobr>logged-in</nobr> player. This contains all of the properties shown above.

<div style="width: 400px;">

``````lua
event.localPlayerScore.playerID
event.localPlayerScore.rank
``````

</div>

### Load Local Player

For the `command` parameter of `"loadLocalPlayer"`, this function requests data for the currently <nobr>logged-in</nobr> player.

``````lua
gameNetwork.request( "loadLocalPlayer", { listener=requestCallback } )
``````

When handling the results of a `"loadLocalPlayer"` call, `event.data` in the callback listener contains the following properties:

* `playerID` ([string][api.type.String])
* `alias` ([string][api.type.String])
* `isFriend` ([boolean][api.type.Boolean])
* `isAuthenticated` ([boolean][api.type.Boolean])
* `isUnderage` ([boolean][api.type.Boolean])
* `friends` ([array][api.type.Array]) &mdash; Array of player IDs ([strings][api.type.String]) representing the friends of the local player.

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
			"G:123456789",
			"G:1234567890",
			"G:0123456789"
		},
		listener = requestCallback
	}
)
``````

Inside the `params` table, `playerIDs` is a required table containing a <nobr>comma-delimited</nobr> list of player IDs ([strings][api.type.String]) to fetch data for.

When handling the results of a `"loadPlayers"` call, `event.data` in the callback listener is an array of items (tables) corresponding to each requested player. Each table contains the following properties:

* `playerID` ([string][api.type.String])
* `alias` ([string][api.type.String])
* `isFriend` ([boolean][api.type.Boolean])

``````lua
event.data[1].playerID  -- ID of the first player in the request
event.data[3].alias     -- Alias of the third player in the request
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
``````

</div>

### Load Achievements

For the `command` parameter of `"loadAchievements"`, this function loads a list of the player's completed achievements for the app.

``````lua
gameNetwork.request( "loadAchievements", { listener=requestCallback } )
``````

When handling the results of a `"loadAchievements"` call, `event.data` in the callback listener is an array of items (tables) representing each achievement. Each table contains the following properties:

* `identifier` ([string][api.type.String])
* `percentComplete` ([number][api.type.Number])
* `isCompleted` ([boolean][api.type.Boolean])
* `isHidden` ([boolean][api.type.Boolean])
* `lastReportedDate` ([string][api.type.String])
* `showsCompletionBanner` ([boolean][api.type.Boolean])

``````lua
event.data[4].identifier       -- Identifier for the fourth achievement
event.data[2].percentComplete  -- Completed percentage for the second achievement 
``````

### Unlock Achievement

For the `command` parameter of `"unlockAchievement"`, this function unlocks/sets the specified achievement (`identifier`) at the specified percentage. The `showsCompletionBanner` only takes affect if the achievement is 100% complete.

``````lua
gameNetwork.request( "unlockAchievement",
	{
		achievement =
		{
			identifier = "com.appletest.one_tap",
			percentComplete = 100,
			showsCompletionBanner = true
		},
		listener = requestCallback
	}
)
``````

Inside the `params` table, `achievement` is a required table inside which the following <nobr>key-values</nobr> apply:

* `identifier` &mdash; Required string that matches the name of the achievement you want to unlock/report, as entered on iTunes Connect (this need not follow the fully qualified reverse domain style shown here).

* `percentComplete` &mdash; Optional number representing the completion percentage of the achievement. Setting this value to `100` will fully unlock the achievement. If this field is omitted, it's assumed this value is `100`.

* `showsCompletionBanner` &mdash; Optional boolean which, if set to `true`, will cause Apple to automatically show a completion banner when `percentComplete` reaches `100`.

When handling the results of a `"unlockAchievement"` call, `event.data` is a table that corresponds to the achievement that you just unlocked. You may use this information to help identify which/any achievements were successfully reported to the Game Center servers and which ones might have failed due to network timeouts.

### Reset Achievements

For the `command` parameter of `"resetAchievements"`, this function resets all achievements for the currently <nobr>logged-in</nobr> player. Use this with caution because there is no undoing this request &mdash; once called, all of the player's achievements for the app are reset to 0%.

``````lua
gameNetwork.request( "resetAchievements", { listener=requestCallback } )
``````

### Load Achievement Descriptions

For the `command` parameter of `"loadAchievementDescriptions"`, this function requests a list of all descriptions associated with the achievements for the app.

``````lua
gameNetwork.request( "loadAchievementDescriptions", { listener=requestCallback } )
``````

When handling the results of a `"loadAchievementDescriptions"` call, `event.data` is an array of items (tables) which indicate the descriptions of the currently <nobr>logged-in</nobr> player's achievements.

* `identifier` ([string][api.type.String])
* `title` ([string][api.type.String])
* `achievedDescription` ([string][api.type.String])
* `unachievedDescription` ([string][api.type.String])
* `maximumPoints` ([integer][api.type.Number])
* `isHidden` ([boolean][api.type.Boolean])

### Load Max Friend Request Recipients

For the `command` parameter of `"loadFriendRequestMaxNumberOfRecipients"`, this function retrieves the maximum number of people that may be invited in a single friend request. The value is returned through the callback listener via `event.data`.

``````lua
gameNetwork.request( "loadFriendRequestMaxNumberOfRecipients", { listener=requestCallback } )
``````

### Load Leaderboard Categories

For the `command` parameter of `"loadLeaderboardCategories"`, this function requests a list of leaderboard categories for the app.

``````lua
gameNetwork.request( "loadLeaderboardCategories", { listener=requestCallback } )
``````

When handling the results of a `"loadLeaderboardCategories"` call, `event.data` is an array of items (tables). Each contains the following leaderboard properties:

* `category` ([string][api.type.String])
* `title` ([string][api.type.String])

``````lua
event.data[1].category  --> "com.appledts.EasyTapList"
event.data[1].title     --> "Easy"
``````

### Load Player Photo

For the `command` parameter of `"loadPlayerPhoto"`, this function retrieves the image of the requested player and creates a display object for it.

``````lua
gameNetwork.request( "loadPlayerPhoto",
	{
		playerID = "G:0123456789",
		size = "Small",  -- "Small" or "Normal"
		listener = requestCallback
	}
)
``````

Inside the `params` table, the following <nobr>key-values</nobr> apply:

* `playerID` &mdash; Game Center player ID ([string][api.type.String]) to fetch the image for.

* `size` &mdash; Optional value representing the size of the image to get back. Supported values are `"Small"` (default) or `"Normal"`.

When handling the results of a `"loadPlayerPhoto"` call, `event.data` is a table which contains the properties listed below. Note that the additional `photo` property is the display object created by a successful request.

* `playerID` ([string][api.type.String])
* `alias` ([string][api.type.String])
* `isFriend` ([boolean][api.type.Boolean])
* `isAuthenticated` ([boolean][api.type.Boolean])
* `isUnderage` ([boolean][api.type.Boolean])
* `friends` ([array][api.type.Array])
* `photo` ([display object][api.type.DisplayObject])

### Load Achievement Image

For the `command` parameter of `"loadAchievementImage"`, this function retrieves the image of the requested achievement and creates a display object for it.

``````lua
gameNetwork.request( "loadAchievementImage",
	{
		achievementDescription =
		{
			identifier = "com.appledts.twenty_taps"
		},
		listener = requestCallback
	}
)
``````

Inside the `params` table, `achievementDescription` is a required table inside which the following <nobr>key-values</nobr> apply:

* `identifier` &mdash; Required string that matches the name of the achievement to retrieve the image for (this need not follow the fully qualified reverse domain style shown here).

When handling the results of a `"loadAchievementImage"` call, `event.data` is a table that contains the properties listed below. Note that the additional `image` property is the display object created by a successful request.

* `identifier` ([string][api.type.String])
* `title` ([string][api.type.String])
* `achievedDescription` ([string][api.type.String])
* `unachievedDescription` ([string][api.type.String])
* `maximumPoints` ([integer][api.type.Number])
* `isHidden` ([boolean][api.type.Boolean])
* `image` ([display object][api.type.DisplayObject])

<div class="guide-notebox">
<div class="notebox-title">Note</div>

Achievement images uploaded to iTunes Connect should be fully compatible with Corona (see&nbsp;__Image&nbsp;Guidelines__ for [display.newImage()][api.library.display.newImage]).

</div>

### Load Completed Achievement Placeholder Image

For the `command` parameter of `"loadPlaceholderCompletedAchievementImage"`, this function retrieves the Apple placeholder image of a completed achievement and creates a display object for it, accessible via `event.data` in the callback listener.

``````lua
gameNetwork.request( "loadPlaceholderCompletedAchievementImage", { listener=requestCallback } )
``````

### Load Incomplete Achievement Image

For the `command` parameter of `"loadIncompleteAchievementImage"`, this function retrieves the Apple placeholder image of an incomplete achievement and creates a display object for it, accessible via `event.data` in the callback listener.

``````lua
gameNetwork.request( "loadIncompleteAchievementImage", { listener=requestCallback } )
``````

### Load Current Player

For the `command` parameter of `"loadCurrentPlayer"`, this function retrieves the current player who is scheduled to take his/her turn in a match.

``````lua
gameNetwork.request( "loadCurrentPlayer",
	{
		matchID = "w4o98y3498hg349h",
		listener = requestCallback
	}
)
``````

Inside the `params` table, the following <nobr>key-values</nobr> apply:

* `matchID` &mdash; Match ID ([string][api.type.String]) of the match from which you want to fetch the current participant.

When handling the results of a `"loadCurrentPlayer"` call, `event.data` in the callback listener includes the [participant][api.type.GameNetwork.participant] object.

### Create Match

For the `command` parameter of `"createMatch"`, this function creates a <nobr>turn-based</nobr> match with the specified players. Unlike <nobr>`gameNetwork.show( "createMatch", ... )`</nobr> ([reference][plugin.gameNetwork-apple.show]), this simply creates a [match][api.type.GameNetwork.match] object and lets you show a custom user interface.

Note that this call assumes the currently <nobr>logged-in</nobr> player will be part of the match. Thus, you should not include the current player's ID in the `playerIDs` table. In addition, ensure that `maxPlayers` is set to a value which accommodates both the requested number of players and the current player. For example, if you request a match with two players in the `playerIDs` table, `maxPlayers` should be set to `3` or higher.

``````lua
gameNetwork.request( "createMatch",
	{
		playerIDs = { "w4o98y3498hg349h", "wrighfq547hg543" },
		minPlayers = 2,
		maxPlayers = 3,
		playerGroup = 1,
		playerAttributes = { 1, 4, 6 },
		inviteMessage = "Hi, please join our match!",
		listener = requestCallback
	}
)
``````

* `playerIDs` — Optional array of strings representing the player IDs of people to invite to the match.

* `minPlayers` — Optional value for the minimum number of players required in the match.

* `maxPlayers` — Optional value for the maximum number of players allowed in the match.

* `playerGroup` — The game type which will be created, for example a quick game or long game. Only players whose requests share the same `playerGroup` value are <nobr>auto-matched</nobr> by Game Center.

* `playerAttributes` — Mask that specifies the role that the local player would like to play in the game.

* `inviteMessage` — Custom invitation message for the match.

When handling the results of a `"createMatch"` call, `event.data` in the callback listener includes the [match][api.type.GameNetwork.match] object.

### Quit Match

For the `command` parameter of `"quitMatch"`, this function removes the currently <nobr>logged-in</nobr> player from the specified match and sets his/her match outcome.

``````lua
gameNetwork.request( "quitMatch",
	{
		matchID = "adsfawerg4",
		outcome = "lost",
		data = "dsfa4wt4t",
		nextParticipant = { "34tgergae5rtg5" },
		listener = requestCallback
	}
)
``````

* `matchID` &mdash; String identifying the match that the player will quit.

* `outcome` &mdash; Result of the match for the player that quit.

* `data` &mdash; Data of the match for the next player. This is only necessary if it's the local player's turn.

* `nextParticipant` &mdash; The next player that is scheduled to take a turn, wrapped in an array. This can be the player ID or the index value of the participant. This is only necessary if it's the local player's turn.

<!---

When handling the results of a `"quitMatch"` call, `event.data` in the callback listener includes the [match][api.type.GameNetwork.match] object.

--->

### End Match

For the `command` parameter of `"endMatch"`, this function ends the match and sets the outcome for all players.

``````lua
gameNetwork.request( "endMatch",
	{
		matchID = "adsfawerg4",
		outcome =
		{
			["G:0123456789"] = "first",
			["G:1234567890"] = "second",
			["G:9876543210"] = "third"
		},
		data = "dsfa4wt4t",
		listener = requestCallback
	}
)
``````

In the `params` table, the following <nobr>key-values</nobr> apply:

* `matchID` &mdash; String identifying the match to end.

* `outcome` &mdash; Required array containing the player IDs and the match outcome for each.

* `data` &mdash; The final data of the match.

### Remove Match

For the `command` parameter of `"removeMatch"`, this function removes the match from the list of matches in Game Center.  This should only be called after <nobr>`gameNetwork.request( "endMatch", ... )`</nobr> has been executed. Within the `params` table, `matchID` is a string identifying the match to remove.

``````lua
gameNetwork.request( "removeMatch",
	{
		matchID = "adsfawerg4",
		listener = requestCallback
	}
)
``````

### Set Match Event Listener

For the `command` parameter of `"setEventListener"`, this function sets the event listener for all matches. 

``````lua
gameNetwork.request( "setEventListener", { listener=requestCallback } )
``````

<div class="guide-notebox">
<div class="notebox-title">Note</div>

Setting this listener is important so that the app can respond accordingly for other players involved in the match. For example, if the `"endTurn"` request is called for the current player, the `"playerTurn"` event will be dispatched to the next player in line.

</div>

When handling the results of a `"setEventListener"` call, `event.type` in the callback listener will be one of the following:

* `"invitationReceived"` &mdash; The value when the player has received an invitation to join a match.

* `"matchEnded"` &mdash; The value when another player has called <nobr>`gameNetwork.request( "endMatch", ... )`</nobr>, ending the match for all the players.

* `"playerTurn"` &mdash; The value when it's the current player's turn in a match, following the <nobr>`gameNetwork.request( "endTurn", ... )`</nobr> call for the previous player.

In turn, `event.data` in the callback listener will vary depending on the value of `event.type`:

* When `event.type` is `"invitationReceived"`, `event.data` is an array of strings representing the IDs of all players invited to the match.

* When `event.type` is `"matchEnded"` or `"playerTurn"`, `event.data` contains the [match][api.type.GameNetwork.match] object.

### Load Match Data

For the `command` parameter of `"loadMatchData"`, this function retrieves the data of a match. Within the `params` table, `matchID` is a string identifying the match for which data will be retrieved.

``````lua
gameNetwork.request( "loadMatchData",
	{
		matchID = "adsfawerg4",
		listener = requestCallback
	}
)
``````

When handling the results of a `"loadMatchData"` call, `event.data` in the callback listener includes the [match][api.type.GameNetwork.match] object, assuming the match has been established.

### End Turn

For the `command` parameter of `"endTurn"`, this function ends the current player's turn and lets the next player start their turn.

``````lua
gameNetwork.request( "endTurn",
	{
		matchID = "adsfawerg4",
		data = "dsfa4wt4t",
		nextParticipant = { "34tgergae5rtg5" },
		listener = requestCallback
	}
)
``````

Within the `params` table, the following <nobr>key-values</nobr> apply:

* `matchID` &mdash; String identifying the match for which the player will end their turn.

* `data` &mdash; The data of the match for the next player.

* `nextParticipant` &mdash; The next player that is supposed to take a turn, wrapped in an array. This can be the player ID or the index value of the participant.

<!---

When handling the results of a `"endTurn"` call, `event.data` in the callback listener includes the [match][api.type.GameNetwork.match] object.

-->

### Load Matches

For the `command` parameter of `"loadMatches"`, this function loads the matches involving the currently <nobr>logged-in</nobr> player and creates a [match][api.type.GameNetwork.match] object for each.

``````lua
gameNetwork.request( "loadMatches", { listener=requestCallback } )
``````

When handling the results of a `"loadMatches"` call, `event.data` in the callback listener is an array of [match][api.type.GameNetwork.match] objects.

### Load Max Turn-Based Participants

For the command parameter of `"loadTurnBasedMatchMaxNumberOfParticipants"`, this function retrieves the maximum number of players that may be invited to a <nobr>turn-based</nobr> match. The value is returned through the callback listener via `event.data`.

``````lua
gameNetwork.request( "loadTurnBasedMatchMaxNumberOfParticipants", { listener=requestCallback } )
``````

## Example

`````lua
-- Request callback function
local function requestCallback( event )

	if ( event.type == "setHighScore" ) then
		-- High score has been set
	elseif ( event.type == "resetAchievements" ) then
		-- Achievements have been reset
	end
end

-- Update the player's high score
gameNetwork.request( "setHighScore",
	{
		localPlayerScore = { category="com.appledts.EasyTapList", value=25 },
		listener = requestCallback
	}
)

-- Reset the player's achievement list
gameNetwork.request( "resetAchievements", { listener=requestCallback } )
`````