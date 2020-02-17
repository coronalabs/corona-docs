# InputDevice

> --------------------- ------------------------------------------------------------------------------------------
> __Parent__            [Userdata][api.type.Userdata]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          device, input, key
> --------------------- ------------------------------------------------------------------------------------------

## Overview

An object of this type respresent one input device such as a keyboard, mouse, touchscreen, gamepad, etc. This object provides access to the input device's information and its current connection status.

An input device object is normally provided with a [key][api.event.key] event, which allows an application to identify which device the input event came from. This is important for multiplayer games, allowing an application to associate input devices with a particular players.


## Properties

#### [object.androidDeviceId][api.type.InputDevice.androidDeviceId]

#### [object.canVibrate][api.type.InputDevice.canVibrate]

#### [object.connectionState][api.type.InputDevice.connectionState]

#### [object.descriptor][api.type.InputDevice.descriptor]

#### [object.displayName][api.type.InputDevice.displayName]

#### [object.driver][api.type.InputDevice.driver]

#### [object.isConnected][api.type.InputDevice.isConnected]

#### [object.permanentId][api.type.InputDevice.permanentId]

#### [object.playerNumber][api.type.InputDevice.playerNumber]

#### [object.productName][api.type.InputDevice.productName]

#### [object.type][api.type.InputDevice.type]

#### [object.MFiProfile][api.type.InputDevice.MFiProfile]

#### [object.reportsAbsoluteDpadValues][api.type.InputDevice.reportsAbsoluteDpadValues]

#### [object.allowsRotation][api.type.InputDevice.allowsRotation]


## Methods

#### [object:getAxes()][api.type.InputDevice.getAxes]

#### [object:vibrate()][api.type.InputDevice.vibrate]
