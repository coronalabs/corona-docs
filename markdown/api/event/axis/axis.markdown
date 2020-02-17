
# event.axis

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [InputAxis][api.type.InputAxis]
> __Event__             [axis][api.event.axis]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          axis, InputAxis
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Provides information about the [axis][api.type.InputAxis] that generated this event.

This information is needed to recognize which axis input your application has received data from, such as the "x" or "y" of a joystick. It also provides a [descriptor][api.type.InputAxis.descriptor] string which is unique amongst all input devices connected to the system and is intended to bind input to a particular player for multiplayer games.
