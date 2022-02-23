# collisionFilters.setupFilters()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          physics, collision, filter, setupFilters
> __See also__			[collisionFilters.getFilter()][plugin.collisionFilters.getFilter]
>						[collisionFilters.viewAllFilters()][plugin.collisionFilters.viewAllFilters]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Creates a collision filter association using convenient <nobr>human-readable</nobr> strings to indicate which categories of objects may collide with other categories of objects.

This function returns nothing; it merely sets up the filters and alerts to any errors in configuration.


## Syntax

	collisionFilters.setupFilters( filterTable )

##### filterTable ~^(required)^~
_[Table][api.type.Table]._ A table of <nobr>key-value</nobr> pairs which define collision filters, following this methodology:

* Each __key__ in the table must be unique and it should represent a general category for the object(s) which will use it. For example, `player`, `enemies`, or `powerUps`.

* The key's __value__ can be either a single string __or__ an [array][api.type.Array] of strings. In either case, the specified string(s) should match other general categories which the key category will be masked against.


## Example

``````lua
local collisionFilters = require( "plugin.collisionFilters" )

-- Set up collision filter relationship
-- This example creates 4 collision categories ("player", "enemies", "powerUps", "playerBullets")
collisionFilters.setupFilters(
{
	player = { "enemies", "powerUps" },  -- Objects with "player" filter will collide with "enemies" + "powerUps"
	enemies = "playerBullets",           -- Objects with "enemies" filter will collide with "playerBullets"
})
``````

<div class="docs-tip-outer">
<div class="docs-tip-inner-left">
<div class="fa fa-cog"></div>
</div>
<div class="docs-tip-inner-right">

Note that, even though only two <nobr>key-value</nobr> pairs are defined in this example, the collision filters plugin effectively creates __four__ collision categories. This is because the plugin automatically works through the keys __and__ the associated values (strings), intuitively associating filter relationships without expecting you to specify the "reverse&nbsp;associations" required in manual filter setup.

</div>
</div>
