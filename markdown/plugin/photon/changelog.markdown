# Changelog
##### 2018-09-07  Bektur Mambetov
 * Trying to figure out why it is not updating

##### 2018-08-30  valobanov
 * CHANGED: updated to Photon SDK 4.1.0.0

##### 2017-06-19  Brent Sorrentino
 * index.markdown edited online with Bitbucket

##### 2016-10-05  Vadim Lobanov
 * REMOVED: empty folders to enable kindle and nook support
CHANGED: unused lines deleted in plugin index page

##### 2016-01-30  Brent Sorrentino
 * index.markdown edited online with Bitbucket

##### 2015-09-29  Vadim Lobanov
 * =CHANGED: links to photonengine.com resources updated again (libs and samples missed in previous commit)

##### 2015-09-28  Vadim Lobanov
 * CHANGED: links to photonengine.com resources updated again

##### 2015-08-21  Vadim Lobanov
 * CHANGED: links to photonengine.com resources updated

##### 2015-03-04  Brent Sorrentino
 * index.markdown edited online with Bitbucket

##### 2014-11-27  Vadim Lobanov
 * CHANGED: ios plugins updated from 32-bit to 32/64-bit-universal

##### 2014-06-30  Vadim Lobanov
 * FIXED: chat exports added to plugin loader

##### 2014-06-26  Vadim Lobanov
 * *** Version 4-0-0-0 (26.06.2014 - rev285)
ADDED: Chat API

##### 2014-05-28  Vadim Lobanov
 * CHANGED: libs and samples links updated in plugin documentation

##### 2014-04-07  dersec
 * CHANGED: Photon Corona SDK links

##### 2014-01-21  sean head
 * merge

##### 2014-01-21  sean head
 * updated enterprise package script to skip over cases with screwed up iphone files that can't be lipoed together

##### 2013-12-23  Vadim Lobanov
 * ADDED: info on plugin usage in Enterprise projects and links to plugin libs

##### 2013-12-17  Vadim Lobanov
 * CHANGED: doc hosting moved

##### 2013-11-06  Vadim Lobanov
 * FIXED: missed Null.lua module

##### 2013-11-06  Vadim Lobanov
 * *** Version 3-2-1-5 (06.11.2013 - rev226)
FIXED: Actor:setCustomProperty() did not send SetProperties operation properly
CHANGED: Actor/Room:setCustomProperty() value deep copied before set to protect it from modification
CHANGED: PeerBase:sendOperation() calls onOperationResponse() with error on failed opCustom() call (in case of not supported type)
CHANGED: LoadBalancingClient disconnect() / leaveRoom(): state switched to Disconnected/JoinedLobby (and connect() optionally called) instantly; Disconnecting state removed.
ADDED: GpOperationWriter:serializeObjectArray(): Array elements support

##### 2013-10-29  Bryan Smith
 * Documentation cleanup

##### 2013-10-22  Vadim Lobanov
 * *** Version 3-2-1-4 (22.10.2013 - rev216)
ADDED: 'lobby stats' feature: LoadbalancingClient:connect() 'lobbyStats' option, LoadbalancingClient:requestLobbyStats(), LoadbalancingClient:onLobbyStats() methods
ADDED LoadbalancingClient AppStats handling: LoadbalancingClient:onAppStats() method
ADDED: 'typed lobbies' feature lobbyName/lobbyType/sqlLobbyFilter support in connect/create/join LoadbalancingClient methods
ADDED: LoadbalancingClient:joinRoom() 'createIfNotExists' option
CHANGED: LoadBalancingClient:connect() 'keepMasterConnection' parameter moved to single 'options' table parameter (old syntax deprecated)
BREAKING: LoadBalancingClient:joinRandomRoom() parameters moved to single 'options' table parameter
ADDED: LoadBalancingClient:findFriends() / LoadBalancingClient:onFindFriendsResult()
ADDED: 'rejoin' feature: LoadBalancingClient:joinRoom() 'joinToken' option / Actor:getJoinToken() (last autosaved join token)
ADDED: CustomAuthenticationType Steam and Facebook constants
ADDED: PhotonPeer:getResentReliableCommands()
ADDED: EnetPeer: 'Client Timeout' flag in disconnect()
FIXED: NetSim: delay excess division by 1000

##### 2013-09-26  Vadim Lobanov
 * FIXED: LoadBalancingClient:createRoom failed without 'options' parameter

##### 2013-09-25  Vadim Lobanov
 * CHANGED: Corona plugin: encryption key generation moved to native code for performance
BREAKING: LoadBalancingClient:createRoom optional parameters moved to single table parameter 'option'
BREAKING: LoadBalancingClient.new(): 'initRoom' and 'initActor' parameters moved to 'options' table parameter
CHANGED: LoadBalancingClient.new() with single table parameter is deprecated
ADDED: LoadBalancingClient.new(): 'encryptedAuthentication' parameter - set to false to skip connection encryption phase
ADDED: Room:setEmptyRoomLiveTime - sets 'empty room live time' option for CreateRoom operation
ADDED: parameter 'byClient' to Actor.onPropertiesChange and RoomInfo.onPropertiesChange - true if props updated by local client
ADDED: PeerBase:seviceBasic() - support for accurate rtt measurement with slow main loop
ADDED: targetActors, sendReliable and channelId options to RaiseEvent operation
CHANGED: LoadBalancing game EventCode.Join event updates local actor custom props as well as actorId
ADDED: room properties updated on CreateGame response (in case server sets it's own properties)

##### 2013-08-02  Danny Chan
 * Update photon docs

##### 2013-07-26  Danny Chan
 * Add empty directorys for photon android-nook and android-kindle because they don't support those platforms yet

##### 2013-07-17  Vadim Lobanov
 * Cleanup

##### 2013-07-17  Vadim Lobanov
 * Added icons for devices
Removed os.exit(), 'quit' button is only in Android version

##### 2013-07-12  Vadim Lobanov
 * Sample: native.requestExit() instead of os.exit() for Android platform
Updated links to docs and samples

##### 2013-06-26  Vadim Lobanov
 * Added links to photon online documentation
Added sample usage info

##### 2013-06-25  admin+corona
 * Switched sample scale mode to letterbox

##### 2013-06-25  admin+corona
 * Plugin sample switched to demo-helloworld-cloud

##### 2013-06-25  admin+corona
 * Added android.permission.INTERNET permission for sample

##### 2013-06-21  Danny Chan
 * The photon docs are in the wrong directory

##### 2013-05-24  admin+corona
 * Inital checkin

