# fuse.register()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, monetization, fuse, register
> __See also__          [fuse.*][plugin.fuse]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Registers user properties with the Fuse tracking system, for example the user's level, amount of virtual currency, actual age/gender, etc. By creating distinct zones within the Fuse dashboard, you may target users based on specific registered criteria.


## Syntax

	fuse.register( propertyType [, params] )

##### propertyType ~^(required)^~
_[String][api.type.String]._ Specifies the type of property to register. Valid options include:

* `"currency"` &mdash; Register a currency type and its current balance.
* `"level"` &mdash; Register the user's level.
* `"gender"` &mdash; Register the user's gender.
* `"age"` &mdash; Register the user's age.
* `"birthday"` &mdash; Register the user's birthday.
* `"parental"` &mdash; Register the user's parental consent status.
* `"virtualGoodsPurchase"` &mdash; Register a virtual goods purchase.
* `"rewardedVideo"` &mdash; Optional custom account ID for rewarded video server verification.
* `"custom"` &mdash; Register unique information on a per-user basis.
* `"pushToken"` &mdash; Requests user authorization for push notifications.

##### params ~^(optional)^~
_[Table][api.type.Table]._ Table which specifies optional parameters &mdash; see the next section for details.


## Parameter Reference

The `params` table should include key-value pairs associated with the `propertyType` being registered.

### currency

Fuse supports up to 4 different types of virtual currencies per app, each associated with an integer between `1` and `4`. These currencies should represent consumable items like tokens, coins, diamonds, etc. For example, "coins" may be represented by the integer `1` and, by calling `fuse.register()` within the game, you may register when the user has earned 2000 coins.

The following key-value pairs pertain to registering virtual currency:

* `currency` &mdash; Required [number][api.type.Number] indicating the currency type. Valid integers are `1` to `4` inclusive.
* `balance` &mdash; Required [number][api.type.Number] indicating the balance for the specified currency type.

### level

* `level` &mdash; Required [number][api.type.Number] indicating the user's level.

### gender

* `gender` &mdash; Required [string][api.type.String] value of `"male"` or `"female"`.

### age

* `age` &mdash; Required [number][api.type.Number] indicating the user's age.

### birthday

* `day` &mdash; Required [number][api.type.Number] indicating the user's day of birth.
* `month` &mdash; Required [number][api.type.Number] indicating the user's month of birth.
* `year` &mdash; Required [number][api.type.Number] indicating the user's year of birth.


### parental

* `consent` &mdash; Required [boolean][api.type.Boolean] value of `true` indicating that the user's parent had consented.

### virtualGoodsPurchase

* `virtualGoodsId` &mdash; Required [number][api.type.Number] identifying the virtual good, found on the Fuse dashboard. If the purchase was initiated with [event.type][plugin.fuse.event.adsRequest.type] of `"rewarded"`, this parameter should be the same as the `offerObjectID` property of [event.payload][plugin.fuse.event.adsRequest.payload].
* `currencyId` &mdash; Required [number][api.type.Number] indicating the currency used, found on the Fuse dashboard.
* `amount` &mdash; Required [number][api.type.Number] indicating the amount of currency spent.

### custom

* `eventId` &mdash; Required [number][api.type.Number] identifier of the event to register. This should be an integer between `1` and `20` inclusive. Event numbers `1`-`10` are reserved for integers and event numbers `11`-`20` are reserved for strings.
* `value` &mdash; Required [number][api.type.Number] or  [string][api.type.String] depending on the `eventId` parameter.

Example properties you should track for custom integer type events:

* Scores
* Play counts
* Number of friends

Example properties you should __not__ track for custom integer type events:

* Pre-existing metrics
* Device or player IDs
* Account info

Example properties you should track for custom string type events:

* Colors (costume, uniform, team color, etc.)
* Power-ups
* Weapons

Example properties you should __not__ track for custom string type events:

* Pre-existing metrics
* Device or player IDs
* Dynamic variables
* E-mails
* Account info

### pushToken

No additional parameters are necessary for this property type &mdash; simply submit `"pushToken"` as the `propertyType` parameter. Then, to enable push notifications, follow the instructions related to push notification setup outlined in the [Local/Push Notifications][guide.events.appNotification] guide, depending on the platforms you want to support.


## Example

``````lua
local fuse = require( "plugin.fuse" )

-- Event listener function
local function adListener( event )

	if ( event.isError ) then
		print( "Fuse error: " .. event.response )
    else
		if ( event.phase == "init" ) then
			-- Fuse system initialized
        end
    end
end

-- Initialize the Fuse service
fuse.init( adListener )

-- Register a currency type/balance
fuse.register( "currency", { currency=1, balance=200 } )

-- Register user's level
fuse.register( "level", { level=4 } )

-- Register user's gender
fuse.register( "gender", { gender="female" } )

-- Register user's age
fuse.register( "age", { age=32 } )

-- Register user's birthday
fuse.register( "birthday", { day=2, month=8, year=1982 } )

-- Register the user's parental consent status
fuse.register( "parental", { consent=true } )

-- Register a virtual goods purchase
fuse.register( "virtualGoodsPurchase", { virtualGoodsId=123456, currencyId=987, amount=50 } )

-- Register user's customization color
fuse.register( "custom", { eventId=12, value="Blue" } )

-- Request user authorization for push notifications
fuse.register( "pushToken" )
``````

