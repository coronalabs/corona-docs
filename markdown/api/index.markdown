<!-- ################################################## -->
<!-- GENERATED FILE - DO NOT EDIT - EDITS WILL BE LOST! -->
<!-- ################################################## -->

# API Reference

<div class="guide-notebox">
<div class="notebox-title">Notes</div>

* This is the complete list of Lua APIs for CORONA_CORE_PRODUCT. If you're looking to extend CORONA_CORE_PRODUCT beyond the functionality provided by these Lua&nbsp;APIs, please see the [CORONA_NATIVE_PRODUCT documentation][native].

* If you're new, download CORONA_CORE_PRODUCT and proceed to the [Getting Started][guide.programming] series. There are also numerous [guides][guide] on specific topics.

* To download this documentation for offline viewing, please click [here][linkAPIZip].

</div>

[linkAPIZip]: https://github.com/coronalabs/corona-docs/archive/gh-pages.zip
[linkDailyBuild]: http://developer.coronalabs.com/downloads/daily-builds

## [Libraries][api.library]


#### [ads.*][api.library.ads]


#### [audio.*][api.library.audio]

<p class="index">[audio.dispose()][api.library.audio.dispose]</p>

<p class="index">[audio.fade()][api.library.audio.fade]</p>

<p class="index">[audio.fadeOut()][api.library.audio.fadeOut]</p>

<p class="index">[audio.findFreeChannel()][api.library.audio.findFreeChannel]</p>

<p class="index">[audio.freeChannels][api.library.audio.freeChannels]</p>

<p class="index">[audio.getDuration()][api.library.audio.getDuration]</p>

<p class="index">[audio.getMaxVolume()][api.library.audio.getMaxVolume]</p>

<p class="index">[audio.getMinVolume()][api.library.audio.getMinVolume]</p>

<p class="index">[audio.getVolume()][api.library.audio.getVolume]</p>

<p class="index">[audio.isChannelActive()][api.library.audio.isChannelActive]</p>

<p class="index">[audio.isChannelPaused()][api.library.audio.isChannelPaused]</p>

<p class="index">[audio.isChannelPlaying()][api.library.audio.isChannelPlaying]</p>

<p class="index">[audio.loadSound()][api.library.audio.loadSound]</p>

<p class="index">[audio.loadStream()][api.library.audio.loadStream]</p>

<p class="index">[audio.pause()][api.library.audio.pause]</p>

<p class="index">[audio.play()][api.library.audio.play]</p>

<p class="index">[audio.reserveChannels()][api.library.audio.reserveChannels]</p>

<p class="index">[audio.reservedChannels][api.library.audio.reservedChannels]</p>

<p class="index">[audio.resume()][api.library.audio.resume]</p>

<p class="index">[audio.rewind()][api.library.audio.rewind]</p>

<p class="index">[audio.seek()][api.library.audio.seek]</p>

<p class="index">[audio.setMaxVolume()][api.library.audio.setMaxVolume]</p>

<p class="index">[audio.setMinVolume()][api.library.audio.setMinVolume]</p>

<p class="index">[audio.setVolume()][api.library.audio.setVolume]</p>

<p class="index">[audio.stop()][api.library.audio.stop]</p>

<p class="index">[audio.stopWithDelay()][api.library.audio.stopWithDelay]</p>

<p class="index">[audio.totalChannels][api.library.audio.totalChannels]</p>

<p class="index">[audio.unreservedFreeChannels][api.library.audio.unreservedFreeChannels]</p>

<p class="index">[audio.unreservedUsedChannels][api.library.audio.unreservedUsedChannels]</p>

<p class="index">[audio.usedChannels][api.library.audio.usedChannels]</p>


#### [composer.*][api.library.composer]

<p class="index">[composer.getScene()][api.library.composer.getScene]</p>

<p class="index">[composer.getSceneName()][api.library.composer.getSceneName]</p>

<p class="index">[composer.getVariable()][api.library.composer.getVariable]</p>

<p class="index">[composer.gotoScene()][api.library.composer.gotoScene]</p>

<p class="index">[composer.hideOverlay()][api.library.composer.hideOverlay]</p>

<p class="index">[composer.isDebug][api.library.composer.isDebug]</p>

<p class="index">[composer.loadScene()][api.library.composer.loadScene]</p>

<p class="index">[composer.newScene()][api.library.composer.newScene]</p>

<p class="index">[composer.recycleAutomatically][api.library.composer.recycleAutomatically]</p>

<p class="index">[composer.recycleOnLowMemory][api.library.composer.recycleOnLowMemory]</p>

<p class="index">[composer.recycleOnSceneChange][api.library.composer.recycleOnSceneChange]</p>

<p class="index">[composer.removeHidden()][api.library.composer.removeHidden]</p>

<p class="index">[composer.removeScene()][api.library.composer.removeScene]</p>

<p class="index">[composer.setVariable()][api.library.composer.setVariable]</p>

<p class="index">[composer.showOverlay()][api.library.composer.showOverlay]</p>

<p class="index">[composer.stage][api.library.composer.stage]</p>


#### [crypto.*][api.library.crypto]

<p class="index">[crypto.digest()][api.library.crypto.digest]</p>

<p class="index">[crypto.hmac()][api.library.crypto.hmac]</p>

<p class="index">[crypto.md4][api.library.crypto.md4]</p>

<p class="index">[crypto.md5][api.library.crypto.md5]</p>

<p class="index">[crypto.sha1][api.library.crypto.sha1]</p>

<p class="index">[crypto.sha224][api.library.crypto.sha224]</p>

<p class="index">[crypto.sha256][api.library.crypto.sha256]</p>

<p class="index">[crypto.sha384][api.library.crypto.sha384]</p>

<p class="index">[crypto.sha512][api.library.crypto.sha512]</p>


#### [display.*][api.library.display]

<p class="index">[display.actualContentHeight][api.library.display.actualContentHeight]</p>

<p class="index">[display.actualContentWidth][api.library.display.actualContentWidth]</p>

<p class="index">[display.capture()][api.library.display.capture]</p>

<p class="index">[display.captureBounds()][api.library.display.captureBounds]</p>

<p class="index">[display.captureScreen()][api.library.display.captureScreen]</p>

<p class="index">[display.colorSample()][api.library.display.colorSample]</p>

<p class="index">[display.contentCenterX][api.library.display.contentCenterX]</p>

<p class="index">[display.contentCenterY][api.library.display.contentCenterY]</p>

<p class="index">[display.contentHeight][api.library.display.contentHeight]</p>

<p class="index">[display.contentScaleX][api.library.display.contentScaleX]</p>

<p class="index">[display.contentScaleY][api.library.display.contentScaleY]</p>

<p class="index">[display.contentWidth][api.library.display.contentWidth]</p>

<p class="index">[display.currentStage][api.library.display.currentStage]</p>

<p class="index">[display.fps][api.library.display.fps]</p>

<p class="index">[display.getCurrentStage()][api.library.display.getCurrentStage]</p>

<p class="index">[display.getDefault()][api.library.display.getDefault]</p>

<p class="index">[display.getSafeAreaInsets()][api.library.display.getSafeAreaInsets]</p>

<p class="index">[display.imageSuffix][api.library.display.imageSuffix]</p>

<p class="index">[display.loadRemoteImage()][api.library.display.loadRemoteImage]</p>

<p class="index">[display.newCircle()][api.library.display.newCircle]</p>

<p class="index">[display.newContainer()][api.library.display.newContainer]</p>

<p class="index">[display.newEmbossedText()][api.library.display.newEmbossedText]</p>

<p class="index">[display.newEmitter()][api.library.display.newEmitter]</p>

<p class="index">[display.newGroup()][api.library.display.newGroup]</p>

<p class="index">[display.newImage()][api.library.display.newImage]</p>

<p class="index">[display.newImageRect()][api.library.display.newImageRect]</p>

<p class="index">[display.newLine()][api.library.display.newLine]</p>

<p class="index">[display.newMesh()][api.library.display.newMesh]</p>

<p class="index">[display.newPolygon()][api.library.display.newPolygon]</p>

<p class="index">[display.newRect()][api.library.display.newRect]</p>

<p class="index">[display.newRoundedRect()][api.library.display.newRoundedRect]</p>

<p class="index">[display.newSnapshot()][api.library.display.newSnapshot]</p>

<p class="index">[display.newSprite()][api.library.display.newSprite]</p>

<p class="index">[display.newText()][api.library.display.newText]</p>

<p class="index">[display.pixelHeight][api.library.display.pixelHeight]</p>

<p class="index">[display.pixelWidth][api.library.display.pixelWidth]</p>

<p class="index">[display.remove()][api.library.display.remove]</p>

<p class="index">[display.safeActualContentHeight][api.library.display.safeActualContentHeight]</p>

<p class="index">[display.safeActualContentWidth][api.library.display.safeActualContentWidth]</p>

<p class="index">[display.safeScreenOriginX][api.library.display.safeScreenOriginX]</p>

<p class="index">[display.safeScreenOriginY][api.library.display.safeScreenOriginY]</p>

<p class="index">[display.save()][api.library.display.save]</p>

<p class="index">[display.screenOriginX][api.library.display.screenOriginX]</p>

<p class="index">[display.screenOriginY][api.library.display.screenOriginY]</p>

<p class="index">[display.setDefault()][api.library.display.setDefault]</p>

<p class="index">[display.setDrawMode()][api.library.display.setDrawMode]</p>

<p class="index">[display.setStatusBar()][api.library.display.setStatusBar]</p>

<p class="index">[display.statusBarHeight][api.library.display.statusBarHeight]</p>

<p class="index">[display.topStatusBarContentHeight][api.library.display.topStatusBarContentHeight]</p>

<p class="index">[display.viewableContentHeight][api.library.display.viewableContentHeight]</p>

<p class="index">[display.viewableContentWidth][api.library.display.viewableContentWidth]</p>


#### [easing.*][api.library.easing]


#### [facebook.*][api.library.facebook]


#### [gameNetwork.*][api.library.gameNetwork]


#### [(globals)][api.library.global]

<p class="index">[assert()][api.library.global.assert]</p>

<p class="index">[collectgarbage()][api.library.global.collectgarbage]</p>

<p class="index">[error()][api.library.global.error]</p>

<p class="index">[getfenv()][api.library.global.getfenv]</p>

<p class="index">[getmetatable()][api.library.global.getmetatable]</p>

<p class="index">[ipairs()][api.library.global.ipairs]</p>

<p class="index">[next()][api.library.global.next]</p>

<p class="index">[pairs()][api.library.global.pairs]</p>

<p class="index">[pcall()][api.library.global.pcall]</p>

<p class="index">[print()][api.library.global.print]</p>

