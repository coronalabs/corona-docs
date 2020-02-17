# system.deletePreferences()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [system.*][api.library.system]
> __Return value__      [Boolean][api.type.Boolean]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          system preference, deletePreferences
> __See also__          [system.getPreference()][api.library.system.getPreference]
>                       [system.setPreferences()][api.library.system.setPreferences]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Deletes preferences from storage.

Returns `true` if __all__ of the given preferences were successfully deleted and no longer exist in storage. If a requested preference did not already exist in storage, it's still regarded as successfully deleted. 

Returns `false` if at least one of the given preferences failed to be deleted from storage.


## Gotchas

* This function is a blocking call and it won't return a result until all of the given preferences have been deleted from storage. As a result, this function may cause performance issues and it should not be called frequently, during active gameplay, or in a UI object's listener function. For best performance, it's best to delete multiple preferences via a single call after leaving a scene or during an `"applicationExit"` [system event][api.event.system.type].


## Syntax

	system.deletePreferences( category, preferenceNames )

##### category ~^(required)^~
_[String][api.type.String]._ Indicates which set of preferences should be accessed on the system. Currently, only the `"app"` category is supported&nbsp;&mdash; this is the application's custom preferences defined by the Corona app developer.

##### preferenceNames ~^(required)^~
_[Array][api.type.Array]._ An array of [strings][api.type.String] indicating unique preference names to be deleted from storage.


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

-- Sometime later, delete the preferences that were written to storage
system.deletePreferences( "app", { "myBoolean", "myNumber", "myString" } )
``````
