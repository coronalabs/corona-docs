
# event.id

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [userdata][api.type.userdata]
> __Event__             [relativeTouch][api.event.relativeTouch]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          touch, relativeTouch, id
> --------------------- ------------------------------------------------------------------------------------------

## Overview

A unique identifier of the chosen touch that enables you to distinguish between multiple touches across different relative touch events. This uniquely identifies a given finger touching the device as that touch changes state, for example as the touch generates new [phase][api.event.relativeTouch.phase] events such as `"moved"`, `"ended"`, etc.
