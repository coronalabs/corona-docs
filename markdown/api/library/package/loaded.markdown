# package.loaded

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Table][api.type.Table]
> __Library__           [package.*][api.library.package]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          package
> __See also__          [require()][api.library.package.require]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

A table used by `require()` to control which modules are already loaded. When you require a module `modname` and `package.loaded[modname]` is not `false`, `require()` simply returns the value stored there.


## Syntax

	package.loaded


## Example

``````lua
local ui = require( "ui" )
print( package.loaded.ui )   --> table: 0x170f83d0
print( package.loaded.abc )  --> nil (package not loaded)
``````
