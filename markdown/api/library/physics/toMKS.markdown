# physics.toMKS()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [physics.*][api.library.physics]
> __Return value__      [Number][api.type.Number]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          MKS conversion
> __See also__          [physics.fromMKS()][api.library.physics.fromMKS]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Convenience function for converting from Corona units to MKS units.

## Syntax

	physics.toMKS( unitName, value )

##### unitName ~^(required)^~
_[String][api.type.String]._ Can be one of the following values:

* `"length"`
* `"velocity"`
* `"angularVelocity"`

##### value ~^(required)^~
_[Number][api.type.Number]._ The value to convert from Corona units to MKS.


## Example

`````lua
local mks_units = physics.toMKS( "velocity", 16 )
`````
