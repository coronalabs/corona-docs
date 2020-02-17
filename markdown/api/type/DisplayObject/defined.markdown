# object.\_defined

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Library__           [display.*][api.library.display]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          introspection, defined
> __See also__          [object._lastChange][api.type.DisplayObject.lastChange]
>						[object._properties][api.type.DisplayObject.properties]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Read-only property that provides the file and line number where the object was created.

For further introspection options, see [object._lastChange][api.type.DisplayObject.lastChange] and [object._properties][api.type.DisplayObject.properties].

## Example

``````lua
local line = display.newLine( 200, 90, 227, 165 )

print("line._defined: " .. line._defined )
--> line._defined: /Users/gimli/src/IntrospectionDemo/main.lua:3: 
``````