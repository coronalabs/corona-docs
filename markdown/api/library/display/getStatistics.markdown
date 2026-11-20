# display.getStatistics()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [display.*][api.library.display]
> __Return value__      [Table][api.type.Table]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          performance, statistics, debug, draw calls, rendering
> __See also__          [display.enableStatistics()][api.library.display.enableStatistics]
>                       [display.getTimings()][api.library.display.getTimings]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Retrieves the current frame's rendering statistics that were collected after calling [display.enableStatistics( true )][api.library.display.enableStatistics]. This provides per‑frame counters such as the number of draw calls, triangles rendered, and GPU time.

All values are reset at the beginning of each frame. To obtain meaningful data, call this function once per frame, typically from a `lateUpdate` listener or a repeating timer.

## Syntax

    display.getStatistics( [table] )

##### table ~^(optional)^~
_[Table][api.type.Table]._ An optional table to fill with the statistics. If provided, it is cleared and reused for performance. If omitted, a new table is created and returned.

## Return Value

_[Table][api.type.Table]._ The table containing the statistics key‑value pairs. See **Statistics Keys** below for the available fields.

### Statistics Keys

* `drawCallCount` &mdash; Number of draw calls issued.
* `geometryBindCount` &mdash; Number of geometry buffer bindings.
* `lineCount` &mdash; Number of lines drawn.
* `preparationTime` &mdash; Time spent preparing render data (e.g., batching, culling) before drawing (in milliseconds).
* `programBindCount` &mdash; Number of shader program bindings.
* `renderTimeCPU` &mdash; Time spent by the CPU preparing and submitting rendering commands (in milliseconds).
* `renderTimeGPU` &mdash; Time spent by the GPU rendering the frame (in milliseconds).
* `resourceCreateTime` &mdash; Time spent creating GPU resources (e.g., textures, buffers) during the frame (in milliseconds).
* `resourceUpdateTime` &mdash; Time spent updating existing GPU resources (e.g., texture uploads) during the frame (in milliseconds).
* `resourceDestroyTime` &mdash; Time spent destroying GPU resources during the frame (in milliseconds).
* `textureBindCount` &mdash; Number of texture bindings.
* `triangleCount` &mdash; Number of triangles drawn.

## Example

`````lua
-- Enable statistics collection first
display.enableStatistics( true )

local stats = {}

-- Print statistics once per second
timer.performWithDelay( 1000, function()
    display.getStatistics( stats )
    
    print( "Frame Statistics:" )
    for k, v in pairs( stats ) do
        print( "  " .. k .. ": " .. tostring( v ) )
    end
    print( "---" )
end, 0 )
`````
