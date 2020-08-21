# transition.ignoreEmptyReference

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Boolean][api.type.Boolean]
> __Library__           [transition.*][api.library.transition]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          transition, ignoreEmptyReference
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Changes the default behavior of the [transition.pause()][api.library.transition.pause], [transition.resume()][api.library.transition.resume] and [transition.cancel()][api.library.transition.cancel] functions so that if `nil` or no argument is passed into these functions, they will be ignored and nothing will happen. The default behavior is `false`, which means that passing `nil` or no argument into these three functions will pause, resume or cancel all functions.

You can always use [transition.pauseAll()][api.library.transition.pauseAll], [transition.resumeAll()][api.library.transition.resumeAll] and [transition.cancelAll()][api.library.transition.cancelAll] to control all transitions.

## Syntax

	transition.ignoreEmptyReference

## Example

`````lua
transition.ignoreEmptyReference = true
`````
