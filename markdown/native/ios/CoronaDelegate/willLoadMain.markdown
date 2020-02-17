# willLoadMain

> --------------------- ------------------------------------------------------------------------------------------
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          iOS, CORONA_NATIVE_PRODUCT, CoronaDelegate, willLoadMain
> __See also__          [CoronaDelegate][native.ios.CoronaDelegate]
>						[didLoadMain][native.ios.CoronaDelegate.didLoadMain]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Called directly before `main.lua` is executed. You should register your Lua extensions here.

In the syntax below, `runtime` is an object that conforms to the [CoronaRuntime][native.ios.CoronaRuntime] protocol.

<div class="docs-tip-outer">
<div class="docs-tip-inner-left">
<div class="fa fa-cog"></div>
</div>
<div class="docs-tip-inner-right">

This method is specific to the Corona delegate protocol. A template can be found in `AppCoronaDelegate.mm` within <nobr>`Project Template` &rarr; `App` &rarr; `ios`</nobr>.

</div>
</div>


## Syntax

``````c
- (void)willLoadMain:id<Runtime>runtime
``````
