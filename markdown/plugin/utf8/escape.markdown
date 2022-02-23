# utf8.escape()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [utf8.*][plugin.utf8]
> __Return value__      [String][api.type.String]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          utf8, UTF-8, Unicode, string, escape
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Converts a string with escape sequences to a <nobr>UTF-8</nobr> formatted string. Several escape formats are supported:

<div class="inner-table">

Format				Description	  
------------------	------------------------------------------
`%n`				`n` is a numeric Unicode code point
`%{n}`				same as `%n` but with braces
`%un`				same as `%n`; `u` stands for "Unicode"
`%u{n}`				same as `%{n}`; `u` stands for "Unicode"
`%xh`				hexadecimal number
`%x{h}`				same as `%xh` but with braces
`%?`				`?` stands for any other character: escape this character
------------------	------------------------------------------

</div>


## Syntax

	utf8.escape( s )

##### s ~^(required)^~
_[String][api.type.String]._ The string to convert.


## Example

``````lua
local utf8 = require( "plugin.utf8" )

local testStr = utf8.escape( "%9825%32%{20320}%u{22909}%xFF0C%x{4E16}%x754C%32%9825" )

print( testStr )  --> ♡ 你好，世界 ♡
``````
