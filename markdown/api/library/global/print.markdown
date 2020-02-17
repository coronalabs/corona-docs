# print()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [(globals)][api.library.global]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          print, write, console
> __See also__          [io.write()][api.library.io.write]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Receives any number of arguments and prints their values to `stdout` in the Corona&nbsp;Simulator&nbsp;Console, Xcode, ADB, etc. `print()` is not intended for formatted output, but rather as a quick way to show a value, typically for debugging. For formatted output, use [string.format][api.library.string.format].


## Gotchas

If you are concatenating potentially `nil` values for output, convert them to strings using the [tostring()][api.library.global.tostring] function:

``````lua
local nilValue = nil
print( "Value: " .. tostring(nilValue) )
``````


## Syntax

	print( [...] )

##### ... ~^(optional)^~
_[Number][api.type.Number] or [String][api.type.String]._ The text to output to `stdout` (generally the Corona Simulator Console). This function will append a newline character (`\n`) to the end of the final output string.


## Console Highlighting

In the Corona Simulator Console, a [string][api.type.String] output via `print()` can be highlighted as a "warning" or "error" by prefixing it with `WARNING:` or `ERROR:` respectively. For example:

``````lua
print( "WARNING: " .. "This is a warning!" )
print( "ERROR: " .. "This is an error!" )
``````

<div class="console-warning">

`WARNING: This is a warning!`

</div>
<div class="console-error">

`ERROR: This is an error!`

</div>


## Example

`````lua
print( "Hello world!" )

-- OUTPUT: Hello world!
`````
