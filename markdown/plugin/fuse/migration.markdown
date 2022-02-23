# AdRally to Fuse Migration Guide


## Overview

If you previously used the AdRally&trade; plugin, this guide will help you migrate to the new [Fuse][plugin.fuse] plugin.


## Project Settings

Please refer to the __Project&nbsp;Settings__ section in the [Fuse][plugin.fuse] documentation.


## Function Changes

The [Fuse][plugin.fuse] plugin completely replaces the AdRally&trade; plugin. In addition to the namespace change, there are some minor changes to several functions:

* [fuse.init()][plugin.fuse.init] &mdash; The `providerName` argument has been removed. Also, if you build with Corona&nbsp;SDK, you only need to supply the listener function. The API&nbsp;key from the Fuse dashboard does not need to be specified, as the server will assign an API&nbsp;key based on your app's bundle/package ID.

* [fuse.checkLoaded()][plugin.fuse.checkLoaded] &mdash; The `adType` argument has been removed. If provided, a warning message will appear in the console.

* [fuse.load()][plugin.fuse.load] &mdash; The `adType` argument has been removed. If provided, a warning message will appear in the console.

* [fuse.show()][plugin.fuse.show] &mdash; The `adType` argument has been removed. If provided, a warning message will appear in the console.


## New Functions/Properties

#### [fuse.checkContent()][plugin.fuse.checkContent]

#### [fuse.getProperty()][plugin.fuse.getProperty]

#### [event.payload][plugin.fuse.event.adsRequest.payload]