<p class="index">[rawequal()][api.library.global.rawequal]</p>

<p class="index">[rawget()][api.library.global.rawget]</p>

<p class="index">[rawset()][api.library.global.rawset]</p>

<p class="index">[select()][api.library.global.select]</p>

<p class="index">[setfenv()][api.library.global.setfenv]</p>

<p class="index">[setmetatable()][api.library.global.setmetatable]</p>

<p class="index">[tonumber()][api.library.global.tonumber]</p>

<p class="index">[tostring()][api.library.global.tostring]</p>

<p class="index">[type()][api.library.global.type]</p>

<p class="index">[unpack()][api.library.global.unpack]</p>


#### [graphics.*][api.library.graphics]

<p class="index">[graphics.defineEffect()][api.library.graphics.defineEffect]</p>

<p class="index">[graphics.getFontMetrics()][api.library.graphics.getFontMetrics]</p>

<p class="index">[graphics.newImageSheet()][api.library.graphics.newImageSheet]</p>

<p class="index">[graphics.newMask()][api.library.graphics.newMask]</p>

<p class="index">[graphics.newOutline()][api.library.graphics.newOutline]</p>

<p class="index">[graphics.newTexture()][api.library.graphics.newTexture]</p>

<p class="index">[graphics.releaseTextures()][api.library.graphics.releaseTextures]</p>


#### [io.*][api.library.io]

<p class="index">[io.close()][api.library.io.close]</p>

<p class="index">[io.flush()][api.library.io.flush]</p>

<p class="index">[io.input()][api.library.io.input]</p>

<p class="index">[io.lines()][api.library.io.lines]</p>

<p class="index">[io.open()][api.library.io.open]</p>

<p class="index">[io.output()][api.library.io.output]</p>

<p class="index">[io.read()][api.library.io.read]</p>

<p class="index">[io.tmpfile()][api.library.io.tmpfile]</p>

<p class="index">[io.type()][api.library.io.type]</p>

<p class="index">[io.write()][api.library.io.write]</p>


#### [json.*][api.library.json]

<p class="index">[json.decode()][api.library.json.decode]</p>

<p class="index">[json.decodeFile()][api.library.json.decodeFile]</p>

<p class="index">[json.encode()][api.library.json.encode]</p>

<p class="index">[json.prettify()][api.library.json.prettify]</p>


#### [lfs.* (file system) ][api.library.lfs]


#### [licensing.*][api.library.licensing]

<p class="index">[licensing.init()][api.library.licensing.init]</p>

<p class="index">[licensing.verify()][api.library.licensing.verify]</p>


#### [math.*][api.library.math]

<p class="index">[math.abs()][api.library.math.abs]</p>

<p class="index">[math.acos()][api.library.math.acos]</p>

<p class="index">[math.asin()][api.library.math.asin]</p>

<p class="index">[math.atan()][api.library.math.atan]</p>

<p class="index">[math.atan2()][api.library.math.atan2]</p>

<p class="index">[math.ceil()][api.library.math.ceil]</p>

<p class="index">[math.cos()][api.library.math.cos]</p>

<p class="index">[math.cosh()][api.library.math.cosh]</p>

<p class="index">[math.deg()][api.library.math.deg]</p>

<p class="index">[math.exp()][api.library.math.exp]</p>

<p class="index">[math.floor()][api.library.math.floor]</p>

<p class="index">[math.fmod()][api.library.math.fmod]</p>

<p class="index">[math.frexp()][api.library.math.frexp]</p>

<p class="index">[math.huge][api.library.math.huge]</p>

<p class="index">[math.inf][api.library.math.inf]</p>

<p class="index">[math.ldexp()][api.library.math.ldexp]</p>

<p class="index">[math.log()][api.library.math.log]</p>

<p class="index">[math.log10()][api.library.math.log10]</p>

<p class="index">[math.max()][api.library.math.max]</p>

<p class="index">[math.min()][api.library.math.min]</p>

<p class="index">[math.modf()][api.library.math.modf]</p>

<p class="index">[math.pi][api.library.math.pi]</p>

<p class="index">[math.pow()][api.library.math.pow]</p>

<p class="index">[math.rad()][api.library.math.rad]</p>

<p class="index">[math.random()][api.library.math.random]</p>

<p class="index">[math.randomseed()][api.library.math.randomseed]</p>

<p class="index">[math.round()][api.library.math.round]</p>

<p class="index">[math.sin()][api.library.math.sin]</p>

<p class="index">[math.sinh()][api.library.math.sinh]</p>

<p class="index">[math.sqrt()][api.library.math.sqrt]</p>

<p class="index">[math.tan()][api.library.math.tan]</p>

<p class="index">[math.tanh()][api.library.math.tanh]</p>


#### [media.*][api.library.media]

<p class="index">[media.RemoteSource][api.library.media.RemoteSource]</p>

<p class="index">[media.capturePhoto()][api.library.media.capturePhoto]</p>

<p class="index">[media.captureVideo()][api.library.media.captureVideo]</p>

<p class="index">[media.getSoundVolume()][api.library.media.getSoundVolume]</p>

<p class="index">[media.hasSource()][api.library.media.hasSource]</p>

<p class="index">[media.newEventSound()][api.library.media.newEventSound]</p>

<p class="index">[media.newRecording()][api.library.media.newRecording]</p>

<p class="index">[media.pauseSound()][api.library.media.pauseSound]</p>

<p class="index">[media.playEventSound()][api.library.media.playEventSound]</p>

<p class="index">[media.playSound()][api.library.media.playSound]</p>

<p class="index">[media.playVideo()][api.library.media.playVideo]</p>

<p class="index">[media.save()][api.library.media.save]</p>

<p class="index">[media.selectPhoto()][api.library.media.selectPhoto]</p>

<p class="index">[media.selectVideo()][api.library.media.selectVideo]</p>

<p class="index">[media.setSoundVolume()][api.library.media.setSoundVolume]</p>

<p class="index">[media.show()][api.library.media.show]</p>

<p class="index">[media.stopSound()][api.library.media.stopSound]</p>


#### [native.*][api.library.native]

<p class="index">[native.canShowPopup()][api.library.native.canShowPopup]</p>

<p class="index">[native.cancelAlert()][api.library.native.cancelAlert]</p>

<p class="index">[native.cancelWebPopup()][api.library.native.cancelWebPopup]</p>

<p class="index">[native.getFontNames()][api.library.native.getFontNames]</p>

<p class="index">[native.getProperty()][api.library.native.getProperty]</p>

<p class="index">[native.getSync()][api.library.native.getSync]</p>

<p class="index">[native.newFont()][api.library.native.newFont]</p>

<p class="index">[native.newMapView()][api.library.native.newMapView]</p>

<p class="index">[native.newTextBox()][api.library.native.newTextBox]</p>

<p class="index">[native.newTextField()][api.library.native.newTextField]</p>

<p class="index">[native.newVideo()][api.library.native.newVideo]</p>

<p class="index">[native.newWebView()][api.library.native.newWebView]</p>

<p class="index">[native.requestExit()][api.library.native.requestExit]</p>

<p class="index">[native.setActivityIndicator()][api.library.native.setActivityIndicator]</p>

<p class="index">[native.setKeyboardFocus()][api.library.native.setKeyboardFocus]</p>

<p class="index">[native.setProperty()][api.library.native.setProperty]</p>

<p class="index">[native.setSync()][api.library.native.setSync]</p>

<p class="index">[native.showAlert()][api.library.native.showAlert]</p>

<p class="index">[native.showPopup()][api.library.native.showPopup]</p>

<p class="index">[native.showWebPopup()][api.library.native.showWebPopup]</p>

<p class="index">[native.systemFont][api.library.native.systemFont]</p>

<p class="index">[native.systemFontBold][api.library.native.systemFontBold]</p>


#### [network.*][api.library.network]

<p class="index">[network.canDetectNetworkStatusChanges][api.library.network.canDetectNetworkStatusChanges]</p>

<p class="index">[network.cancel()][api.library.network.cancel]</p>

<p class="index">[network.download()][api.library.network.download]</p>

<p class="index">[network.request()][api.library.network.request]</p>

<p class="index">[network.setStatusListener()][api.library.network.setStatusListener]</p>

<p class="index">[network.upload()][api.library.network.upload]</p>


#### [os.*][api.library.os]

<p class="index">[os.clock()][api.library.os.clock]</p>

<p class="index">[os.date()][api.library.os.date]</p>

<p class="index">[os.difftime()][api.library.os.difftime]</p>

<p class="index">[os.execute()][api.library.os.execute]</p>

<p class="index">[os.exit()][api.library.os.exit]</p>

<p class="index">[os.remove()][api.library.os.remove]</p>

<p class="index">[os.rename()][api.library.os.rename]</p>

<p class="index">[os.time()][api.library.os.time]</p>


#### [package.*][api.library.package]

<p class="index">[package.loaded][api.library.package.loaded]</p>

<p class="index">[package.loaders][api.library.package.loaders]</p>

<p class="index">[requir<span style="display: none;">X</span>e()][api.library.package.require]</p>


#### [physics.*][api.library.physics]

<p class="index">[physics.addBody()][api.library.physics.addBody]</p>

<p class="index">[physics.engineVersion][api.library.physics.engineVersion]</p>

<p class="index">[physics.fromMKS()][api.library.physics.fromMKS]</p>

<p class="index">[physics.getAverageCollisionPositions()][api.library.physics.getAverageCollisionPositions]</p>

<p class="index">[physics.getDebugErrorsEnabled()][api.library.physics.getDebugErrorsEnabled]</p>

<p class="index">[physics.getGravity()][api.library.physics.getGravity]</p>

<p class="index">[physics.getMKS()][api.library.physics.getMKS]</p>

<p class="index">[physics.getReportCollisionsInContentCoordinates()][api.library.physics.getReportCollisionsInContentCoordinates]</p>

<p class="index">[physics.getTimeScale()][api.library.physics.getTimeScale]</p>

<p class="index">[physics.newJoint()][api.library.physics.newJoint]</p>

<p class="index">[physics.newParticleSystem()][api.library.physics.newParticleSystem]</p>

<p class="index">[physics.pause()][api.library.physics.pause]</p>

<p class="index">[physics.queryRegion()][api.library.physics.queryRegion]</p>

<p class="index">[physics.rayCast()][api.library.physics.rayCast]</p>

<p class="index">[physics.reflectRay()][api.library.physics.reflectRay]</p>

<p class="index">[physics.removeBody()][api.library.physics.removeBody]</p>

<p class="index">[physics.setAverageCollisionPositions()][api.library.physics.setAverageCollisionPositions]</p>

<p class="index">[physics.setContinuous()][api.library.physics.setContinuous]</p>

