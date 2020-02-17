# system.getPreference()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [system.*][api.library.system]
> __Return value__      various
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          system preference, getPreference
> __See also__          [system.deletePreferences()][api.library.system.deletePreferences]
>                       [system.setPreferences()][api.library.system.setPreferences]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns the requested preference's value.


## Gotchas

* This function will return `nil` if the requested preference was not found, or if its value could not be converted to the requested value type such as `"boolean"`, `"number"`, or `"string"`.

* On iOS, the `"ui"` language is set in the <nobr>__iPhone/iPad Language__</nobr> field of the __General__ &rarr; <nobr>__Language & Region__</nobr> screen of __Settings__. The `"locale"` parameters are set in the __Region__ field on the same screen.

* On Android, <nobr>`system.getPreference( "ui", "language" )`</nobr> may return `English` instead of `en`.

* In the Corona Simulator for Windows, the value returned by <nobr>`system.getPreference( "ui", "language" )`</nobr> may not match the expected value.


## Syntax

	system.getPreference( category, name [, type] )

##### category ~^(required)^~
_[String][api.type.String]._ Indicates where to read preferences from. Must be set to one of the following:

* `"app"` &mdash; The application's custom preferences. These are defined by the Corona app developer.
* `"locale"` &mdash; Accesses the operating system's <nobr>read-only</nobr> <nobr>locale-related</nobr> preferences.
* `"ui"` &mdash; Accesses the operating system's <nobr>read-only</nobr> <nobr>UI-related</nobr> preferences.

##### name ~^(required)^~
_[String][api.type.String]._ The unique name of the preference to read, depending on the category used:

* `"app"` &mdash; A preference name written to storage by the Corona app developer via the [system.setPreferences()][api.library.system.setPreferences] function.
* `"locale"` &mdash; Only supports preference names `"country"`, `"identifier"`, and `"language"`.
* `"ui"` &mdash; Only supports preference name `"language"`.

##### type ~^(optional)^~
_[String][api.type.String]._ Indicates the value type to be returned by this function. This type should match the preference value's type on storage. For example, all preferences belonging to the `"locale"` and `"ui"` categories are stored as strings and should be read as strings, while types for the `"app"` category should match the value types passed to the [system.setPreferences()][api.library.system.setPreferences] function. Accepted values include:

* `"string"` (default)
* `"boolean"`
* `"number"`


## Example

``````lua
-- Print the operating system's read-only preferences
print( system.getPreference( "ui", "language" ) )        -- Print the UI (device) language, i.e. "en-US"
print( system.getPreference( "locale", "country" ) )     -- Print the locale country, i.e. "US"
print( system.getPreference( "locale", "identifier" ) )  -- Print the locale language identifier, i.e. "en_US"
print( system.getPreference( "locale", "language" ) )    -- Print the locale language code, i.e. "en"

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
