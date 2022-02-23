# gpn.setShouldKillOnLowMemory()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [function][api.type.Function]
> __Library__           [gpn.*][plugin.gpn]
> __Return value__      [Boolean][api.type.Boolean]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          
> __Sample code__       
> __See also__          
> --------------------- ------------------------------------------------------------------------------------------


## Overview

iOS only: sets the boolean flag to enable/disable low memory handling. If a memory warning is received and the flag is set, the ad will be destroyed and "killedLowMem" event will be dispatched (you should restart you ad request at some point). 

## Syntax

	gpn.setShouldKillOnLowMemory( flag )

##### flag ~^(required)^~
_[Boolean][api.type.Boolean]._ Flag to enable/disable killing the ad on a low memory warning.

## Examples

``````lua

    gpn.setShouldKillOnLowMemory( flag )
    
``````
