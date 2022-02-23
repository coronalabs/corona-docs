# photon.*

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [library][api.type.Library]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          photon
> __Platforms__			Android, iOS, macOS, Windows
> --------------------- ------------------------------------------------------------------------------------------

## Overview

**Photon is a multiplayer-game development framework that is fast, lean and flexible.**

Photon consists of a server and client SDKs for all major platforms. The **Photon Cloud** is a fully managed service of Photon Servers. Exit Games is running them in several regions, ready to use instantly.

This **Corona Photon Plugin** provides a simple-to-use Lua API to find games, communicate with other clients through Photon Cloud or Photon Server, and a lot more.


## Syntax

	local photon = require "plugin.photon"
	local serverAddress = "ns.exitgames.com:5058" -- Photon Cloud Nameserver address
	local appId = "<app-id>" -- each application on the Photon Cloud gets an appId
	local appVersion = "1.0" -- clients with different versions will be separated (easy to update clients)
	local client = photon.loadbalancing.LoadBalancingClient.new(serverAddress, appId, appVersion)
	client:connectToRegionMaster("EU") -- connect to Nameserver, get Master server address for "EU" region and connect to it

## Modules

#### [Photon LoadBalancing](http://doc-api.photonengine.com/en/corona/current/modules/loadbalancing.LoadBalancingClient.html)
#### [Photon Chat](http://doc-api.photonengine.com/en/corona/current/modules/chat.ChatClient.html)
#### [Photon Server Peer](http://doc-api.photonengine.com/en/corona/current/modules/core.PhotonPeer.html)


## Project Settings

To use this plugin, add an entry into the `plugins` table of `build.settings`. When added, the build server will integrate the plugin during the build phase.

``````
settings =
{
	plugins =
	{
		["plugin.photon"] =
		{
			publisherId = "com.exitgames",
		},
	},
}
``````


## CORONA_NATIVE_PRODUCT

Using Corona Photon Plugin in a CORONA_NATIVE_PRODUCT project can reduce time which client spends on establishing connection to the server (with encryption enabled for authentication phase). Download plugin library for your platform and link it into app executable.

#### [Android](http://doc-api.photonengine.com/en/corona/lib/corona-plugin/2013.1125/android/libplugin.photon.so)
#### [iOS](http://doc-api.photonengine.com/en/corona/lib/corona-plugin/2013.1125/iphone/libplugin_photon.a)
#### [iOS Simulator](http://doc-api.photonengine.com/en/corona/lib/corona-plugin/2013.1125/iphone-sim/libplugin_photon.a)


## Sample Code

The [Basic Sample](http://doc-api.photonengine.com/en/corona/samples/corona-plugin/photon_corona_plugin_sample.zip) is a simple app that demonstrates creation of the room and events exchange in the room.

The [Particle Demo](http://doc-api.photonengine.com/en/corona/samples/corona-plugin/photon_corona_plugin_sample_advanced.zip) automatically joins players into a room, where it syncs the players' positions on a grid. It also uses some advanced features like properties, event caching and it splits the "world" grid into four Interest Groups.

The [Chat API Demo](http://doc-api.photonengine.com/en/corona/samples/corona-plugin/photon_corona_plugin_sample_chat.zip) is a chat client sample.

**Note:** The samples are [Photon Cloud](http://www.photonengine.com/en/Realtime) enabled - no need to setup any server! [Register (for free)](https://www.photonengine.com/Account/SignUp), check your mail to access the Photon Cloud Dashboard and copy and paste your AppID into the `AppId` field in `cloud-app-info.lua`.


## Support

* [http://www.photonengine.com](http://www.photonengine.com)
* [Email](mailto:developer@photonengine.com)
