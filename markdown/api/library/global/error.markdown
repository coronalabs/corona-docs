# error()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [(globals)][api.library.global]
> __Return value__      [String][api.type.String]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          error, exception, error handling, error message
> __See also__          [pcall()][api.library.global.pcall]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Terminates the last protected function called (see: [pcall()][api.library.global.pcall]) and returns the first argument as the error message.

Usually, `error()` adds some information about the error position at the beginning of the message.

## Syntax

	error( message [, level] )

##### message ~^(required)^~
_[String][api.type.String]._ The message to be returned with the error.

##### level ~^(optional)^~
_[Number][api.type.Number]._ Specifies how to get the error position. With Level `1` (the default), the error position is where the error function was called. Level `2` points the error to where the function that called error was called; and so on. Passing a level `0` avoids the addition of error position information to the message.