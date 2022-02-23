# gpn.startRequestingInterstitials()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [function][api.type.Function]
> __Library__           [gpn.*][plugin.gpn]
> __Return value__      [Boolean][api.type.Boolean]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          
> __Sample code__       
> __See also__          
> --------------------- ------------------------------------------------------------------------------------------


## Overview
Starts requesting interstitial ads from the server.  
  
*Note:* you should call startRequestingInterstitials() only once. The interstitial rotation is handled automatically by the SDK. Each time a new interstitial is received the "received" event is dispatched to your listener function. You only need to call startRequestingInterstitials() if the SDK received a memory warning (and freed the memory occupied by interstitial) or if an error occurred and "failed" event was dispatched.


## Syntax

	gpn.startRequestingInterstitials( )


## Examples

``````lua

    -- start requesting interstitial after you've initialized gpn instance
    gpn.startRequestingInterstitials()
        
``````