<p class="index">[physics.setDebugErrorsEnabled()][api.library.physics.setDebugErrorsEnabled]</p>

<p class="index">[physics.setDrawMode()][api.library.physics.setDrawMode]</p>

<p class="index">[physics.setGravity()][api.library.physics.setGravity]</p>

<p class="index">[physics.setMKS()][api.library.physics.setMKS]</p>

<p class="index">[physics.setPositionIterations()][api.library.physics.setPositionIterations]</p>

<p class="index">[physics.setReportCollisionsInContentCoordinates()][api.library.physics.setReportCollisionsInContentCoordinates]</p>

<p class="index">[physics.setScale()][api.library.physics.setScale]</p>

<p class="index">[physics.setTimeScale()][api.library.physics.setTimeScale]</p>

<p class="index">[physics.setTimeStep()][api.library.physics.setTimeStep]</p>

<p class="index">[physics.setVelocityIterations()][api.library.physics.setVelocityIterations]</p>

<p class="index">[physics.start()][api.library.physics.start]</p>

<p class="index">[physics.stop()][api.library.physics.stop]</p>

<p class="index">[physics.toMKS()][api.library.physics.toMKS]</p>


#### [socket.*][api.library.socket]


#### [sqlite3.* (database)][api.library.sqlite3]


#### [store.* (Apple IAP)][api.library.store]

<p class="index">[store.canLoadProducts][api.library.store.canLoadProducts]</p>

<p class="index">[store.canMakePurchases][api.library.store.canMakePurchases]</p>

<p class="index">[productList][api.library.store.event.productList]</p>

<p class="index">[event.invalidProducts][api.library.store.event.productList.invalidProducts]</p>

<p class="index">[event.name][api.library.store.event.productList.name]</p>

<p class="index">[event.products][api.library.store.event.productList.products]</p>

<p class="index">[storeTransaction][api.library.store.event.storeTransaction]</p>

<p class="index">[event.name][api.library.store.event.storeTransaction.name]</p>

<p class="index">[event.transaction][api.library.store.event.storeTransaction.transaction]</p>

<p class="index">[store.finishTransaction()][api.library.store.finishTransaction]</p>

<p class="index">[store.init()][api.library.store.init]</p>

<p class="index">[store.isActive][api.library.store.isActive]</p>

<p class="index">[store.loadProducts()][api.library.store.loadProducts]</p>

<p class="index">[store.purchase()][api.library.store.purchase]</p>

<p class="index">[store.restore()][api.library.store.restore]</p>

<p class="index">[store.target][api.library.store.target]</p>


#### [string.*][api.library.string]

<p class="index">[string.byte()][api.library.string.byte]</p>

<p class="index">[string.char()][api.library.string.char]</p>

<p class="index">[string.ends()][api.library.string.ends]</p>

<p class="index">[string.find()][api.library.string.find]</p>

<p class="index">[string.format()][api.library.string.format]</p>

<p class="index">[string.gmatch()][api.library.string.gmatch]</p>

<p class="index">[string.gsub()][api.library.string.gsub]</p>

<p class="index">[string.len()][api.library.string.len]</p>

<p class="index">[string.lower()][api.library.string.lower]</p>

<p class="index">[string.match()][api.library.string.match]</p>

<p class="index">[string.rep()][api.library.string.rep]</p>

<p class="index">[string.reverse()][api.library.string.reverse]</p>

<p class="index">[string.starts()][api.library.string.starts]</p>

<p class="index">[string.sub()][api.library.string.sub]</p>

<p class="index">[string.upper()][api.library.string.upper]</p>


#### [system.*][api.library.system]

<p class="index">[system.ApplicationSupportDirectory][api.library.system.ApplicationSupportDirectory]</p>

<p class="index">[system.CachesDirectory][api.library.system.CachesDirectory]</p>

<p class="index">[system.DocumentsDirectory][api.library.system.DocumentsDirectory]</p>

<p class="index">[system.ResourceDirectory][api.library.system.ResourceDirectory]</p>

<p class="index">[system.TemporaryDirectory][api.library.system.TemporaryDirectory]</p>

<p class="index">[system.activate()][api.library.system.activate]</p>

<p class="index">[system.canOpenURL()][api.library.system.canOpenURL]</p>

<p class="index">[system.cancelNotification()][api.library.system.cancelNotification]</p>

<p class="index">[system.deactivate()][api.library.system.deactivate]</p>

<p class="index">[system.deletePreferences()][api.library.system.deletePreferences]</p>

<p class="index">[system.getIdleTimer()][api.library.system.getIdleTimer]</p>

<p class="index">[system.getInfo()][api.library.system.getInfo]</p>

<p class="index">[system.getInputDevices()][api.library.system.getInputDevices]</p>

<p class="index">[system.getPreference()][api.library.system.getPreference]</p>

<p class="index">[system.getTimer()][api.library.system.getTimer]</p>

<p class="index">[system.hasEventSource()][api.library.system.hasEventSource]</p>

<p class="index">[system.newEventDispatcher()][api.library.system.newEventDispatcher]</p>

<p class="index">[system.openURL()][api.library.system.openURL]</p>

<p class="index">[system.orientation][api.library.system.orientation]</p>

<p class="index">[system.pathForFile()][api.library.system.pathForFile]</p>

<p class="index">[system.scheduleNotification()][api.library.system.scheduleNotification]</p>

<p class="index">[system.setAccelerometerInterval()][api.library.system.setAccelerometerInterval]</p>

<p class="index">[system.setGyroscopeInterval()][api.library.system.setGyroscopeInterval]</p>

<p class="index">[system.setIdleTimer()][api.library.system.setIdleTimer]</p>

<p class="index">[system.setLocationAccuracy()][api.library.system.setLocationAccuracy]</p>

<p class="index">[system.setLocationThreshold()][api.library.system.setLocationThreshold]</p>

<p class="index">[system.setPreferences()][api.library.system.setPreferences]</p>

<p class="index">[system.setTapDelay()][api.library.system.setTapDelay]</p>

<p class="index">[system.vibrate()][api.library.system.vibrate]</p>


#### [table.* (array)][api.library.table]

<p class="index">[table.concat()][api.library.table.concat]</p>

<p class="index">[table.copy()][api.library.table.copy]</p>

<p class="index">[table.indexOf()][api.library.table.indexOf]</p>

<p class="index">[table.insert()][api.library.table.insert]</p>

<p class="index">[table.maxn()][api.library.table.maxn]</p>

<p class="index">[table.remove()][api.library.table.remove]</p>

<p class="index">[table.sort()][api.library.table.sort]</p>


#### [timer.*][api.library.timer]

<p class="index">[timer.allowInterationsWithinFrame][api.library.timer.allowIterationsWithinFrame]</p>

<p class="index">[timer.cancel()][api.library.timer.cancel]</p>

<p class="index">[timer.cancelAll()][api.library.timer.cancelAll]</p>

<p class="index">[timer.pause()][api.library.timer.pause]</p>

<p class="index">[timer.pauseAll()][api.library.timer.pauseAll]</p>

<p class="index">[timer.performWithDelay()][api.library.timer.performWithDelay]</p>

<p class="index">[timer.resume()][api.library.timer.resume]</p>

<p class="index">[timer.resumeAll()][api.library.timer.resumeAll]</p>


#### [transition.*][api.library.transition]

<p class="index">[transition.blink()][api.library.transition.blink]</p>

<p class="index">[transition.cancel()][api.library.transition.cancel]</p>

<p class="index">[transition.cancelAll()][api.library.transition.cancelAll]</p>

<p class="index">[transition.dissolve()][api.library.transition.dissolve]</p>

<p class="index">[transition.fadeIn()][api.library.transition.fadeIn]</p>

<p class="index">[transition.fadeOut()][api.library.transition.fadeOut]</p>

<p class="index">[transition.from()][api.library.transition.from]</p>

<p class="index">[transition.ignoreEmptyReference][api.library.transition.ignoreEmptyReference]</p>

<p class="index">[transition.moveBy()][api.library.transition.moveBy]</p>

<p class="index">[transition.moveTo()][api.library.transition.moveTo]</p>

<p class="index">[transition.pause()][api.library.transition.pause]</p>

<p class="index">[transition.pauseAll()][api.library.transition.pauseAll]</p>

<p class="index">[transition.resume()][api.library.transition.resume]</p>

<p class="index">[transition.resumeAll()][api.library.transition.resumeAll]</p>

<p class="index">[transition.scaleBy()][api.library.transition.scaleBy]</p>

<p class="index">[transition.scaleTo()][api.library.transition.scaleTo]</p>

<p class="index">[transition.to()][api.library.transition.to]</p>


#### [widget.*][api.library.widget]

<p class="index">[widget.newButton()][api.library.widget.newButton]</p>

<p class="index">[widget.newPickerWheel()][api.library.widget.newPickerWheel]</p>

<p class="index">[widget.newProgressView()][api.library.widget.newProgressView]</p>

<p class="index">[widget.newScrollView()][api.library.widget.newScrollView]</p>

<p class="index">[widget.newSegmentedControl()][api.library.widget.newSegmentedControl]</p>

<p class="index">[widget.newSlider()][api.library.widget.newSlider]</p>

<p class="index">[widget.newSpinner()][api.library.widget.newSpinner]</p>

<p class="index">[widget.newStepper()][api.library.widget.newStepper]</p>

<p class="index">[widget.newSwitch()][api.library.widget.newSwitch]</p>

<p class="index">[widget.newTabBar()][api.library.widget.newTabBar]</p>

<p class="index">[widget.newTableView()][api.library.widget.newTableView]</p>

<p class="index">[widget.setTheme()][api.library.widget.setTheme]</p>


## [Events][api.event]


#### [accelerometer][api.event.accelerometer]

<p class="index">[event.deltaTime][api.event.accelerometer.deltaTime]</p>

<p class="index">[event.device][api.event.accelerometer.device]</p>

<p class="index">[event.isShake][api.event.accelerometer.isShake]</p>

<p class="index">[event.name][api.event.accelerometer.name]</p>

<p class="index">[event.xGravity][api.event.accelerometer.xGravity]</p>

<p class="index">[event.xInstant][api.event.accelerometer.xInstant]</p>

<p class="index">[event.xRaw][api.event.accelerometer.xRaw]</p>

<p class="index">[event.yGravity][api.event.accelerometer.yGravity]</p>

<p class="index">[event.yInstant][api.event.accelerometer.yInstant]</p>

<p class="index">[event.yRaw][api.event.accelerometer.yRaw]</p>

<p class="index">[event.zGravity][api.event.accelerometer.zGravity]</p>

<p class="index">[event.zInstant][api.event.accelerometer.zInstant]</p>

