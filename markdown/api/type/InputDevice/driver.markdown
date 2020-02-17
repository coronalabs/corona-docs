# object.driver

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Object__            [InputDevice][api.type.InputDevice]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          device, input, MFi, HID, driver
> __See also__			[object.MFiProfile][api.type.InputDevice.MFiProfile]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

A string which specifies the <nobr>platform-dependent</nobr> backend of the device (if&nbsp;any):

### macOS

* `"HID"` &mdash; generic HID controller.
* `"MFi"` &mdash; MFi controller.

### iOS / tvOS

* `"MFi"` &mdash; MFi controller.
