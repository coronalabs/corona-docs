# pasteboard.clear()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          clear, pasteboard
> __See also__          [Pasteboard][plugin.pasteboard]
>								[pasteboard.copy()][plugin.pasteboard.copy]
>								[pasteboard.paste()][plugin.pasteboard.paste]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Clears the pasteboard of its data.


## Syntax

	pasteboard.clear()


## Examples

``````lua
local pasteboard = require( "plugin.pasteboard" )

-- Clear data from the pasteboard
pasteboard.clear()
``````