<p class="index">[event.zRaw][api.event.accelerometer.zRaw]</p>


#### [audio][api.event.audio]

<p class="index">[event.channel][api.event.audio.channel]</p>

<p class="index">[event.completed][api.event.audio.completed]</p>

<p class="index">[event.handle][api.event.audio.handle]</p>

<p class="index">[event.name][api.event.audio.name]</p>

<p class="index">[event.phase][api.event.audio.phase]</p>


#### [axis][api.event.axis]

<p class="index">[event.axis][api.event.axis.axis]</p>

<p class="index">[event.device][api.event.axis.device]</p>

<p class="index">[event.name][api.event.axis.name]</p>

<p class="index">[event.normalizedValue][api.event.axis.normalizedValue]</p>

<p class="index">[event.rawValue][api.event.axis.rawValue]</p>


#### [collision][api.event.collision]

<p class="index">[event.contact][api.event.collision.contact]</p>

<p class="index">[event.element1][api.event.collision.element1]</p>

<p class="index">[event.element2][api.event.collision.element2]</p>

<p class="index">[event.name][api.event.collision.name]</p>

<p class="index">[event.object1][api.event.collision.object1]</p>

<p class="index">[event.object2][api.event.collision.object2]</p>

<p class="index">[event.other][api.event.collision.other]</p>

<p class="index">[event.otherElement][api.event.collision.otherElement]</p>

<p class="index">[event.phase][api.event.collision.phase]</p>

<p class="index">[event.selfElement][api.event.collision.selfElement]</p>

<p class="index">[event.target][api.event.collision.target]</p>

<p class="index">[event.x][api.event.collision.x]</p>

<p class="index">[event.y][api.event.collision.y]</p>


#### [colorSample][api.event.colorSample]

<p class="index">[event.a][api.event.colorSample.a]</p>

<p class="index">[event.b][api.event.colorSample.b]</p>

<p class="index">[event.g][api.event.colorSample.g]</p>

<p class="index">[event.name][api.event.colorSample.name]</p>

<p class="index">[event.r][api.event.colorSample.r]</p>

<p class="index">[event.x][api.event.colorSample.x]</p>

<p class="index">[event.y][api.event.colorSample.y]</p>


#### [completion][api.event.completion]

<p class="index">[event.action][api.event.completion.action]</p>

<p class="index">[event.completed][api.event.completion.completed]</p>

<p class="index">[event.duration][api.event.completion.duration]</p>

<p class="index">[event.fileSize][api.event.completion.fileSize]</p>

<p class="index">[event.name][api.event.completion.name]</p>

<p class="index">[event.target][api.event.completion.target]</p>

<p class="index">[event.url][api.event.completion.url]</p>


#### [enterFrame][api.event.enterFrame]

<p class="index">[event.name][api.event.enterFrame.name]</p>

<p class="index">[event.time][api.event.enterFrame.time]</p>


#### [finalize][api.event.finalize]

<p class="index">[event.name][api.event.finalize.name]</p>

<p class="index">[event.target][api.event.finalize.target]</p>


#### [gameNetwork][api.event.gameNetwork]

<p class="index">[event.data][api.event.gameNetwork.data]</p>

<p class="index">[event.errorCode][api.event.gameNetwork.errorCode]</p>

<p class="index">[event.errorMessage][api.event.gameNetwork.errorMessage]</p>

<p class="index">[event.localPlayerScore][api.event.gameNetwork.localPlayerScore]</p>

<p class="index">[event.name][api.event.gameNetwork.name]</p>

<p class="index">[event.provider][api.event.gameNetwork.provider]</p>

<p class="index">[event.type][api.event.gameNetwork.type]</p>


#### [gyroscope][api.event.gyroscope]

<p class="index">[event.deltaTime][api.event.gyroscope.deltaTime]</p>

<p class="index">[event.name][api.event.gyroscope.name]</p>

<p class="index">[event.xRotation][api.event.gyroscope.xRotation]</p>

<p class="index">[event.yRotation][api.event.gyroscope.yRotation]</p>

<p class="index">[event.zRotation][api.event.gyroscope.zRotation]</p>


#### [heading (compass)][api.event.heading]

<p class="index">[event.geographic][api.event.heading.geographic]</p>

<p class="index">[event.magnetic][api.event.heading.magnetic]</p>

<p class="index">[event.name][api.event.heading.name]</p>


#### [inputDeviceStatus][api.event.inputDeviceStatus]

<p class="index">[event.connectionStateChanged][api.event.inputDeviceStatus.connectionStateChanged]</p>

<p class="index">[event.device][api.event.inputDeviceStatus.device]</p>

<p class="index">[event.name][api.event.inputDeviceStatus.name]</p>

<p class="index">[event.reconfigured][api.event.inputDeviceStatus.reconfigured]</p>


#### [key][api.event.key]

<p class="index">[event.descriptor][api.event.key.descriptor]</p>

<p class="index">[event.device][api.event.key.device]</p>

<p class="index">[event.isAltDown][api.event.key.isAltDown]</p>

<p class="index">[event.isCommandDown][api.event.key.isCommandDown]</p>

<p class="index">[event.isCtrlDown][api.event.key.isCtrlDown]</p>

<p class="index">[event.isShiftDown][api.event.key.isShiftDown]</p>

<p class="index">[event.keyName][api.event.key.keyName]</p>

<p class="index">[event.name][api.event.key.name]</p>

<p class="index">[event.nativeKeyCode][api.event.key.nativeKeyCode]</p>

<p class="index">[event.phase][api.event.key.phase]</p>


#### [lateUpdate][api.event.lateUpdate]

<p class="index">[event.name][api.event.lateUpdate.name]</p>

<p class="index">[event.time][api.event.lateUpdate.time]</p>


#### [licensing][api.event.licensing]

<p class="index">[event.errorType][api.event.licensing.errorType]</p>

<p class="index">[event.expiration][api.event.licensing.expiration]</p>

<p class="index">[event.isError][api.event.licensing.isError]</p>

<p class="index">[event.isVerified][api.event.licensing.isVerified]</p>

<p class="index">[event.name][api.event.licensing.name]</p>

<p class="index">[event.provider][api.event.licensing.provider]</p>

<p class="index">[event.response][api.event.licensing.response]</p>


#### [location (GPS)][api.event.location]

<p class="index">[event.accuracy][api.event.location.accuracy]</p>

<p class="index">[event.altitude][api.event.location.altitude]</p>

<p class="index">[event.direction][api.event.location.direction]</p>

<p class="index">[event.errorCode][api.event.location.errorCode]</p>

<p class="index">[event.errorMessage][api.event.location.errorMessage]</p>

<p class="index">[event.latitude][api.event.location.latitude]</p>

<p class="index">[event.longitude][api.event.location.longitude]</p>

<p class="index">[event.name][api.event.location.name]</p>

<p class="index">[event.speed][api.event.location.speed]</p>

<p class="index">[event.time][api.event.location.time]</p>


#### [mapAddress][api.event.mapAddress]

<p class="index">[event.city][api.event.mapAddress.city]</p>

<p class="index">[event.cityDetail][api.event.mapAddress.cityDetail]</p>

<p class="index">[event.country][api.event.mapAddress.country]</p>

<p class="index">[event.countryCode][api.event.mapAddress.countryCode]</p>

<p class="index">[event.errorMessage][api.event.mapAddress.errorMessage]</p>

<p class="index">[event.isError][api.event.mapAddress.isError]</p>

<p class="index">[event.name][api.event.mapAddress.name]</p>

<p class="index">[event.postalCode][api.event.mapAddress.postalCode]</p>

<p class="index">[event.region][api.event.mapAddress.region]</p>

<p class="index">[event.regionDetail][api.event.mapAddress.regionDetail]</p>

<p class="index">[event.street][api.event.mapAddress.street]</p>

<p class="index">[event.streetDetail][api.event.mapAddress.streetDetail]</p>


#### [mapLocation][api.event.mapLocation]

<p class="index">[event.errorMessage][api.event.mapLocation.errorMessage]</p>

<p class="index">[event.isError][api.event.mapLocation.isError]</p>

<p class="index">[event.latitude][api.event.mapLocation.latitude]</p>

<p class="index">[event.longitude][api.event.mapLocation.longitude]</p>

<p class="index">[event.name][api.event.mapLocation.name]</p>

<p class="index">[event.request][api.event.mapLocation.request]</p>

<p class="index">[event.type][api.event.mapLocation.type]</p>


#### [mapMarker][api.event.mapMarker]

<p class="index">[event.latitude][api.event.mapMarker.latitude]</p>

<p class="index">[event.longitude][api.event.mapMarker.longitude]</p>

<p class="index">[event.markerId][api.event.mapMarker.markerId]</p>


#### [memoryWarning][api.event.memoryWarning]

<p class="index">[event.name][api.event.memoryWarning.name]</p>


#### [mouse][api.event.mouse]

<p class="index">[event.isAltDown][api.event.mouse.isAltDown]</p>

<p class="index">[event.isCommandDown][api.event.mouse.isCommandDown]</p>

<p class="index">[event.isCtrlDown][api.event.mouse.isCtrlDown]</p>

<p class="index">[event.isMiddleButtonDown][api.event.mouse.isMiddleButtonDown]</p>

<p class="index">[event.isPrimaryButtonDown][api.event.mouse.isPrimaryButtonDown]</p>

<p class="index">[event.isSecondaryButtonDown][api.event.mouse.isSecondaryButtonDown]</p>

<p class="index">[event.isShiftDown][api.event.mouse.isShiftDown]</p>

<p class="index">[event.name][api.event.mouse.name]</p>

<p class="index">[event.scrollX][api.event.mouse.scrollX]</p>

<p class="index">[event.scrollY][api.event.mouse.scrollY]</p>

<p class="index">[event.time][api.event.mouse.time]</p>

<p class="index">[event.type][api.event.mouse.type]</p>

<p class="index">[event.x][api.event.mouse.x]</p>

<p class="index">[event.y][api.event.mouse.y]</p>


#### [networkRequest][api.event.networkRequest]

<p class="index">[event.bytesEstimated][api.event.networkRequest.bytesEstimated]</p>

<p class="index">[event.bytesTransferred][api.event.networkRequest.bytesTransferred]</p>

<p class="index">[event.isError][api.event.networkRequest.isError]</p>

<p class="index">[event.name][api.event.networkRequest.name]</p>

<p class="index">[event.phase][api.event.networkRequest.phase]</p>

<p class="index">[event.requestId][api.event.networkRequest.requestId]</p>

<p class="index">[event.response][api.event.networkRequest.response]</p>

<p class="index">[event.responseHeaders][api.event.networkRequest.responseHeaders]</p>

