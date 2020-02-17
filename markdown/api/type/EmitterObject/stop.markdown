# EmitterObject:stop()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Object__            [EmitterObject][api.type.EmitterObject]
> __Library__           [display.*][api.library.display]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          EmitterObject, stop
> __See also__			[display.newEmitter()][api.library.display.newEmitter]
>						[EmitterObject:start()][api.type.EmitterObject.start]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Stops the emission of particles from an [EmitterObject][api.type.EmitterObject]. This function allows the currently active particles to finish their cycle naturally.

To remove all particles instantly, use [object:removeSelf()][api.type.DisplayObject.removeSelf] on the [EmitterObject][api.type.EmitterObject].

## Syntax

	EmitterObject:stop()
