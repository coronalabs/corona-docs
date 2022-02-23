# gamecircle.Init()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]  
> __Library__           [gamecircle.*][plugin.gamecircle]  
> __Return value__      None  
> __Revision__          [REVISION_LABEL](REVISION_URL)  
> __Keywords__          gamecircle, initialization, init  
> --------------------- ------------------------------------------------------------------------------------------


## Overview
This function needs to be called soon after loading the GameCircle plugin with "require". This is what tells GameCircle which features are going to be used, both for internal purposes as well as showing the correct set of icons on the GameCircle overlay. This is so the user can know which features are active. 
	

## Syntax

``````lua
gamecircle.Init(achievements, leaderboards, whispersync)
``````
	
##### achievements ~^(required)^~
_[Boolean][api.type.Boolean]._ Set to true if you app will use GameCircle achievements. Otherwise, set to false. 

##### leaderboards ~^(required)^~
_[Boolean][api.type.Boolean]._ Set to true if you app will use GameCircle leaderboards. Otherwise, set to false. 

##### whispersync ~^(required)^~
_[Boolean][api.type.Boolean]._ Set to true if you app will use GameCircle whispersync. Otherwise, set to false. 


## Examples
This example code is telling the GameCircle plugin that we intend to use the achievement and whispersync features, but not leaderboards. 

``````lua  
local gamecircle = require("plugin.gamecircle")  
gamecircle.Init(true, false, true)  
``````