<p class="index">[event.responseType][api.event.networkRequest.responseType]</p>

<p class="index">[event.status][api.event.networkRequest.status]</p>

<p class="index">[event.url][api.event.networkRequest.url]</p>


#### [networkStatus][api.event.networkStatus]

<p class="index">[event.address][api.event.networkStatus.address]</p>

<p class="index">[event.isConnectionOnDemand][api.event.networkStatus.isConnectionOnDemand]</p>

<p class="index">[event.isConnectionRequired][api.event.networkStatus.isConnectionRequired]</p>

<p class="index">[event.isInteractionRequired][api.event.networkStatus.isInteractionRequired]</p>

<p class="index">[event.isReachable][api.event.networkStatus.isReachable]</p>

<p class="index">[event.isReachableViaCellular][api.event.networkStatus.isReachableViaCellular]</p>

<p class="index">[event.isReachableViaWiFi][api.event.networkStatus.isReachableViaWiFi]</p>

<p class="index">[event.name][api.event.networkStatus.name]</p>


#### [notification][api.event.notification]

<p class="index">[event.alert][api.event.notification.alert]</p>

<p class="index">[event.applicationState][api.event.notification.applicationState]</p>

<p class="index">[event.badge][api.event.notification.badge]</p>

<p class="index">[event.custom][api.event.notification.custom]</p>

<p class="index">[event.name][api.event.notification.name]</p>

<p class="index">[event.sound][api.event.notification.sound]</p>

<p class="index">[event.type][api.event.notification.type]</p>


#### [orientation][api.event.orientation]

<p class="index">[event.delta][api.event.orientation.delta]</p>

<p class="index">[event.name][api.event.orientation.name]</p>

<p class="index">[event.type][api.event.orientation.type]</p>


#### [particleCollision][api.event.particleCollision]

<p class="index">[event.a][api.event.particleCollision.a]</p>

<p class="index">[event.b][api.event.particleCollision.b]</p>

<p class="index">[event.element][api.event.particleCollision.element]</p>

<p class="index">[event.g][api.event.particleCollision.g]</p>

<p class="index">[event.name][api.event.particleCollision.name]</p>

<p class="index">[event.normalX][api.event.particleCollision.normalX]</p>

<p class="index">[event.normalY][api.event.particleCollision.normalY]</p>

<p class="index">[event.object][api.event.particleCollision.object]</p>

<p class="index">[event.particleSystem][api.event.particleCollision.particleSystem]</p>

<p class="index">[event.phase][api.event.particleCollision.phase]</p>

<p class="index">[event.r][api.event.particleCollision.r]</p>

<p class="index">[event.x][api.event.particleCollision.x]</p>

<p class="index">[event.y][api.event.particleCollision.y]</p>


#### [popup][api.event.popup]

<p class="index">[event.name][api.event.popup.name]</p>

<p class="index">[event.type][api.event.popup.type]</p>


#### [postCollision][api.event.postCollision]

<p class="index">[event.contact][api.event.postCollision.contact]</p>

<p class="index">[event.element1][api.event.postCollision.element1]</p>

<p class="index">[event.element2][api.event.postCollision.element2]</p>

<p class="index">[event.force][api.event.postCollision.force]</p>

<p class="index">[event.friction][api.event.postCollision.friction]</p>

<p class="index">[event.name][api.event.postCollision.name]</p>

<p class="index">[event.object1][api.event.postCollision.object1]</p>

<p class="index">[event.object2][api.event.postCollision.object2]</p>

<p class="index">[event.other][api.event.postCollision.other]</p>

<p class="index">[event.otherElement][api.event.postCollision.otherElement]</p>

<p class="index">[event.selfElement][api.event.postCollision.selfElement]</p>

<p class="index">[event.target][api.event.postCollision.target]</p>

<p class="index">[event.x][api.event.postCollision.x]</p>

<p class="index">[event.y][api.event.postCollision.y]</p>


#### [preCollision][api.event.preCollision]

<p class="index">[event.contact][api.event.preCollision.contact]</p>

<p class="index">[event.element1][api.event.preCollision.element1]</p>

<p class="index">[event.element2][api.event.preCollision.element2]</p>

<p class="index">[event.name][api.event.preCollision.name]</p>

<p class="index">[event.object1][api.event.preCollision.object1]</p>

<p class="index">[event.object2][api.event.preCollision.object2]</p>

<p class="index">[event.other][api.event.preCollision.other]</p>

<p class="index">[event.otherElement][api.event.preCollision.otherElement]</p>

<p class="index">[event.selfElement][api.event.preCollision.selfElement]</p>

<p class="index">[event.target][api.event.preCollision.target]</p>

<p class="index">[event.x][api.event.preCollision.x]</p>

<p class="index">[event.y][api.event.preCollision.y]</p>


#### [relativeTouch][api.event.relativeTouch]

<p class="index">[event.id][api.event.relativeTouch.id]</p>

<p class="index">[event.name][api.event.relativeTouch.name]</p>

<p class="index">[event.phase][api.event.relativeTouch.phase]</p>

<p class="index">[event.tapCount][api.event.relativeTouch.tapCount]</p>

<p class="index">[event.time][api.event.relativeTouch.time]</p>

<p class="index">[event.x][api.event.relativeTouch.x]</p>

<p class="index">[event.y][api.event.relativeTouch.y]</p>


#### [resize][api.event.resize]

<p class="index">[event.name][api.event.resize.name]</p>


#### [scene][api.event.scene]

<p class="index">[create][api.event.scene.create]</p>

<p class="index">[event.name][api.event.scene.create.name]</p>

<p class="index">[event.params][api.event.scene.create.params]</p>

<p class="index">[destroy][api.event.scene.destroy]</p>

<p class="index">[event.name][api.event.scene.destroy.name]</p>

<p class="index">[hide][api.event.scene.hide]</p>

<p class="index">[event.name][api.event.scene.hide.name]</p>

<p class="index">[event.parent][api.event.scene.hide.parent]</p>

<p class="index">[event.phase][api.event.scene.hide.phase]</p>

<p class="index">[show][api.event.scene.show]</p>

<p class="index">[event.name][api.event.scene.show.name]</p>

<p class="index">[event.params][api.event.scene.show.params]</p>

<p class="index">[event.parent][api.event.scene.show.parent]</p>

<p class="index">[event.phase][api.event.scene.show.phase]</p>


#### [sprite][api.event.sprite]

<p class="index">[event.name][api.event.sprite.name]</p>

<p class="index">[event.phase][api.event.sprite.phase]</p>

<p class="index">[event.sprite][api.event.sprite.sprite]</p>

<p class="index">[event.target][api.event.sprite.target]</p>


#### [system][api.event.system]

<p class="index">[event.commandLineArgs][api.event.system.commandLineArgs]</p>

<p class="index">[event.commandLineDir][api.event.system.commandLineDir]</p>

<p class="index">[event.name][api.event.system.name]</p>

<p class="index">[event.type][api.event.system.type]</p>

<p class="index">[event.url][api.event.system.url]</p>

#### [windowState][api.event.windowState]

<p class="index">[event.name][api.event.windowState.name]</p>

<p class="index">[event.phase][api.event.windowState.phase]</p>


#### [tap][api.event.tap]

<p class="index">[event.name][api.event.tap.name]</p>

<p class="index">[event.numTaps][api.event.tap.numTaps]</p>

<p class="index">[event.x][api.event.tap.x]</p>

<p class="index">[event.y][api.event.tap.y]</p>


#### [timer][api.event.timer]

<p class="index">[event.count][api.event.timer.count]</p>

<p class="index">[event.name][api.event.timer.name]</p>

<p class="index">[event.source][api.event.timer.source]</p>

<p class="index">[event.time][api.event.timer.time]</p>


#### [touch][api.event.touch]

<p class="index">[event.id][api.event.touch.id]</p>

<p class="index">[event.name][api.event.touch.name]</p>

<p class="index">[event.phase][api.event.touch.phase]</p>

<p class="index">[event.pressure][api.event.touch.pressure]</p>

<p class="index">[event.target][api.event.touch.target]</p>

<p class="index">[event.time][api.event.touch.time]</p>

<p class="index">[event.x][api.event.touch.x]</p>

<p class="index">[event.xStart][api.event.touch.xStart]</p>

<p class="index">[event.y][api.event.touch.y]</p>

<p class="index">[event.yStart][api.event.touch.yStart]</p>


#### [unhandledError][api.event.unhandledError]

<p class="index">[event.errorMessage][api.event.unhandledError.errorMessage]</p>

<p class="index">[event.stackTrace][api.event.unhandledError.stackTrace]</p>


#### [urlRequest][api.event.urlRequest]

<p class="index">[event.errorCode][api.event.urlRequest.errorCode]</p>

<p class="index">[event.errorMessage][api.event.urlRequest.errorMessage]</p>

<p class="index">[event.name][api.event.urlRequest.name]</p>

<p class="index">[event.type][api.event.urlRequest.type]</p>

<p class="index">[event.url][api.event.urlRequest.url]</p>


#### [userInput][api.event.userInput]

<p class="index">[event.newCharacters][api.event.userInput.newCharacters]</p>

<p class="index">[event.numDeleted][api.event.userInput.numDeleted]</p>

<p class="index">[event.oldText][api.event.userInput.oldText]</p>

<p class="index">[event.phase][api.event.userInput.phase]</p>

<p class="index">[event.startPosition][api.event.userInput.startPosition]</p>

<p class="index">[event.target][api.event.userInput.target]</p>

<p class="index">[event.text][api.event.userInput.text]</p>


#### [video][api.event.video]

<p class="index">[event.name][api.event.video.name]</p>

<p class="index">[event.phase][api.event.video.phase]</p>


## [Types][api.type]


#### [Array][api.type.Array]


#### [BitmapPaint][api.type.BitmapPaint]

<p class="index">[fill.rotation][api.type.BitmapPaint.rotation]</p>

<p class="index">[fill.scaleX][api.type.BitmapPaint.scaleX]</p>

<p class="index">[fill.scaleY][api.type.BitmapPaint.scaleY]</p>

<p class="index">[fill.x][api.type.BitmapPaint.x]</p>

<p class="index">[fill.y][api.type.BitmapPaint.y]</p>


#### [Body][api.type.Body]

<p class="index">[object.angularDamping][api.type.Body.angularDamping]</p>

<p class="index">[object.angularVelocity][api.type.Body.angularVelocity]</p>

<p class="index">[object:applyAngularImpulse()][api.type.Body.applyAngularImpulse]</p>

<p class="index">[object:applyForce()][api.type.Body.applyForce]</p>

<p class="index">[object:applyLinearImpulse()][api.type.Body.applyLinearImpulse]</p>

