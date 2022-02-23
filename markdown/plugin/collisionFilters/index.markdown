# collisionFilters.*

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Library][api.type.Library]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          physics, collision, filter
> __Platforms__			Android, iOS, macOS, Windows, tvOS
> __See also__			[Collision Detection][guide.physics.collisionDetection] _(guide)_
>						[Physics Bodies][guide.physics.physicsBodies] _(guide)_
> --------------------- ------------------------------------------------------------------------------------------


## Overview

This plugin is designed to circumvent the math and complication of creating physics body collision filters using `categoryBits` and `maskBits` as documented [here][guide.physics.collisionDetection#filtering]. It works by letting you assign <nobr>user-friendly</nobr> names to "categories" of objects in your physics simulation, without worrying about internal binary values and sums which are liable to change as you adjust game behavior.

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

This plugin enforces the standard compliance with Box2D to ensure correct functionality, including:

* A maximum of __16__ distinct collision categories may be used (note&nbsp;that even complex games don't often require more&nbsp;than&nbsp;10).

* When necessary, new filters and unpaired masks are added to ensure compliance with Box2D <nobr>category+mask</nobr> relationships. Console alerts are generated when this occurs.

</div>


## Syntax

	local collisionFilters = require( "plugin.collisionFilters" )


## Project Settings

To use this plugin, add an entry into the `plugins` table of `build.settings`. When added, the build server will integrate the plugin during the build phase.

``````{ brush="lua" gutter="false" first-line="1" highlight="[5,6,7,8]" }
settings =
{
	plugins =
	{
		["plugin.collisionFilters"] =
		{
			publisherId = "com.coronalabs"
		},
	},
}
``````


## Functions

#### [collisionFilters.setupFilters()][plugin.collisionFilters.setupFilters]

#### [collisionFilters.getFilter()][plugin.collisionFilters.getFilter]

#### [collisionFilters.viewAllFilters()][plugin.collisionFilters.viewAllFilters]
