
# physics.fromMKS()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [physics.*][api.library.physics]
> __Return value__      [Number][api.type.Number]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          MKS conversion
> __See also__          [physics.toMKS()][api.library.physics.toMKS]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Convenience function for converting from MKS units to Corona units.

## Syntax

	physics.fromMKS( unitName, value ) 

##### unitName ~^(required)^~
_[String][api.type.String]._ Can be one of the following values:

* `"length"`				<!-- completion -->
* `"velocity"`				<!-- completion -->
* `"angularVelocity"`		<!-- completion -->

##### value ~^(required)^~
_[Number][api.type.Number]._ The value to convert from MKS to Corona units.


## Example

`````lua
local corona_unit = physics.fromMKS( "velocity", 30 )
`````