<p class="index">[object:applyTorque()][api.type.Body.applyTorque]</p>

<p class="index">[object.bodyType][api.type.Body.bodyType]</p>

<p class="index">[object:getLinearVelocity()][api.type.Body.getLinearVelocity]</p>

<p class="index">[object:getMassLocalCenter()][api.type.Body.getMassLocalCenter]</p>

<p class="index">[object:getMassWorldCenter()][api.type.Body.getMassWorldCenter]</p>

<p class="index">[object.gravityScale][api.type.Body.gravityScale]</p>

<p class="index">[object.isAwake][api.type.Body.isAwake]</p>

<p class="index">[object.isBodyActive][api.type.Body.isBodyActive]</p>

<p class="index">[object.isBullet][api.type.Body.isBullet]</p>

<p class="index">[object.isFixedRotation][api.type.Body.isFixedRotation]</p>

<p class="index">[object.isSensor][api.type.Body.isSensor]</p>

<p class="index">[object.isSleepingAllowed][api.type.Body.isSleepingAllowed]</p>

<p class="index">[object.linearDamping][api.type.Body.linearDamping]</p>

<p class="index">[object.mass][api.type.Body.mass]</p>

<p class="index">[object:resetMassData()][api.type.Body.resetMassData]</p>

<p class="index">[object:setLinearVelocity()][api.type.Body.setLinearVelocity]</p>


#### [Boolean][api.type.Boolean]


#### [ButtonWidget][api.type.ButtonWidget]

<p class="index">[object:getLabel()][api.type.ButtonWidget.getLabel]</p>

<p class="index">[object:setEnabled()][api.type.ButtonWidget.setEnabled]</p>

<p class="index">[object:setLabel()][api.type.ButtonWidget.setLabel]</p>


#### [CirclePath][api.type.CirclePath]


#### [CompositePaint][api.type.CompositePaint]


#### [Constant][api.type.Constant]


#### [CoronaClass][api.type.CoronaClass]


#### [CoronaLibrary][api.type.CoronaLibrary]

<p class="index">[object:getCurrentProvider()][api.type.CoronaLibrary.getCurrentProvider]</p>

<p class="index">[object.name][api.type.CoronaLibrary.name]</p>

<p class="index">[object.publisherId][api.type.CoronaLibrary.publisherId]</p>

<p class="index">[object.revision][api.type.CoronaLibrary.revision]</p>

<p class="index">[object:setCurrentProvider()][api.type.CoronaLibrary.setCurrentProvider]</p>

<p class="index">[object.version][api.type.CoronaLibrary.version]</p>


#### [CoronaPrototype][api.type.CoronaPrototype]

<p class="index">[object:initialize()][api.type.CoronaPrototype.initialize]</p>

<p class="index">[object:instanceOf()][api.type.CoronaPrototype.instanceOf]</p>

<p class="index">[object:isClass()][api.type.CoronaPrototype.isClass]</p>

<p class="index">[object:isRoot()][api.type.CoronaPrototype.isRoot]</p>

<p class="index">[object:new()][api.type.CoronaPrototype.new]</p>

<p class="index">[object:newClass()][api.type.CoronaPrototype.newClass]</p>

<p class="index">[object:setExtension()][api.type.CoronaPrototype.setExtension]</p>


#### [CoronaProvider][api.type.CoronaProvider]


#### [DisplayObject][api.type.DisplayObject]

<p class="index">[object.alpha][api.type.DisplayObject.alpha]</p>

<p class="index">[object.anchorX][api.type.DisplayObject.anchorX]</p>

<p class="index">[object.anchorY][api.type.DisplayObject.anchorY]</p>

<p class="index">[object.blendMode][api.type.DisplayObject.blendMode]</p>

<p class="index">[object.contentBounds][api.type.DisplayObject.contentBounds]</p>

<p class="index">[object.contentHeight][api.type.DisplayObject.contentHeight]</p>

<p class="index">[object:contentToLocal()][api.type.DisplayObject.contentToLocal]</p>

<p class="index">[object.contentWidth][api.type.DisplayObject.contentWidth]</p>

<p class="index">[object.\_defined][api.type.DisplayObject.defined]</p>

<p class="index">[object.height][api.type.DisplayObject.height]</p>

<p class="index">[object.isHitTestMasked][api.type.DisplayObject.isHitTestMasked]</p>

<p class="index">[object.isHitTestable][api.type.DisplayObject.isHitTestable]</p>

<p class="index">[object.isVisible][api.type.DisplayObject.isVisible]</p>

<p class="index">[object.\_lastChange][api.type.DisplayObject.lastChange]</p>

<p class="index">[object:localToContent()][api.type.DisplayObject.localToContent]</p>

<p class="index">[object.maskRotation][api.type.DisplayObject.maskRotation]</p>

<p class="index">[object.maskScaleX][api.type.DisplayObject.maskScaleX]</p>

<p class="index">[object.maskScaleY][api.type.DisplayObject.maskScaleY]</p>

<p class="index">[object.maskX][api.type.DisplayObject.maskX]</p>

<p class="index">[object.maskY][api.type.DisplayObject.maskY]</p>

<p class="index">[object.parent][api.type.DisplayObject.parent]</p>

<p class="index">[object.\_properties][api.type.DisplayObject.properties]</p>

<p class="index">[object:removeSelf()][api.type.DisplayObject.removeSelf]</p>

<p class="index">[object:rotate()][api.type.DisplayObject.rotate]</p>

<p class="index">[object.rotation][api.type.DisplayObject.rotation]</p>

<p class="index">[object:scale()][api.type.DisplayObject.scale]</p>

<p class="index">[object:setMask()][api.type.DisplayObject.setMask]</p>

<p class="index">[object:toBack()][api.type.DisplayObject.toBack]</p>

<p class="index">[object:toFront()][api.type.DisplayObject.toFront]</p>

<p class="index">[object:translate()][api.type.DisplayObject.translate]</p>

<p class="index">[object.width][api.type.DisplayObject.width]</p>

<p class="index">[object.x][api.type.DisplayObject.x]</p>

<p class="index">[object.xScale][api.type.DisplayObject.xScale]</p>

<p class="index">[object.y][api.type.DisplayObject.y]</p>

<p class="index">[object.yScale][api.type.DisplayObject.yScale]</p>


#### [EmitterObject][api.type.EmitterObject]

<p class="index">[EmitterObject:pause()][api.type.EmitterObject.pause]</p>

<p class="index">[EmitterObject:start()][api.type.EmitterObject.start]</p>

<p class="index">[EmitterObject:stop()][api.type.EmitterObject.stop]</p>


#### [Event][api.type.Event]


#### [EventDispatcher][api.type.EventDispatcher]

<p class="index">[object:addEventListener()][api.type.EventDispatcher.addEventListener]</p>

<p class="index">[object:dispatchEvent()][api.type.EventDispatcher.dispatchEvent]</p>

<p class="index">[object:removeEventListener()][api.type.EventDispatcher.removeEventListener]</p>


#### [File][api.type.File]

<p class="index">[object:close()][api.type.File.close]</p>

<p class="index">[object:flush()][api.type.File.flush]</p>

<p class="index">[object:lines()][api.type.File.lines]</p>

<p class="index">[object:read()][api.type.File.read]</p>

<p class="index">[object:seek()][api.type.File.seek]</p>

<p class="index">[object:setvbuf()][api.type.File.setvbuf]</p>

<p class="index">[object:write()][api.type.File.write]</p>


#### [Function][api.type.Function]


#### [GameNetwork][api.type.GameNetwork]

<p class="index">[gameNetwork.match][api.type.GameNetwork.match]</p>

<p class="index">[gameNetwork.outcome][api.type.GameNetwork.outcome]</p>

<p class="index">[gameNetwork.participant][api.type.GameNetwork.participant]</p>

<p class="index">[gameNetwork.status][api.type.GameNetwork.status]</p>


#### [GradientPaint][api.type.GradientPaint]


#### [GroupObject][api.type.GroupObject]

<p class="index">[object.anchorChildren][api.type.GroupObject.anchorChildren]</p>

<p class="index">[object:insert()][api.type.GroupObject.insert]</p>

<p class="index">[object.numChildren][api.type.GroupObject.numChildren]</p>

<p class="index">[object:remove()][api.type.GroupObject.remove]</p>


#### [ImageSheet][api.type.ImageSheet]


#### [ImageSheetPaint][api.type.ImageSheetPaint]

<p class="index">[fill.frame][api.type.ImageSheetPaint.frame]</p>


#### [InputAxis][api.type.InputAxis]

<p class="index">[object.accuracy][api.type.InputAxis.accuracy]</p>

<p class="index">[object.descriptor][api.type.InputAxis.descriptor]</p>

<p class="index">[object.maxValue][api.type.InputAxis.maxValue]</p>

<p class="index">[object.minValue][api.type.InputAxis.minValue]</p>

<p class="index">[object.number][api.type.InputAxis.number]</p>

<p class="index">[object.type][api.type.InputAxis.type]</p>


#### [InputDevice][api.type.InputDevice]

<p class="index">[object.MFiProfile][api.type.InputDevice.MFiProfile]</p>

<p class="index">[object.allowsRotation][api.type.InputDevice.allowsRotation]</p>

<p class="index">[object.androidDeviceId][api.type.InputDevice.androidDeviceId]</p>

<p class="index">[object.canVibrate][api.type.InputDevice.canVibrate]</p>

<p class="index">[object.connectionState][api.type.InputDevice.connectionState]</p>

<p class="index">[object.descriptor][api.type.InputDevice.descriptor]</p>

<p class="index">[object.displayName][api.type.InputDevice.displayName]</p>

<p class="index">[object.driver][api.type.InputDevice.driver]</p>

<p class="index">[object:getAxes()][api.type.InputDevice.getAxes]</p>

<p class="index">[object.isConnected][api.type.InputDevice.isConnected]</p>

<p class="index">[object.permanentId][api.type.InputDevice.permanentId]</p>

<p class="index">[object.playerNumber][api.type.InputDevice.playerNumber]</p>

<p class="index">[object.productName][api.type.InputDevice.productName]</p>

<p class="index">[object.reportsAbsoluteDpadValues][api.type.InputDevice.reportsAbsoluteDpadValues]</p>

<p class="index">[object.type][api.type.InputDevice.type]</p>

<p class="index">[object:vibrate()][api.type.InputDevice.vibrate]</p>


#### [Joint][api.type.Joint]

<p class="index">[object.dampingRatio][api.type.Joint.dampingRatio]</p>

<p class="index">[object.frequency][api.type.Joint.frequency]</p>

<p class="index">[object:getAnchorA()][api.type.Joint.getAnchorA]</p>

