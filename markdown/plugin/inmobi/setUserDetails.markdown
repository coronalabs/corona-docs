# inMobi.setUserDetails()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, InMobi, setUserDetails
> __See also__          [inMobi.load()][plugin.inmobi.load]
>						[inMobi.*][plugin.inmobi]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Allows you to set <nobr>user-specific</nobr> details for more <nobr>fine-grained</nobr> ad targeting.


## Syntax

	inMobi.setUserDetails( params )

##### params ~^(required)^~
_[Table][api.type.Table]._ Table containing InMobi user information &mdash; see the next section for details.


## Parameter Reference

The `params` table can include the following <nobr>user-specific</nobr> details:

##### gender ~^(optional)^~
_[String][api.type.String]._ The user's gender. Valid options are `"male"` or `"female"`.

##### userInterests ~^(optional)^~
_[Table][api.type.Table]._ Table of strings indicating the user's interests. You can supply any or all of the following strings: `"Business"`, `"Tech"`, `"Travel"`, `"Shopping"`, `"Entertainment"`, `"Fashion"`, `"Fitness"`, `"Foodie"`, `"Gamer"`, `"Jobs"`, or `"Sports"`. You must supply at least one value for this parameter to apply.

##### phoneAreaCode ~^(optional)^~
_[String][api.type.String]._ The area code of the user's phone number. For instance, the Republic&nbsp;of&nbsp;Ireland's area code is `"353"`.

##### postCode ~^(optional)^~
_[String][api.type.String]._ The user's post/postal code.

##### birthYear ~^(optional)^~
_[Number][api.type.Number]._ The user's birth year, for instance `1986`.

##### age ~^(optional)^~
_[Number][api.type.Number]._ The user's age, for instance `30`.

##### ageGroup ~^(optional)^~
_[String][api.type.String]._ The user's age group. Valid options are `"under18"`, `"18to24"`, `"25to34"`, `"35to44"`, `"45to54"`, `"55to65"`, or `"above65"`.

##### education ~^(optional)^~
_[String][api.type.String]._ The user's education level. Valid options are `"highSchoolOrLess"`, `"collegeOrGraduate"`, or `"graduateOrAbove"`.


## Example

``````lua
local inMobi = require( "plugin.inMobi" )

local function adListener( event )

	if ( event.phase == "init" ) then  -- Successful initialization
		print( event.isError )
	end
end

-- Initialize the InMobi plugin
inMobi.init( adListener, { accountId="YOUR_ACCOUNT_ID", logLevel="debug" } )

-- Set the user details
inMobi.setUserDetails(
	{
		gender = "male",
		userInterests = { "Business", "Tech" },
		postCode = "K1A0B1",
		ageGroup = "25to34",
		education = "collegeOrGraduate"
	})
``````
