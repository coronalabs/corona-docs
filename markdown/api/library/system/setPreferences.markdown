# system.setPreferences()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [system.*][api.library.system]
> __Return value__      [Boolean][api.type.Boolean]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          system preference, setPreferences
> __See also__          [system.getPreference()][api.library.system.getPreference]
>						[system.deletePreferences()][api.library.system.deletePreferences]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Writes a [table][api.type.Table] of preference values to storage. If any of the given preferences do not exist in storage, they will be inserted. If any of the given preferences already exist in storage, they will be overwritten.

Returns `true` if __all__ of the given preferences were written to storage successfully. Returns `false` if at least one of the given preferences failed to be written to storage.


## Gotchas

* This function is a blocking call and it won't return a result until all of the given preferences have been written to storage. As a result, this function may cause performance issues and it should not be called frequently, during active gameplay, or in a UI object's listener function. For best performance, it's best to write multiple preferences via a single call after leaving a scene or during an `"applicationExit"` [system event][api.event.system.type].


## Syntax

	system.setPreferences( category, preferences )

##### category ~^(required)^~
_[String][api.type.String]._ Indicates which set of preferences should be accessed on the system. Currently, only the `"app"` category is supported&nbsp;&mdash; this is the application's custom preferences defined by the Corona app developer.

##### preferences ~^(required)^~
_[Table][api.type.Table]._ Table of preferences to be written to storage. This table should contain <nobr>key-value</nobr> pairs where the key is the unique name of the preference and its value is either a [boolean][api.type.Boolean], [number][api.type.Number], or [string][api.type.String].


## Example

``````lua
-- Write this app's custom preferences to storage
local appPreferences =
{
	myBoolean = true,
	myNumber = 123.45,
	myString = "Hello World"
}
system.setPreferences( "app", appPreferences )

-- Read the preferences that were written to storage above
local myBoolean = system.getPreference( "app", "myBoolean", "boolean" )
local myNumber = system.getPreference( "app", "myNumber", "number" )
local myString = system.getPreference( "app", "myString", "string" )
``````
