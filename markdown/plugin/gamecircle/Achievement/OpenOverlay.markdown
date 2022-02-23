# gamecircle.Achievement.OpenOverlay()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]  
> __Library__           [gamecircle.*][plugin.gamecircle]  
> __Return value__      None  
> __Revision__          [REVISION_LABEL](REVISION_URL)  
> __Keywords__          Achievement, Overlay  
> --------------------- ------------------------------------------------------------------------------------------


## Overview
This function will make the GameCircle SDK open it's own Achievement overlay on top of the current application. This will allow users to see their achievements, both those unlocked and locked, as well as see their progress on individual achievements. 


## Syntax
	gamecircle.Achievement.OpenOverlay()


## Examples

``````lua  
local gamecircle = require("plugin.gamecircle")  
gamecircle.Init(true, false, false)  
gamecircle.Achievement.OpenOverlay()  
``````