
# io.read()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [io.*][api.library.io]
> __Return value__      [String][api.type.String], [Number][api.type.Number], or `nil`
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          io, read, file
> __See also__          [io.open()][api.library.io.open]
>						[io.input()][api.library.io.input]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Reads the file set by [io.input()][api.library.io.input], according to the given formats which specify what to read. For each format, the function returns a [string][api.type.String] or a [number][api.type.Number] with the characters read, or `nil` if it cannot read data with the specified format. When called without formats, it uses a default format that reads the entire next line (`"*l"`).

If you are reading data from a file, `file:read()` should be used instead of `io.read()`.

## Syntax

	io.read( [fmt1] [, fmt2] [, ...] )

##### fmt1, fmt2, ... ~^(optional)^~
_[String][api.type.String] or [Number][api.type.Number]._ Determines the type/amount of data to read. The available formats are:

* `"*l"` &mdash; Reads the next line (skipping the end of line), returning `nil` on end of file (EOF). This is the __default__ format.
* `"*n"` &mdash; Reads a [number][api.type.Number]; this is the only format that returns a [number][api.type.Number] instead of a [string][api.type.String].
* `"*a"` &mdash; Reads the whole file, starting at the current position. On end of file, it returns the empty string.
* [Number][api.type.Number] &mdash; Reads up to this number of characters, returning `nil` on end of file. If this number is `0`, it reads nothing and returns an empty string, or `nil` on end of file.
