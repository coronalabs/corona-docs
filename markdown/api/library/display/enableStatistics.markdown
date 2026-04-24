# display.enableStatistics()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [display.*][api.library.display]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          performance, statistics, debug, draw calls, rendering
> __See also__          [display.getStatistics()][api.library.display.getStatistics]
>                       [display.getTimings()][api.library.display.getTimings]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Enables or disables the collection of per‑frame rendering statistics. When enabled, CORONA_CORE_PRODUCT tracks high‑level counters such as the number of draw calls, triangles rendered, and texture bindings. These statistics can then be retrieved with [display.getStatistics()][api.library.display.getStatistics].

## Gotchas

Enabling statistics has a **performance cost**, so it should only be used for debugging and profiling purposes, not in production builds.

## Syntax

    display.enableStatistics( enable )

##### enable ~^(required)^~
_[Boolean][api.type.Boolean]._ Pass `true` to start collecting statistics, or `false` to stop.