<p class="index">[object:getAnchorB()][api.type.Joint.getAnchorB]</p>

<p class="index">[object:getGroundAnchorA()][api.type.Joint.getGroundAnchorA]</p>

<p class="index">[object:getGroundAnchorB()][api.type.Joint.getGroundAnchorB]</p>

<p class="index">[object:getLimits()][api.type.Joint.getLimits]</p>

<p class="index">[object:getLocalAnchorA()][api.type.Joint.getLocalAnchorA]</p>

<p class="index">[object:getLocalAnchorB()][api.type.Joint.getLocalAnchorB]</p>

<p class="index">[object:getLocalAxisA()][api.type.Joint.getLocalAxisA]</p>

<p class="index">[object:getReactionForce()][api.type.Joint.getReactionForce]</p>

<p class="index">[object:getRotationLimits()][api.type.Joint.getRotationLimits]</p>

<p class="index">[object:getTarget()][api.type.Joint.getTarget]</p>

<p class="index">[object.isActive][api.type.Joint.isActive]</p>

<p class="index">[object.isCollideConnected][api.type.Joint.isCollideConnected]</p>

<p class="index">[object.isLimitEnabled][api.type.Joint.isLimitEnabled]</p>

<p class="index">[object.isMotorEnabled][api.type.Joint.isMotorEnabled]</p>

<p class="index">[object.joint1][api.type.Joint.joint1]</p>

<p class="index">[object.joint2][api.type.Joint.joint2]</p>

<p class="index">[object.jointAngle][api.type.Joint.jointAngle]</p>

<p class="index">[object.jointSpeed][api.type.Joint.jointSpeed]</p>

<p class="index">[object.jointTranslation][api.type.Joint.jointTranslation]</p>

<p class="index">[object.length][api.type.Joint.length]</p>

<p class="index">[object.length1][api.type.Joint.length1]</p>

<p class="index">[object.length2][api.type.Joint.length2]</p>

<p class="index">[object.limitState][api.type.Joint.limitState]</p>

<p class="index">[object.maxForce][api.type.Joint.maxForce]</p>

<p class="index">[object.maxLength][api.type.Joint.maxLength]</p>

<p class="index">[object.maxMotorForce][api.type.Joint.maxMotorForce]</p>

<p class="index">[object.maxMotorTorque][api.type.Joint.maxMotorTorque]</p>

<p class="index">[object.maxTorque][api.type.Joint.maxTorque]</p>

<p class="index">[object.motorForce][api.type.Joint.motorForce]</p>

<p class="index">[object.motorSpeed][api.type.Joint.motorSpeed]</p>

<p class="index">[object.motorTorque][api.type.Joint.motorTorque]</p>

<p class="index">[object.ratio][api.type.Joint.ratio]</p>

<p class="index">[object.reactionTorque][api.type.Joint.reactionTorque]</p>

<p class="index">[object.referenceAngle][api.type.Joint.referenceAngle]</p>

<p class="index">[object:removeSelf()][api.type.Joint.removeSelf]</p>

<p class="index">[object:setLimits()][api.type.Joint.setLimits]</p>

<p class="index">[object:setRotationLimits()][api.type.Joint.setRotationLimits]</p>

<p class="index">[object:setTarget()][api.type.Joint.setTarget]</p>

<p class="index">[object.springDampingRatio][api.type.Joint.springDampingRatio]</p>

<p class="index">[object.springFrequency][api.type.Joint.springFrequency]</p>


#### [Library][api.type.Library]


#### [LineObject][api.type.LineObject]

<p class="index">[object.anchorSegments][api.type.LineObject.anchorSegments]</p>

<p class="index">[object:append()][api.type.LineObject.append]</p>


#### [Listener][api.type.Listener]


#### [Map][api.type.Map]

<p class="index">[object:addMarker()][api.type.Map.addMarker]</p>

<p class="index">[object:getAddressLocation()][api.type.Map.getAddressLocation]</p>

<p class="index">[object:getUserLocation()][api.type.Map.getUserLocation]</p>

<p class="index">[object.isLocationVisible][api.type.Map.isLocationVisible]</p>

<p class="index">[object.isScrollEnabled][api.type.Map.isScrollEnabled]</p>

<p class="index">[object.isZoomEnabled][api.type.Map.isZoomEnabled]</p>

<p class="index">[object.mapType][api.type.Map.mapType]</p>

<p class="index">[object:nearestAddress()][api.type.Map.nearestAddress]</p>

<p class="index">[object:removeAllMarkers()][api.type.Map.removeAllMarkers]</p>

<p class="index">[object:removeMarker()][api.type.Map.removeMarker]</p>

<p class="index">[object:requestLocation()][api.type.Map.requestLocation]</p>

<p class="index">[object:setCenter()][api.type.Map.setCenter]</p>

<p class="index">[object:setRegion()][api.type.Map.setRegion]</p>


#### [Mask][api.type.Mask]


#### [NativeDisplayObject][api.type.NativeDisplayObject]

<p class="index">[object:getNativeProperty()][api.type.NativeDisplayObject.getNativeProperty]</p>

<p class="index">[object:setNativeProperty()][api.type.NativeDisplayObject.setNativeProperty]</p>


#### [Number][api.type.Number]


#### [Object][api.type.Object]


#### [Paint][api.type.Paint]

<p class="index">[fill.a][api.type.Paint.a]</p>

<p class="index">[fill.b][api.type.Paint.b]</p>

<p class="index">[fill.blendEquation][api.type.Paint.blendEquation]</p>

<p class="index">[fill.blendMode][api.type.Paint.blendMode]</p>

<p class="index">[fill.effect][api.type.Paint.effect]</p>

<p class="index">[fill.g][api.type.Paint.g]</p>

<p class="index">[fill.r][api.type.Paint.r]</p>


#### [ParticleSystem][api.type.ParticleSystem]

<p class="index">[object:applyForce()][api.type.ParticleSystem.applyForce]</p>

<p class="index">[object:applyLinearImpulse()][api.type.ParticleSystem.applyLinearImpulse]</p>

<p class="index">[object:createGroup()][api.type.ParticleSystem.createGroup]</p>

<p class="index">[object:createParticle()][api.type.ParticleSystem.createParticle]</p>

<p class="index">[object:destroyParticles()][api.type.ParticleSystem.destroyParticles]</p>

<p class="index">[object.imageRadius][api.type.ParticleSystem.imageRadius]</p>

<p class="index">[object.particleCount][api.type.ParticleSystem.particleCount]</p>

<p class="index">[object.particleDamping][api.type.ParticleSystem.particleDamping]</p>

<p class="index">[object.particleDensity][api.type.ParticleSystem.particleDensity]</p>

<p class="index">[object.particleDestructionByAge][api.type.ParticleSystem.particleDestructionByAge]</p>

<p class="index">[object.particleGravityScale][api.type.ParticleSystem.particleGravityScale]</p>

<p class="index">[object.particleMass][api.type.ParticleSystem.particleMass]</p>

<p class="index">[object.particleMaxCount][api.type.ParticleSystem.particleMaxCount]</p>

<p class="index">[object.particlePaused][api.type.ParticleSystem.particlePaused]</p>

<p class="index">[object.particleRadius][api.type.ParticleSystem.particleRadius]</p>

<p class="index">[object.particleStrictContactCheck][api.type.ParticleSystem.particleStrictContactCheck]</p>

<p class="index">[object:queryRegion()][api.type.ParticleSystem.queryRegion]</p>

<p class="index">[object:rayCast()][api.type.ParticleSystem.rayCast]</p>


#### [Path][api.type.Path]


#### [PhysicsContact][api.type.PhysicsContact]

<p class="index">[PhysicsContact.bounce][api.type.PhysicsContact.bounce]</p>

<p class="index">[PhysicsContact.friction][api.type.PhysicsContact.friction]</p>

<p class="index">[PhysicsContact.isEnabled][api.type.PhysicsContact.isEnabled]</p>

<p class="index">[PhysicsContact.isTouching][api.type.PhysicsContact.isTouching]</p>


#### [PickerWheelWidget][api.type.PickerWheelWidget]

<p class="index">[object:getValues()][api.type.PickerWheelWidget.getValues]</p>

<p class="index">[object:selectValue()][api.type.PickerWheelWidget.selectValue]</p>


#### [ProgressViewWidget][api.type.ProgressViewWidget]

<p class="index">[object:getProgress()][api.type.ProgressViewWidget.getProgress]</p>

<p class="index">[object:resizeView()][api.type.ProgressViewWidget.resizeView]</p>

<p class="index">[object:setProgress()][api.type.ProgressViewWidget.setProgress]</p>


#### [Recording][api.type.Recording]

<p class="index">[object:getSampleRate()][api.type.Recording.getSampleRate]</p>

<p class="index">[object:isRecording()][api.type.Recording.isRecording]</p>

<p class="index">[object:setSampleRate()][api.type.Recording.setSampleRate]</p>

<p class="index">[object:startRecording()][api.type.Recording.startRecording]</p>

<p class="index">[object:stopRecording()][api.type.Recording.stopRecording]</p>


#### [RectPath][api.type.RectPath]


#### [RoundedRectPath][api.type.RoundedRectPath]


#### [Runtime][api.type.Runtime]

<p class="index">[Runtime:hasEventSource()][api.type.Runtime.hasEventSource]</p>

<p class="index">[Runtime:hideErrorAlerts()][api.type.Runtime.hideErrorAlerts]</p>


#### [Scene][api.type.Scene]


#### [ScrollViewWidget][api.type.ScrollViewWidget]

<p class="index">[object:getContentPosition()][api.type.ScrollViewWidget.getContentPosition]</p>

<p class="index">[object:getView()][api.type.ScrollViewWidget.getView]</p>

<p class="index">[object:scrollTo()][api.type.ScrollViewWidget.scrollTo]</p>

<p class="index">[object:scrollToPosition()][api.type.ScrollViewWidget.scrollToPosition]</p>

<p class="index">[object:setIsLocked()][api.type.ScrollViewWidget.setIsLocked]</p>

<p class="index">[object:setScrollHeight()][api.type.ScrollViewWidget.setScrollHeight]</p>

<p class="index">[object:setScrollWidth()][api.type.ScrollViewWidget.setScrollWidth]</p>

<p class="index">[object:takeFocus()][api.type.ScrollViewWidget.takeFocus]</p>


#### [SegmentedControlWidget][api.type.SegmentedControlWidget]

<p class="index">[object.segmentLabel][api.type.SegmentedControlWidget.segmentLabel]</p>

<p class="index">[object.segmentNumber][api.type.SegmentedControlWidget.segmentNumber]</p>

<p class="index">[object:setActiveSegment()][api.type.SegmentedControlWidget.setActiveSegment]</p>


