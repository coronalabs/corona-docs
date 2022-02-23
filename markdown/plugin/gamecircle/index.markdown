# plugin.gamecircle

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Library][api.type.Library]  
> __Revision__          [REVISION_LABEL](REVISION_URL)  
> __Keywords__          GameCircle, Whispersync for Games, achievements, leaderboards, Amazon
> __Platforms__		Android
> --------------------- ------------------------------------------------------------------------------------------

## Overview

The GameCircle plugin enables Android-based Corona games to access the full set of features made available in Amazon's GameCircle service. Log player achievements with Amazon's servers, maintain leaderboards, and make use of Amazon's powerful Whispersync for Games functionality to maintain your game's data in the cloud.


## Setup

To use the GameCircle plugin, you must first create a GameCircle configuration for your game on the Amazon servers and populate it with data.

To do this, head to Amazon's documentation for their GameCircle API. You may want to read and hunt around to understand how GameCircle works in general, as this plugin acts simply as a mediator between your Lua game code and the <nobr>Java-based</nobr> GameCircle API.

* [Amazon's GameCircle and Corona](https://developer.amazon.com/public/apis/engage/gamecircle/docs/corona-integration)

* [Amazon GameCircle API Homepage](https://developer.amazon.com/appsandservices/apis/engage/gamecircle)

* [Amazon's Get Set Up for GameCircle](https://developer.amazon.com/public/apis/engage/gamecircle/docs/get-set-up-for-gamecircle)

Once you've done all that, setting up your achievements, leaderboards, and security profile, there is one final step you need to do. You need to get the API key associated with your package name and security profile. It is usually a very long string of letters and numbers without spaces. It can be found under the "Kindle/Android Settings" of your application's security profile. You need to copy and paste the entire key into an empty text file and then save that text file to your project's directory as `api_key.txt`. That is how the GameCircle API identifies itself to Amazon's servers; the plugin won't work without a valid API key. Specific instructions for generating an API key can be found [here](https://developer.amazon.com/public/apis/engage/gamecircle/docs/create-a-gamecircle-configuration#Generate%20API%20Keys).


## Syntax

Once you have your game set up on Amazon's servers and have copies of your API key, you are ready to include and integrate the GameCircle plugin in your application. At the very start, there are only two functions you have to call to get GameCircle working for you. 

``````lua
local gamecircle = require( "plugin.gamecircle" )

gamecircle.Init( true, true, true )
``````

The `require()` line loads the GameCircle plugin into your app. The `Init()` function is how you tell the plugin which of GameCircle's three features you want to make available to the user. Beyond that, read the <nobr>feature-dependent</nobr> sections below for function documentation and don't forget to read up on the GameCircle API so you can understand how their SDK is operating behind the scenes.


## Gotchas / Tips

These are important things to know about the GameCircle plugin and the GameCircle SDK.

1. This plugin only works for Android. While code will compile in the Corona Simulator, all function calls to the GameCircle plugin will return `nil`. This is by design since the GameCircle SDK itself only works on Android. 

2. To interact with leaderboards and achievements that you create in draft mode, you need to add any GameCircle player profile names you're testing with to the test account whitelist. Check GameCircle's [Test Your Game](https://developer.amazon.com/public/apis/engage/gamecircle/docs/testing-features) documentation to figure out how to do this.
	
3. Whispersync for Games data cannot be deleted (a limitation imposed by Amazon), so be careful while developing for Whispersync for Games and be sure to use a GameCircle test account during development to ensure you are not polluting the Whispersync data associated with your personal or your company's Amazon account with garbage data. 
	
4. If you are already familiar with Amazon's Whispersync for Games, please be sure to read the documentation on how this plugin emulates Whispersync's use of data objects for the setting and retrieval of data. There is no way to directly pull in the data objects that Whispersync uses into Lua without destroying the intended functionality. Thus, the plugin approximates that functionality. You can read more in the Whispersync section.

5. The plugin tries to maintain a 1-to-1 relationship between the functionality provided by the GameCircle SDK. If you are curious about a particular function and/or the significance of the data a function provides, check out Amazon's GameCircle documentation. 


## General Functions

These functions offer some general purpose features that either do not relate to a specific GameCircle feature or are useful to all three. 

#### [gamecircle.Init][plugin.gamecircle.Init]
#### [gamecircle.GetLocalPlayerProfile][plugin.gamecircle.GetLocalPlayerProfile]
#### [gamecircle.IsReady][plugin.gamecircle.IsReady]
#### [gamecircle.IsPlayerSignedIn][plugin.gamecircle.IsPlayerSignedIn]
#### [gamecircle.GetFriendsIds][plugin.gamecircle.GetFriendsIds]
#### [gamecircle.GetBatchFriends][plugin.gamecircle.GetBatchFriends]
#### [gamecircle.SetSignedInListener][plugin.gamecircle.SetSignedInListener]

## Achievement Functions

These functions provide access to the achievement functionality of Amazon's GameCircle API. Please remember to set up achievements on Amazon's servers before you attempt to use these functions.

#### [gamecircle.Achievement.OpenOverlay][plugin.gamecircle.Achievement.OpenOverlay]
#### [gamecircle.Achievement.UpdateAchievement][plugin.gamecircle.Achievement.UpdateAchievement]
#### [gamecircle.Achievement.GetAchievement][plugin.gamecircle.Achievement.GetAchievement]
#### [gamecircle.Achievement.GetAchievements][plugin.gamecircle.Achievement.GetAchievements]

## Achievement Properties

These are the data structures returned by Achievement functions, either directly or through function callbacks.

#### [gamecircle.Achievement.Achievement][plugin.gamecircle.Achievement.Achievement]
#### [gamecircle.Achievement.AchievementReturn][plugin.gamecircle.Achievement.AchievementReturn]
#### [gamecircle.Achievement.AchievementsReturn][plugin.gamecircle.Achievement.AchievementsReturn]

## Leaderboard Functions

These functions provide access to the leaderboard functionality of Amazon's GameCircle API. Please remember to set up leaderboards on Amazon's servers before you attempt to use these functions.

#### [gamecircle.Leaderboard.OpenOverlay][plugin.gamecircle.Leaderboard.OpenOverlay]
#### [gamecircle.Leaderboard.SubmitScore][plugin.gamecircle.Leaderboard.SubmitScore]
#### [gamecircle.Leaderboard.GetScores][plugin.gamecircle.Leaderboard.GetScores]
#### [gamecircle.Leaderboard.GetLocalPlayerScore][plugin.gamecircle.Leaderboard.GetLocalPlayerScore]
#### [gamecircle.Leaderboard.GetLeaderboards][plugin.gamecircle.Leaderboard.GetLeaderboards]
#### [gamecircle.Leaderboard.GetPercentileRanks][plugin.gamecircle.Leaderboard.GetPercentileRanks]

## Leaderboard Properties

These are the data structures returned by Leaderboard functions, either directly or through function callbacks.

#### [gamecircle.Leaderboard.Leaderboard][plugin.gamecircle.Leaderboard.Leaderboard]
#### [gamecircle.Leaderboard.LeaderboardsReturn][plugin.gamecircle.Leaderboard.LeaderboardsReturn]
#### [gamecircle.Leaderboard.LocalPlayerScoreReturn][plugin.gamecircle.Leaderboard.LocalPlayerScoreReturn]
#### [gamecircle.Leaderboard.Score][plugin.gamecircle.Leaderboard.Score]
#### [gamecircle.Leaderboard.GetScoresReturn][plugin.gamecircle.Leaderboard.GetScoresReturn]
#### [gamecircle.Leaderboard.PercentileReturn][plugin.gamecircle.Leaderboard.PercentileReturn]
#### [gamecircle.Leaderboard.PercentileItem][plugin.gamecircle.Leaderboard.PercentileItem]


## Whispersync General Info

The information in this section is mainly for those who have previously worked with the Java-based GameCircle SDK. It provides information on important differences between the implementations of the GameCircle SDK and this plugin. 

Compared to Amazon's GameCircle SDK, this plugin differs the most when it comes to the implementation of Whispersync for Games. The Whispersync feature still has the same level of functionality and ease of use, but the plugin must be slightly different due to the fundamental differences between Java and Lua as programming languages.

In the plugin, you use functions to put an object that represents a piece of data into Whispersync's system. See the following example done in Java:

``````java
//Java Example using GameCircle SDK
String key = "level6LocalHighScore"
GameDataMap gameDataMap = AmazonGamesClient.getWhispersyncClient().getGameData();
SyncableNumber syncNumber = gameDataMap.getHighestNumber(key);
syncNumber.Set(8675309)
``````

In the example above, you as the developer could just hold onto the `syncNumber` that we just created and keep assigning new values to it whenever needed. Whispersync's system would then, in the background, handle saving the updated data both locally and to the cloud. This functionality can't be replicated in Corona's Lua language because there is no way to convert the GameCircle SDK objects, like `SyncableNumber`, to a Lua table/object without breaking its internal functionality.

Thus, this plugin works on a principle similar to Dictionaries/HashTables in languages such as C++ and C#. Here is the same example from above done in Lua using this plugin:

``````lua
--Lua example using this GameCircle plugin
local gamecircle = require( "plugin.gamecircle" )
local key = "level6LocalHighScore"
gamecircle.Init( false, false, true )
gamecircle.Whispersync.SetHighestNumber( key, 8675309, "INT" )
``````

As you can see from the plugin, instead of using your key to grab a reference to a `SyncableNumber`, you use your key to set the value using the `SetHighestNumber()` function. At the core, that is the only difference between this plugin and the GameCircle SDK. You need to use dictionary-like functions to access the data instead of grabbing an object representing the data and just updating that. Whispersync's systems still perform the background saving and updating of data both locally and in the cloud. And you, as the developer, can still hook into Whispersync's events system by providing a callback function. 

There is also a key difference in how `GameData` objects are treated, but that will be discussed in the GameData Navigation section below. 

## Whispersync for Games Functions

These are the functions allowing for the setting, getting, and manipulation of data stored with Whispersync for Games. For more information on how GameCircle uses Whispersync for Games, see Amazon's [GameCircle documentation on Whispersync] (https://developer.amazon.com/public/apis/engage/gamecircle/docs/whispersync).

### General

#### [gamecircle.Whispersync.Sync][plugin.gamecircle.Whispersync.Sync]
#### [gamecircle.Whispersync.Flush][plugin.gamecircle.Whispersync.Flush]
#### [gamecircle.Whispersync.SetWhispersyncEventListener][plugin.gamecircle.Whispersync.SetWhispersyncEventListener]

### Accumulated Number Functions

Use an accumulated number when you want to count something the player does and ensure you have an accurate account across all devices they may use. For example, a count of all enemies slain.

#### [gamecircle.Whispersync.GetAccumulatedNumber][plugin.gamecircle.Whispersync.GetAccumulatedNumber]
#### [gamecircle.Whispersync.IncrementAccumulatingNumber][plugin.gamecircle.Whispersync.IncrementAccumulatingNumber]
#### [gamecircle.Whispersync.DecrementAccumulatingNumber][plugin.gamecircle.Whispersync.DecrementAccumulatingNumber]
#### [gamecircle.Whispersync.GetAccumulatingNumberKeys][plugin.gamecircle.Whispersync.GetAccumulatingNumberKeys]

### Developer String Functions

A means for a developer to save a variety of data as a string. Data will be marked as "InConflict" if data downloaded from the cloud is newer and does not match current local data. The developer can then write code to manage the merging. This can range from automatically merging the important aspects of the information to asking the user which data set they want to keep.

#### [gamecircle.Whispersync.GetDeveloperString][plugin.gamecircle.Whispersync.GetDeveloperString]
#### [gamecircle.Whispersync.SetDeveloperString][plugin.gamecircle.Whispersync.SetDeveloperString]
#### [gamecircle.Whispersync.MarkAsResolved][plugin.gamecircle.Whispersync.MarkAsResolved]
#### [gamecircle.Whispersync.GetDeveloperStringKeys][plugin.gamecircle.Whispersync.GetDeveloperStringKeys]

### Highest Number Functions

Use a highest number when you want to keep track of the highest number of some value across multiple devices. For example, a player's personal, all-time high score on a level.

#### [gamecircle.Whispersync.GetHighestNumber][plugin.gamecircle.Whispersync.GetHighestNumber]
#### [gamecircle.Whispersync.SetHighestNumber][plugin.gamecircle.Whispersync.SetHighestNumber]
#### [gamecircle.Whispersync.GetHighestNumberKeys][plugin.gamecircle.Whispersync.GetHighestNumberKeys]

### Latest Number Functions

Use a latest number when you want to keep track of only the absolute latest number for a value across multiple devices. For example, a player's most recent score for a level.

#### [gamecircle.Whispersync.GetLatestNumber][plugin.gamecircle.Whispersync.GetLatestNumber]
#### [gamecircle.Whispersync.SetLatestNumber][plugin.gamecircle.Whispersync.SetLatestNumber]
#### [gamecircle.Whispersync.GetLatestNumberKeys][plugin.gamecircle.Whispersync.GetLatestNumberKeys]

### Lowest Number Functions

Use a lowest number when you want to keep track of the lowest number of some value across multiple devices. For example, a player's quickest completion time of a level.

#### [gamecircle.Whispersync.GetLowestNumber][plugin.gamecircle.Whispersync.GetLowestNumber]
#### [gamecircle.Whispersync.SetLowestNumber][plugin.gamecircle.Whispersync.SetLowestNumber]
#### [gamecircle.Whispersync.GetLowestNumberKeys][plugin.gamecircle.Whispersync.GetLowestNumberKeys]

### High Number List Functions

Just like a Highest Number, but it maintains a list of past entries from highest to lowest. Default list length limit is `5`.

#### [gamecircle.Whispersync.GetHighNumberList][plugin.gamecircle.Whispersync.GetHighNumberList]
#### [gamecircle.Whispersync.AddToHighNumberList][plugin.gamecircle.Whispersync.AddToHighNumberList]
#### [gamecircle.Whispersync.GetHighNumberListKeys][plugin.gamecircle.Whispersync.GetHighNumberListKeys]
#### [gamecircle.Whispersync.SetHighNumberListLength][plugin.gamecircle.Whispersync.SetHighNumberListLength]

### Latest Number List Functions

Just like a Latest Number, but it maintains a list of past entries from newest to oldest. Default list length limit is `5`.

#### [gamecircle.Whispersync.GetLatestNumberList][plugin.gamecircle.Whispersync.GetLatestNumberList]
#### [gamecircle.Whispersync.AddToLatestNumberList][plugin.gamecircle.Whispersync.AddToLatestNumberList]
#### [gamecircle.Whispersync.GetLatestNumberListKeys][plugin.gamecircle.Whispersync.GetLatestNumberListKeys]
#### [gamecircle.Whispersync.SetLatestNumberListLength][plugin.gamecircle.Whispersync.SetLatestNumberListLength]

### Low Number List Functions

Just like Lowest Number, but it maintains a list of past values from lowest to highest. Default list length limit is `5`. 

#### [gamecircle.Whispersync.GetLowNumberList][plugin.gamecircle.Whispersync.GetLowNumberList]
#### [gamecircle.Whispersync.AddToLowNumberList][plugin.gamecircle.Whispersync.AddToLowNumberList]
#### [gamecircle.Whispersync.GetLowNumberListKeys][plugin.gamecircle.Whispersync.GetLowNumberListKeys]
#### [gamecircle.Whispersync.SetLowNumberListLength][plugin.gamecircle.Whispersync.SetLowNumberListLength]

### Latest String Functions

Works like a Latest Number, but uses a string instead. 

#### [gamecircle.Whispersync.GetLatestString][plugin.gamecircle.Whispersync.GetLatestString]
#### [gamecircle.Whispersync.SetLatestString][plugin.gamecircle.Whispersync.SetLatestString]
#### [gamecircle.Whispersync.GetLatestStringKeys][plugin.gamecircle.Whispersync.GetLatestStringKeys]

### Latest String List Functions

Works like a Latest Number List, but uses strings instead. 

#### [gamecircle.Whispersync.GetLatestStringList][plugin.gamecircle.Whispersync.GetLatestStringList]
#### [gamecircle.Whispersync.AddToLatestStringList][plugin.gamecircle.Whispersync.AddToLatestStringList]
#### [gamecircle.Whispersync.GetLatestStringListKeys][plugin.gamecircle.Whispersync.GetLatestStringListKeys]
#### [gamecircle.Whispersync.SetLatestStringListLength][plugin.gamecircle.Whispersync.SetLatestStringListLength]

### String Set Functions

A list of unordered strings that have been stored in a group together. This function is useful for situations like recording entries that have been unlocked for an in-game guide. 

#### [gamecircle.Whispersync.GetStringSet][plugin.gamecircle.Whispersync.GetStringSet]
#### [gamecircle.Whispersync.AddToStringSet][plugin.gamecircle.Whispersync.AddToStringSet]
#### [gamecircle.Whispersync.StringSetContains][plugin.gamecircle.Whispersync.StringSetContains]
#### [gamecircle.Whispersync.GetStringSetValue][plugin.gamecircle.Whispersync.GetStringSetValue]
#### [gamecircle.Whispersync.GetStringSetKeys][plugin.gamecircle.Whispersync.GetStringSetKeys]

## Whispersync Properties

These are the data structures returned by Whispersync functions, either directly or through function callbacks.

#### [gamecircle.Whispersync.KeyTable][plugin.gamecircle.Whispersync.KeyTable]
#### [gamecircle.Whispersync.DeveloperString][plugin.gamecircle.Whispersync.DeveloperString]
#### [gamecircle.Whispersync.Metadata][plugin.gamecircle.Whispersync.Metadata]
#### [gamecircle.Whispersync.SyncableNumber][plugin.gamecircle.Whispersync.SyncableNumber]
#### [gamecircle.Whispersync.SyncableNumberList][plugin.gamecircle.Whispersync.SyncableNumberList]
#### [gamecircle.Whispersync.SyncableNumberElement][plugin.gamecircle.Whispersync.SyncableNumberElement]
#### [gamecircle.Whispersync.SyncableString][plugin.gamecircle.Whispersync.SyncableString]
#### [gamecircle.Whispersync.SyncableStringList][plugin.gamecircle.Whispersync.SyncableStringList]
#### [gamecircle.Whispersync.SyncableStringElement][plugin.gamecircle.Whispersync.SyncableStringElement]
#### [gamecircle.Whispersync.StringSetReturn][plugin.gamecircle.Whispersync.SyncableStringSet]

## Whispersync GameData Navigation Functions

When working with Whispersync for Games in the GameCircle SDK, all the data is stored in a root GameData object. If you don't touch any of the functions below, then all the data setting functions above will associate their data with that root GameData object. Whispersync, however, allows that root GameData object to have child GameData objects. Working like a tree, this allows you as a developer to separate out sets of data within your Whispersync. A common example of this is to have a child GameData object for each level of a game or for each character a player has, if multiple saves/characters are part of your game/app's design. 

In this plugin, this functionality is accessed through the functions below and the concept of stepping up and down inside the GameData tree. Stepping down lets you go deeper into the tree. For example, moving from the root GameData object to a child object called "Level 1", which is meant to save information related to a game's first level. If you then need to get from the GameData "Level 1" to "Level 2", you need to step back up to the root of the tree then step down to the "Level 2" data. If you have trouble visualizing these connections and methodology, please do some research into Tree data structures in programming. 

#### [gamecircle.Whispersync.GameDataStepDownTo][plugin.gamecircle.Whispersync.GameDataStepDownTo]
#### [gamecircle.Whispersync.GameDataStepUp][plugin.gamecircle.Whispersync.GameDataStepUp]
#### [gamecircle.Whispersync.GameDataReturnToRoot][plugin.gamecircle.Whispersync.GameDataReturnToRoot]
#### [gamecircle.Whispersync.CurrentDataMapChildKeys][plugin.gamecircle.Whispersync.CurrentDataMapChildKeys]
#### [gamecircle.Whispersync.CurrentDataMapContainsChild][plugin.gamecircle.Whispersync.CurrentDataMapContainsChild]
#### [gamecircle.Whispersync.CurrentDataMapGetPath][plugin.gamecircle.Whispersync.CurrentDataMapGetPath]


## Project Settings

To use this plugin, add an entry into the `plugins` table of `build.settings`. When added, the build server will integrate the plugin during the build phase.

``````
settings =
{
	plugins =
	{
		["plugin.gamecircle"] =
		{
			publisherId = "COM_INNOVATIVELEISURE"
		},
	},
}
``````


## CORONA_NATIVE_PRODUCT

The CORONA_NATIVE_PRODUCT edition of the plugin can be achieved in a similar manner to the normal version. You must download the plugin's package and include the four `.jar` files it contains. 

* `AmazonInsighss-android-sdk-2.1.26.jar`
* `gamecirclesdk.jar`
* `login-with-amazon-sdk.jar`
* `plugin.gamecircle.jar`

Along with including these four `.jar` files in the appropriate part of your CORONA_NATIVE_PRODUCT Project, you must make the following changes to your Android manifest. 

You must have the following two user permissions added to your app if they are not already there.

* `"android.permission.INTERNET"`
* `"android.permission.ACCESS_NETWORK_STATE"`

You must also add the following to your manifest and replace the `"@USER_ACTIVITY_PACAKGE@"` with your package identifier, as set near the top of the manifest file. 

``````
<activity android:name="com.amazon.ags.html5.overlay.GameCircleUserInterface" 
	android:theme="@style/GCOverlay" android:hardwareAccelerated="false"></activity>
<activity
  android:name="com.amazon.identity.auth.device.authorization.AuthorizationActivity"
  android:theme="@android:style/Theme.NoDisplay"
  android:allowTaskReparenting="true"
  android:launchMode="singleTask">
  <intent-filter>
	 <action android:name="android.intent.action.VIEW" />
	 <category android:name="android.intent.category.DEFAULT" />
	 <category android:name="android.intent.category.BROWSABLE" />
	 <data android:host="@USER_ACTIVITY_PACKAGE@" android:scheme="amzn" />
  </intent-filter>
</activity>
<activity android:name="com.amazon.ags.html5.overlay.GameCircleAlertUserInterface" 
android:theme="@style/GCAlert" android:hardwareAccelerated="false"></activity>
<receiver
  android:name="com.amazon.identity.auth.device.authorization.PackageIntentReceiver"
  android:enabled="true">
  <intent-filter>
	 <action android:name="android.intent.action.PACKAGE_INSTALL" />
	 <action android:name="android.intent.action.PACKAGE_ADDED" />
	 <data android:scheme="package" />
  </intent-filter>
</receiver>
``````

## Sample Code

You can access sample code [here](https://github.com/JesseInnovativeLeisure/CoronaGameCirclePluginSample).

