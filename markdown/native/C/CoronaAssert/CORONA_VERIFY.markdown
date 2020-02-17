# CORONA_VERIFY()

> --------------------- ------------------------------------------------------------------------------------------
> __Revision__			[REVISION_LABEL](REVISION_URL)
> __Keywords__			iOS, CORONA_NATIVE_PRODUCT, C, CoronaAssert.h, CORONA_VERIFY
> __See also__			[CoronaAssert.h][native.C.CoronaAssert]
>						[CORONA_ASSERT()][native.C.CoronaAssert.CORONA_ASSERT]
>						[Corona C Functions][native.C]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Similar to [CORONA_ASSERT()][native.C.CoronaAssert.CORONA_ASSERT] except that when assertions are disabled (for&nbsp;example `CORONA_DEBUG` is not&nbsp;defined), the value of `cond` is evaluated and available for use in logical expressions. This is useful where you want to gracefully handle failures at runtime, but want to trap them during normal development.

``````c
void *p = ...
if ( CORONA_ASSERT( p ) )
{
	// Do something
}
``````


## Syntax

``````c
CORONA_VERIFY( cond )
``````
