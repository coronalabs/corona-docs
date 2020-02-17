# CoronaDelegate

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Obj-C Protocol](https://developer.apple.com/reference/objectivec/protocol)
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          iOS, CORONA_NATIVE_PRODUCT, CoronaDelegate
> __See also__          [CORONA_NATIVE_PRODUCT &mdash; iOS][native.ios] _(guide)_
>						[CoronaRuntime][native.ios.CoronaRuntime]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

`CoronaDelegate` is an Obj-C protocol that gets invoked by the Corona engine at key points in your app's execution, for example at startup.

<div class="guide-notebox">
<div class="notebox-title">Notes</div>

* You can intercept [UIApplicationDelegate](https://developer.apple.com/reference/uikit/uiapplicationdelegate) events via your implementation of the `CoronaDelegate` protocol. This protocol conforms to the `UIApplicationDelegate` protocol. Corona's internal delegate will call your protocol's method if it's implemented.

* In most cases, your class' version will be invoked __after__ Corona's corresponding version of the `UIApplicationDelegate` method. The only situation in which your version will be called __before__ is where the app is about to suspend or go to the background, for example `applicationWillResignActive` and `applicationDidEnterBackground`.

* Methods that Apple has deprecated will be ignored.

</div>


## Methods

_(Inherits methods from [UIApplicationDelegate](https://developer.apple.com/reference/uikit/uiapplicationdelegate))_

#### [willLoadMain][native.ios.CoronaDelegate.willLoadMain]

#### [didLoadMain][native.ios.CoronaDelegate.didLoadMain]
