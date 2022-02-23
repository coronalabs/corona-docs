# revmob.setUserDetails()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, RevMob, setUserDetails
> __See also__          [revmob.init()][plugin.revmob.init]
>						[revmob.*][plugin.revmob]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Sets the user's details to receive more <nobr>fine-grained</nobr> (customized) ads from RevMob.


## Syntax

	revmob.setUserDetails( params )


##### params ~^(required)^~
_[Table][api.type.Table]._ Table containing user details &mdash; see the next section for details.


## Parameter Reference

The `params` table includes parameters for RevMob ad customization.

##### gender ~^(optional)^~
_[String][api.type.String]._ The user's gender. Valid values are `"male"` or `"female"`.

##### userAgeRange ~^(optional)^~
_[Table][api.type.Table]._ A table specifying the age range of users to target. This table must contain the following <nobr>key-value</nobr> pairs:

* `min` &mdash; A [number][api.type.Number] representing the minimum age range to target.
* `max` &mdash; A [number][api.type.Number] representing the maximum age range to target.

##### userBirthday ~^(optional)^~
_[Table][api.type.Table]._ A table specifying the user's birthday (date&nbsp;of&nbsp;birth). This table must contain the following <nobr>key-value</nobr> pairs:

* `year` &mdash; A [number][api.type.Number] representing the user's birth year.
* `month` &mdash; A [number][api.type.Number] representing the user's birth month.
* `day` &mdash; A [number][api.type.Number] representing the user's birth day.

##### userInterests ~^(optional)^~
_[Table][api.type.Table]._ A table specifying the user's interests as a list of [strings][api.type.String].


## Example

``````lua
local revmob = require( "plugin.revmob" )

local function adListener( event )

	if ( event.phase == "init" ) then  -- Successful initialization
		-- Set user details
		revmob.setUserDetails(
			{
				gender = "male",
				userAgeRange = { min=18, max=40 },
				userBirthday = { year=1986, month=1, day=29 },
				userInterests = { "programming", "computers", "fishing", "cars" }
			})
	end
end

-- Initialize RevMob
revmob.init( adListener, { appId="YOUR_APP_ID" } )
``````
