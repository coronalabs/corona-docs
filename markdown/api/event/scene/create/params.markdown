
# event.params

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Table][api.type.Table]
> __Event__             [create][api.event.scene.create]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          composer, scene, create, event
> --------------------- ------------------------------------------------------------------------------------------

## Overview

If the `params` option was specified when calling [composer.gotoScene()][api.library.composer.gotoScene], [composer.showOverlay()][api.library.composer.showOverlay], or [composer.loadScene()][api.library.composer.loadScene], the same value will be passed to `event.params` so it can be accessed by [create][api.event.scene.create] and [show][api.event.scene.show] event listeners for the scene that is being loaded.

If the `params` option was omitted when calling these functions, the value of `event.params` will be `nil`.


## Example

``````lua
--------------------------
-- From "scene1.lua"
--------------------------
local customParams = {
    var1 = "Hello ",
    var2 = "World!"
}
composer.gotoScene( "scene2", { effect="fade", time=800, params=customParams } )

--------------------------
-- In "scene2.lua"
--------------------------
local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
    print( event.params.var1 .. event.params.var2 )
end
scene:addEventListener( "create" )
``````