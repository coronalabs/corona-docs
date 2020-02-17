# math.random()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [math.*][api.library.math]
> __Return value__      [Number][api.type.Number]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          random, random number
> __See also__          [math.randomseed()][api.library.math.randomseed]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns a pseudo-random number from a sequence with uniform distribution.

This function is an interface to the simple pseudo-random generator function `rand` provided by ANSI C. No guarantees can be given for its statistical properties.

There are three usage options for this function:

1. When called without arguments, returns a uniform <nobr>pseudo-random</nobr> real number in the range `[0,1]`. 
2. When called with an integer number `m`, `math.random` returns a uniform <nobr>pseudo-random</nobr> integer in the range `[1,m]`.
3. When called with two integer numbers `m` and `n`, `math.random` returns a uniform <nobr>pseudo-random</nobr> integer in the range `[m,n]`.

<div class="guide-notebox">
<div class="notebox-title">Note</div>

The random number generator needs to be started with a seed using [math.randomseed()][api.library.math.randomseed] before this function is called or else it will generate the same sequence every time.  While this is useful for testing, it is more usual to get a different random sequence each run by using a different seed <nobr>(such as the current time)</nobr>.

</div>


## Syntax

	math.random()

	math.random( m )

	math.random( m, n )

##### m ~^(optional)^~
_[Number][api.type.Number]._ A number.

##### n ~^(optional)^~
_[Number][api.type.Number]._ A number.

## Examples

``````lua
print(math.random())        --> a number between 0 and 1
print(math.random())        --> another number between 0 and 1
print(math.random(10))      --> an integer between 1 and 10 (inclusive)
print(math.random(70, 80))  --> an integer between 70 and 80 (inclusive)
``````