#### [ShapeObject][api.type.ShapeObject]

<p class="index">[object.fill][api.type.ShapeObject.fill]</p>

<p class="index">[object.path][api.type.ShapeObject.path]</p>

<p class="index">[object:setFillColor()][api.type.ShapeObject.setFillColor]</p>

<p class="index">[object:setStrokeColor()][api.type.ShapeObject.setStrokeColor]</p>

<p class="index">[object.stroke][api.type.ShapeObject.stroke]</p>

<p class="index">[object.strokeWidth][api.type.ShapeObject.strokeWidth]</p>


#### [SliderWidget][api.type.SliderWidget]

<p class="index">[object:setValue()][api.type.SliderWidget.setValue]</p>

<p class="index">[object.value][api.type.SliderWidget.value]</p>


#### [SnapshotObject][api.type.SnapshotObject]

<p class="index">[object.canvas][api.type.SnapshotObject.canvas]</p>

<p class="index">[object.canvasMode][api.type.SnapshotObject.canvasMode]</p>

<p class="index">[object.clearColor][api.type.SnapshotObject.clearColor]</p>

<p class="index">[object.group][api.type.SnapshotObject.group]</p>

<p class="index">[object:invalidate()][api.type.SnapshotObject.invalidate]</p>

<p class="index">[object.textureFilter][api.type.SnapshotObject.textureFilter]</p>

<p class="index">[object.textureWrapX][api.type.SnapshotObject.textureWrapX]</p>

<p class="index">[object.textureWrapY][api.type.SnapshotObject.textureWrapY]</p>


#### [SpinnerWidget][api.type.SpinnerWidget]

<p class="index">[object:start()][api.type.SpinnerWidget.start]</p>

<p class="index">[object:stop()][api.type.SpinnerWidget.stop]</p>


#### [SpriteObject][api.type.SpriteObject]

<p class="index">[object.frame][api.type.SpriteObject.frame]</p>

<p class="index">[object.isPlaying][api.type.SpriteObject.isPlaying]</p>

<p class="index">[object.numFrames][api.type.SpriteObject.numFrames]</p>

<p class="index">[object:pause()][api.type.SpriteObject.pause]</p>

<p class="index">[object:play()][api.type.SpriteObject.play]</p>

<p class="index">[object.sequence][api.type.SpriteObject.sequence]</p>

<p class="index">[object:setFrame()][api.type.SpriteObject.setFrame]</p>

<p class="index">[object:setSequence()][api.type.SpriteObject.setSequence]</p>

<p class="index">[object.timeScale][api.type.SpriteObject.timeScale]</p>


#### [StageObject][api.type.StageObject]

<p class="index">[StageObject:setFocus()][api.type.StageObject.setFocus]</p>


#### [StepperWidget][api.type.StepperWidget]

<p class="index">[object:getValue()][api.type.StepperWidget.getValue]</p>

<p class="index">[object.maximumValue][api.type.StepperWidget.maximumValue]</p>

<p class="index">[object.minimumValue][api.type.StepperWidget.minimumValue]</p>

<p class="index">[object:setValue()][api.type.StepperWidget.setValue]</p>

<p class="index">[object.value][api.type.StepperWidget.value]</p>


#### [String][api.type.String]


#### [SwitchWidget][api.type.SwitchWidget]

<p class="index">[object.isOn][api.type.SwitchWidget.isOn]</p>

<p class="index">[object:setState()][api.type.SwitchWidget.setState]</p>


#### [TabBarWidget][api.type.TabBarWidget]

<p class="index">[object:setSelected()][api.type.TabBarWidget.setSelected]</p>


#### [Table][api.type.Table]


#### [TableViewWidget][api.type.TableViewWidget]

<p class="index">[object:deleteAllRows()][api.type.TableViewWidget.deleteAllRows]</p>

<p class="index">[object:deleteRow()][api.type.TableViewWidget.deleteRow]</p>

<p class="index">[object:deleteRows()][api.type.TableViewWidget.deleteRows]</p>

<p class="index">[object:getContentPosition()][api.type.TableViewWidget.getContentPosition]</p>

<p class="index">[object:getNumRows()][api.type.TableViewWidget.getNumRows]</p>

<p class="index">[object:getRowAtIndex()][api.type.TableViewWidget.getRowAtIndex]</p>

<p class="index">[object:insertRow()][api.type.TableViewWidget.insertRow]</p>

<p class="index">[object:reloadData()][api.type.TableViewWidget.reloadData]</p>

<p class="index">[object:scrollToIndex()][api.type.TableViewWidget.scrollToIndex]</p>

<p class="index">[object:scrollToY()][api.type.TableViewWidget.scrollToY]</p>

<p class="index">[object:setIsLocked()][api.type.TableViewWidget.setIsLocked]</p>


#### [TextBox][api.type.TextBox]

<p class="index">[object.align][api.type.TextBox.align]</p>

<p class="index">[object.font][api.type.TextBox.font]</p>

<p class="index">[object.hasBackground][api.type.TextBox.hasBackground]</p>

<p class="index">[object.isEditable][api.type.TextBox.isEditable]</p>

<p class="index">[object.isFontSizeScaled][api.type.TextBox.isFontSizeScaled]</p>

<p class="index">[object.placeholder][api.type.TextBox.placeholder]</p>

<p class="index">[object:setReturnKey()][api.type.TextBox.setReturnKey]</p>

<p class="index">[object:setSelection()][api.type.TextBox.setSelection]</p>

<p class="index">[object:setTextColor()][api.type.TextBox.setTextColor]</p>

<p class="index">[object.size][api.type.TextBox.size]</p>

<p class="index">[object.text][api.type.TextBox.text]</p>


#### [TextField][api.type.TextField]

<p class="index">[object.align][api.type.TextField.align]</p>

<p class="index">[object.autocorrectionType][api.type.TextField.autocorrectionType]</p>

<p class="index">[object.font][api.type.TextField.font]</p>

<p class="index">[object.hasBackground][api.type.TextField.hasBackground]</p>

<p class="index">[object.inputType][api.type.TextField.inputType]</p>

<p class="index">[object.isFontSizeScaled][api.type.TextField.isFontSizeScaled]</p>

<p class="index">[object.isSecure][api.type.TextField.isSecure]</p>

<p class="index">[object.placeholder][api.type.TextField.placeholder]</p>

<p class="index">[object:resizeFontToFitHeight()][api.type.TextField.resizeFontToFitHeight]</p>

<p class="index">[object:resizeHeightToFitFont()][api.type.TextField.resizeHeightToFitFont]</p>

<p class="index">[object:setReturnKey()][api.type.TextField.setReturnKey]</p>

<p class="index">[object:setSelection()][api.type.TextField.setSelection]</p>

<p class="index">[object:setTextColor()][api.type.TextField.setTextColor]</p>

<p class="index">[object.size][api.type.TextField.size]</p>

<p class="index">[object.spellCheckingType][api.type.TextField.spellCheckingType]</p>

<p class="index">[object.text][api.type.TextField.text]</p>


#### [TextObject][api.type.TextObject]

<p class="index">[object.baselineOffset][api.type.TextObject.baselineOffset]</p>

<p class="index">[object:setEmbossColor()][api.type.TextObject.setEmbossColor]</p>

<p class="index">[object.size][api.type.TextObject.size]</p>

<p class="index">[object.text][api.type.TextObject.text]</p>


#### [TextureResource][api.type.TextureResource]

<p class="index">[texture.baseDir][api.type.TextureResource.baseDir]</p>

<p class="index">[texture.filename][api.type.TextureResource.filename]</p>

<p class="index">[texture:releaseSelf()][api.type.TextureResource.releaseSelf]</p>

<p class="index">[texture.type][api.type.TextureResource.type]</p>


#### [TextureResourceBitmap][api.type.TextureResourceBitmap]

<p class="index">[texture:preload()][api.type.TextureResourceBitmap.preload]</p>

<p class="index">[texture.wrapX][api.type.TextureResourceBitmap.wrapX]</p>

<p class="index">[texture.wrapY][api.type.TextureResourceBitmap.wrapY]</p>


#### [TextureResourceCanvas][api.type.TextureResourceCanvas]

<p class="index">[texture.anchorX][api.type.TextureResourceCanvas.anchorX]</p>

<p class="index">[texture.anchorY][api.type.TextureResourceCanvas.anchorY]</p>

<p class="index">[texture.cache][api.type.TextureResourceCanvas.cache]</p>

<p class="index">[texture:draw()][api.type.TextureResourceCanvas.draw]</p>

<p class="index">[texture.height][api.type.TextureResourceCanvas.height]</p>

<p class="index">[texture:invalidate()][api.type.TextureResourceCanvas.invalidate]</p>

<p class="index">[texture.pixelHeight][api.type.TextureResourceCanvas.pixelHeight]</p>

<p class="index">[texture.pixelWidth][api.type.TextureResourceCanvas.pixelWidth]</p>

<p class="index">[texture:setBackground()][api.type.TextureResourceCanvas.setBackground]</p>

<p class="index">[texture.width][api.type.TextureResourceCanvas.width]</p>


#### [TextureResourceExternal][api.type.TextureResourceExternal]

<p class="index">[texture.height][api.type.TextureResourceExternal.height]</p>

<p class="index">[texture:invalidate()][api.type.TextureResourceExternal.invalidate]</p>

<p class="index">[texture.width][api.type.TextureResourceExternal.width]</p>


#### [Userdata][api.type.Userdata]


#### [Video][api.type.Video]

<p class="index">[object.currentTime][api.type.Video.currentTime]</p>

<p class="index">[object.isMuted][api.type.Video.isMuted]</p>

<p class="index">[object:load()][api.type.Video.load]</p>

<p class="index">[object:pause()][api.type.Video.pause]</p>

<p class="index">[object:play()][api.type.Video.play]</p>

<p class="index">[object:seek()][api.type.Video.seek]</p>

<p class="index">[object.totalTime][api.type.Video.totalTime]</p>


#### [WebView][api.type.WebView]

<p class="index">[object:back()][api.type.WebView.back]</p>

<p class="index">[object.canGoBack][api.type.WebView.canGoBack]</p>

<p class="index">[object.canGoForward][api.type.WebView.canGoForward]</p>

<p class="index">[object:deleteCookies()][api.type.WebView.deleteCookies]</p>

<p class="index">[object:forward()][api.type.WebView.forward]</p>

<p class="index">[object.hasBackground][api.type.WebView.hasBackground]</p>

<p class="index">[object:reload()][api.type.WebView.reload]</p>

<p class="index">[object:request()][api.type.WebView.request]</p>

<p class="index">[object:stop()][api.type.WebView.stop]</p>


## 
