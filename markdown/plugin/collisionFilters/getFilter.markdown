# collisionFilters.getFilter()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      [Table][api.type.Table]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          physics, collision, filter, getFilter
> __See also__			[collisionFilters.setupFilters()][plugin.collisionFilters.setupFilters]
>						[collisionFilters.viewAllFilters()][plugin.collisionFilters.viewAllFilters]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Calling this function with just a valid `filterName` returns the [table][api.type.Table] which should be referenced as the `filter` parameter of the [physics.addBody()][api.library.physics.addBody] function for the object you want to associate the filter with.

Alternatively, calling this function with `humanReadableFormat` as `true` returns a [table][api.type.Table] of all the corresponding mask category names, allowing the filter's contents to be clearly understood.


## Syntax

	collisionFilters.getFilter( filterName [, humanReadableFormat] )

##### filterName ~^(required)^~
_[String][api.type.String]._ A valid filter name as previously defined with [collisionFilters.setupFilters()][plugin.collisionFilters.setupFilters].

##### humanReadableFormat ~^(optional)^~
_[Boolean][api.type.Boolean]._ If set to `true`, the return value becomes a [table][api.type.Table] of all the corresponding mask category names, allowing the filter's contents to be clearly understood. This table is __not__ valid for usage in the [physics.addBody()][api.library.physics.addBody] function&nbsp;&mdash; its&nbsp;purpose is primarily for examining the filter's relationships.


## Examples

##### Physics Body Filter Usage

``````lua
local collisionFilters = require( "plugin.collisionFilters" )

collisionFilters.setupFilters(
{
	player = { "enemies", "powerUps" },
	enemies = "playerBullets",
})
 
-- Create the player object
local thisPlayer = display.newImageRect( "player.png", 64, 64 )
thisPlayer.x, thisPlayer.y = 100, 100

-- Add a physics body using the player filter
local playerFilter = collisionFilters.getFilter( "player" )
physics.addBody( thisPlayer, "dynamic", { filter=playerFilter } )
``````

##### Human-Readable Format Usage

``````lua
local collisionFilters = require( "plugin.collisionFilters" )

collisionFilters.setupFilters(
{
	player = { "enemies", "powerUps" },
	enemies = "playerBullets",
})

-- Display the player filter in an understandable format
local playerFilter = collisionFilters.getFilter( "player", true )
print( "'player' is set to collide with: " .. table.concat( playerFilter, ", " ) )
``````
