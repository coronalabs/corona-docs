
# physics.setDebugErrorsEnabled()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [physics.*][api.library.physics]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Box2D, internal, asserts, error
> __See also__          [physics.getDebugErrorsEnabled()][api.library.physics.getDebugErrorsEnabled]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

This function allows extra physics errors to be caught by Box2D.

## Gotchas

This feature is currently available only in the Corona Simulator for macOS.

## Syntax

	physics.setDebugErrorsEnabled( enabled )

##### enabled ~^(required)^~
_[Boolean][api.type.Boolean]._ Allow extra physics errors to be caught by Box2D.

## Example

`````lua
-- Toggle extra physics errors for debugging
if ( physics.getDebugErrorsEnabled() ) then
    physics.setDebugErrorsEnabled( false )
else
    physics.setDebugErrorsEnabled( true )
end
`````
