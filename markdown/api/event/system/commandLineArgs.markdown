
# event.commandLineArgs

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Array][api.type.Array]
> __Event__             [system][api.event.system]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          system, commandLineArgs
> __See also__			[event.commandLineDir][api.event.system.commandLineDir]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

An array of [strings][api.type.String] representing command line arguments that were given to subsequent launches of a <nobr>single-instance-only</nobr> Win32 desktop app that is already running. This property only exists when [event.type][api.event.system.type] is `"applicationOpen"`.

If a Win32 desktop app is set up to be <nobr>single-instance-only</nobr> in its `build.settings` file \([reference][REFLINK 1]\), subsequent launches of the app will bring the first instance's window to the front of the desktop instead. If any command line arguments were provided to the second instance, its arguments are delivered to the first instance via an `"applicationOpen"` typed [system][api.event.system] event via this property.

<div class="guide-notebox">
<div class="notebox-title">Note</div>

This property is only supported by Win32 desktop apps. It will be an empty array on all other platforms when [event.type][api.event.system.type] is set to `"applicationOpen"`.

</div>

## Gotchas

An `"applicationOpen"` typed [system][api.event.system] event will __not__ be dispatched:

* If the Win32 desktop app's `singleInstance` build setting is set to `false` \([reference][REFLINK 1]\).
* If attempting to launch a second Win32 desktop app instance without any command line arguments. In this case, the window is simply brought to the front of the desktop.
* For the first launch of the Win32 desktop app. Command line arguments will be provided to the `main.lua` file's `...` launch arguments via an `args` property.

<!--- REFERENCE LINK -->

[REFLINK 1]: ../../../guide/distribution/win32Build/index.html#singleinstance
