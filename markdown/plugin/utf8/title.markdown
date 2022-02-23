# utf8.title()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [utf8.*][plugin.utf8]
> __Return value__      [String][api.type.String]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          utf8, UTF-8, Unicode, string, title
> __See also__			[utf8.escape()][plugin.utf8.escape]
>						[utf8.fold()][plugin.utf8.fold]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Converts a <nobr>UTF-8</nobr> string to title case. This is special type of uppercase which differs for a few <nobr>language-specific</nobr> characters. See the Unicode [documentation](http://unicode.org/faq/casemap_charprop.html) for further details.


## Syntax

	utf8.title( s )

##### s ~^(required)^~
_[String][api.type.String]._ The string to convert.


## Example

``````lua
local utf8 = require( "plugin.utf8" )

local testStr = utf8.escape( "%x1C4, %x1C5, %x1C6, %x1C7, %x1C8, %x1C9, %x1CA, %x1CB, %x1CC, %x1F1, %x1F2, %x1F3, %x1F9" )

print( testStr )                --> Ǆ, ǅ, ǆ, Ǉ, ǈ, ǉ, Ǌ, ǋ, ǌ, Ǳ, ǲ, ǳ, ǹ
print( utf8.upper( testStr ) )  --> Ǆ, Ǆ, Ǆ, Ǉ, Ǉ, Ǉ, Ǌ, Ǌ, Ǌ, Ǳ, Ǳ, Ǳ, Ǹ
print( utf8.title( testStr ) )  --> ǅ, ǅ, ǅ, ǈ, ǈ, ǈ, ǋ, ǋ, ǋ, ǲ, ǲ, ǲ, Ǹ
``````
