
# event.device

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [InputDevice][api.type.InputDevice]
> __Event__             [key][api.event.key]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          key, device
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Provides access to the [device][api.type.InputDevice] that the key event came from.

This is intended to be used by multiplayer games where multiple input devices will provide the same keys/buttons. Essentially, this property can be used to differentiate key events coming from different devices/players.


## Gotchas

* On Android, this property will return `nil` if the key event came from software, such as the virtual keyboard or the bottom virtual navigation bar.
