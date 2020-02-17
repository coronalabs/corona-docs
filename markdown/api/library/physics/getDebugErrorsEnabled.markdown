
# physics.getDebugErrorsEnabled()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [physics.*][api.library.physics]
> __Return value__      [Boolean][api.type.Boolean]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Box2D, internal, asserts, run-time, error
> __See also__          [physics.setDebugErrorsEnabled()][api.library.physics.setDebugErrorsEnabled]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

This function is used to determine if extra physics errors are allowed to be caught by Box2D.

## Gotchas

This feature is currently available only in the Mac simulator.

## Returns

* `false` (default) — Disabled.
* `true` — Enabled.

## Syntax

	physics.getDebugErrorsEnabled()

## Example

`````lua
-- Toggle physics errors for debugging.
if ( physics.getDebugErrorsEnabled() ) then

    physics.setDebugErrorsEnabled( false )

else

    physics.setDebugErrorsEnabled( true )

end
`````
