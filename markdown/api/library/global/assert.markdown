# assert()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [(globals)][api.library.global]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          assert, error
> __See also__          [error()][api.library.global.error]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Issues an error and aborts the program when the value of its first argument is `false` <nobr>(`nil` or `false`)</nobr>. Otherwise, it returns all its arguments.

This function is useful for catching (and&nbsp;avoiding) unexpected situations and bugs.


## Syntax

	assert( v [, message] )

##### v ~^(required)^~
_Any._ Issues an error when this value is false.

##### message ~^(optional)^~
_[String][api.type.String]._ An error message. When absent, it defaults to "assertion&nbsp;failed!". The error message is displayed in the Corona Simulator Console.


## Example

`````lua
-- Abort the program if the image is not found (in the Resource directory)
local img = display.newImage( "imageWithWrongName.png" )
assert( img, "Error: Image not found!" )
`````

