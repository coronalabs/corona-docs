# select()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [(globals)][api.library.global]
> __Return value__      (varies)
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          select
> --------------------- ------------------------------------------------------------------------------------------


## Overview

If index is a number, `select()` returns all arguments after argument number index. Otherwise, index must be the string `#`, and `select()` returns the total number of extra arguments it received.

## Syntax

	select( index, ... )

##### index ~^(required)^~
_[Number][api.type.Number] or [String][api.type.String]._ This parameter can either be a number, in which case `select()` returns all arguments after argument number index. Otherwise, index must be the string `#`, and `select()` returns the total number of extra arguments it received.


## Examples

`````lua
-- This example demonstrates how to access individual return values
-- from a function that returns multiple values

print(string.find("hello hello", " hel"))         --> 6  9
print(select(1, string.find("hello hello", " hel"))) --> 6
print(select(2, string.find("hello hello", " hel"))) --> 9
`````

`````lua
-- This example prints the total number of extra arguments passed to the `select()` function
print(select("#", a,b,c)) --> 3
`````