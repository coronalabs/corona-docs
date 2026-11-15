
# event.angle

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Event__             [fold][api.event.fold]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          fold, angle, hinge
> __See also__          [fold][api.event.fold]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

The hinge angle in radians. Convert it to degrees with `math.deg( event.angle )`.

This property is only provided on iOS, and is `nil` when the angle is unknown. Android and the Simulator do not report it.
