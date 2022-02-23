# onDemandResources.request()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          on-demand resources, onDemandResources, request
> __See also__          [onDemandResources.setEventListener()][plugin.onDemandResources.setEventListener]
>						[onDemandResources.*][plugin.onDemandResources]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

This is the core function of the plugin. Calling it initiates a request to access <nobr>on-demand</nobr> resources configured within `build.settings`.

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

* Resources must be available before you attempt to use them. This function can both check the availability of resources __or__ download them. If the desired resources are not available, you should request their download and wait for a successful callback response before attempting to use them.

* Once resources are successfully requested and downloaded, they can be safely accessed until the application is terminated.

* Even though you can use <nobr>on-demand</nobr> resources as if they exist in your app's bundle, they are not physically there. Use [system.pathForFile()][api.library.system.pathForFile] to retrieve the actual path, or alternatively the convenience function [onDemandResources.path()][plugin.onDemandResources.path]. This may be necessary when, for example, an <nobr>on-demand</nobr> resource is a text file <nobr>(not an image)</nobr> and [io.open()][api.library.io.open] is required to open the file and read its contents ([guide][guide.data.readWriteFiles]).

</div>

<div class="guide-notebox">
<div class="notebox-title">Note</div>

Remember that <nobr>on-demand</nobr> resources requests are designed to work in the background, so you can request multiple resources at logical times within the app flow. For example, if a player is progressing through a game tutorial, you may request resources required for further instruction sometime in advance of using them, not just directly before you intend to use them.

</div>


## Syntax

	onDemandResources.request( tag [, download] [, listener] )

##### tag ~^(required)^~
_[String][api.type.String]._ Tag for which to request <nobr>on-demand</nobr> resources.

##### download ~^(optional)^~
_[Boolean][api.type.Boolean]._ Indicates if downloading of the resource(s) should begin if they are not locally available. Default value is `true`. If you simply want to check if the associated resources are locally available, pass `false` and this function will invoke an <nobr>on-demand</nobr> resources [event][plugin.onDemandResources.event.onDemandResourcesEvent] almost immediately.

##### listener ~^(optional)^~
_[Listener][api.type.Listener]._ Listener function that will receive an <nobr>on-demand</nobr> resources [event][plugin.onDemandResources.event.onDemandResourcesEvent] when the resources are accessible, or if an error occurs. This listener will only receive events specifically associated with this request &mdash; if you wish to set up a broader listener function to handle general <nobr>on-demand</nobr> resources calls, use [onDemandResources.setEventListener()][plugin.onDemandResources.setEventListener].


## Examples

##### Check Resources

``````lua
local odr = require( "plugin.onDemandResources" )

-- On-demand resources listener function
local function odrListener( event )
	if ( event .isError ) then
		-- Resources are not downloaded; see next example for download usage
	end
end

-- Check image resources for second level
odr.request( "imgL2", false, odrListener )  -- Pass 'false' as second argument to check (not download)
``````

##### Download Resources

``````lua
local odr = require( "plugin.onDemandResources" )

-- On-demand resources listener function
local function odrListener( event )

	if not ( event.isError ) then
		print( "Resources for tag '" .. event.tag .. "' downloaded" )
	else
		print( "ERROR: errorCode = " .. tostring(event.errorCode) )
	end
end

-- Request image resources for first level
odr.request( "imgL1", true, odrListener )
``````

##### Progress Indicator

``````lua
local odr = require( "plugin.onDemandResources" )
local composer = require( "composer" )
local widget = require( "widget" )

local levelTag = "assetsL1"
local levelScene = "level1"

-- This function will indicate progress via a widget and go to scene when done
local function downloadResources( tag )

	-- Create progress bar
	local progressBar = widget.newProgressView( { x=160, y=240, width=120, isAnimated=false } )
	progressBar:setProgress( 0 )

	-- Runtime listener to update progress bar
	local function updateProgress()
		progressBar:setProgress( odr.progress(tag) )
	end
	Runtime:addEventListener( "enterFrame", updateProgress )

	-- Now, download resources with "urgent" priority
	odr.request( tag, true,
		function( event )
			-- Remove progress bar
			Runtime:removeEventListener( "enterFrame", updateProgress )
			progressBar:removeSelf()
			progressBar = nil
			-- Proceed to level scene
			if not ( event.isError ) then
				composer.gotoScene( levelScene )
			end
		end )
	odr.setDownloadPriority( tag, "urgent" )
end

-- First, simply check if resources are already downloaded
odr.request( levelTag, false,
	function( event )
		if not ( event.isError ) then
			-- Resources already downloaded; proceed to level scene
			composer.gotoScene( levelScene )
		else
			-- Resources must be downloaded; call download function above
			downloadResources( levelTag )
		end
	end )
``````
