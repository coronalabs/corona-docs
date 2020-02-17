# object.\_lastChange

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Library__           [display.*][api.library.display]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          introspection, lastChange
> __See also__          [object._defined][api.type.DisplayObject.defined]
>						[object._properties][api.type.DisplayObject.properties]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Read-only property that provides the file and line number of the last change to any of the object's properties.

For further introspection options, see [object._defined][api.type.DisplayObject.defined] and [object._properties][api.type.DisplayObject.properties].

## Example

``````lua
local line = display.newLine( 200, 90, 227, 165 )
line.rotation = 45

print("line._lastChange: " .. line._lastChange )
--> line._lastChange: /Users/gimli/src/IntrospectionDemo/main.lua:4: 
``````