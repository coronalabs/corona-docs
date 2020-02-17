# CoronaCards: Feature Support — Android

> --------------------- ------------------------------------------------------------------------------------------
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          CoronaCards, Android
> __See also__				[Native/Lua Communication — Android][coronacards.android.communication]
> --------------------- ------------------------------------------------------------------------------------------


## Feature Support

[CoronaCards](http://www.coronacards.com/) is designed to be added to __existing native apps__ and embedded in an existing app structure, so it does not control or own the main application stack. Because of this architecture, some Lua functionality is limited or unsupported.

### Unsupported Libraries/Services

* [ads.*][api.library.ads]
* [facebook.*][api.library.facebook]
* [gameNetwork.*][api.library.gameNetwork]
* [lfs.*][api.library.lfs]
* [licensing.*][api.library.licensing]
* [media.*][api.library.media]
* [native.*][api.library.native]
* [socket.*][api.library.socket]
* [store.*][api.library.store]
* [widget.*][api.library.widget]
* [notifications][api.event.notification] (local/push)
* [key][api.event.key]