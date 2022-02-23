# utf8.fold()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [utf8.*][plugin.utf8]
> __Return value__      [String][api.type.String]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          utf8, UTF-8, Unicode, string, fold
> __See also__			[utf8.escape()][plugin.utf8.escape]
>						[utf8.title()][plugin.utf8.title]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Converts a <nobr>UTF-8</nobr> string to folded case. This is useful for comparing strings while ignoring letter case. For most purposes this is equivalent to `utf8.lower()`. See the Unicode [documentation](http://unicode.org/faq/casemap_charprop.html) for further details.


## Syntax

	utf8.fold( s )

##### s ~^(required)^~
_[String][api.type.String]._ The string to convert.


## Example

``````lua
local utf8 = require( "plugin.utf8" )

local testStr = utf8.escape( "%xB5, %x130, %x17F, %x345, %x3C2, %x3D0, %x3D1, %x3D5, %x3D6, %x3F0, %x3F1, %x3F5, %x1E9B, %x1FBE" )

print( utf8.lower( testStr ) )  --> µ, i, ſ,  ͅ, ς, ϐ, ϑ, ϕ, ϖ, ϰ, ϱ, ϵ, ẛ, ι
print( utf8.fold( testStr ) )   --> μ, İ, s, ι, σ, β, θ, φ, π, κ, ρ, ε, ṡ, ι
``````
