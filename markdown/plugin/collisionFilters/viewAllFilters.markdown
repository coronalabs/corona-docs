# collisionFilters.viewAllFilters()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      [Table][api.type.Table]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          physics, collision, filter, viewAllFilters
> __See also__			[collisionFilters.setupFilters()][plugin.collisionFilters.setupFilters]
>						[collisionFilters.getFilter()][plugin.collisionFilters.getFilter]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

This function returns a table of __all__ filters created via [collisionFilters.setupFilters()][plugin.collisionFilters.setupFilters] in <nobr>human-readable</nobr> format, where each key is a category/filter name and the value of each key is another table containing a list of all categories masked against the key category.

<div class="guide-notebox">
<div class="notebox-title">Note</div>

Data contained in the returned table is __not__ valid for usage in the [physics.addBody()][api.library.physics.addBody] function&nbsp;&mdash; its&nbsp;purpose is primarily for examining all filter relationships.

</div>


## Syntax

	collisionFilters.viewAllFilters()


## Example

``````lua
local collisionFilters = require( "plugin.collisionFilters" )

collisionFilters.setupFilters(
{
	player = { "enemies", "powerUps" },
	enemies = "playerBullets",
})

-- Find out which filters were created
local allReadableFilters = collisionFilters.viewAllFilters()
for k,v in pairs( allReadableFilters ) do
	print( "Filter/category '" .. k .. "' is set to collide with: " .. table.concat( v, ", " ) )
end
``````
