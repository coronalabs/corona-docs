# didLoadMain

> --------------------- ------------------------------------------------------------------------------------------
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          iOS, CORONA_NATIVE_PRODUCT, CoronaDelegate, didLoadMain
> __See also__          [CoronaDelegate][native.ios.CoronaDelegate]
>						[willLoadMain][native.ios.CoronaDelegate.willLoadMain]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Called directly after `main.lua` is executed.

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
- (void)didLoadMain:id<Runtime>runtime
``````
