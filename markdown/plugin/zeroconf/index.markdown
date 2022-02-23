# zeroconf.*

> --------------------- ------------------------------------------------------------------------------------------
> __Type__				[Library][api.type.Library]
> __Revision__			[REVISION_LABEL](REVISION_URL)
> __Keywords__			ZeroConf, network
> __Platforms__			Android, iOS, macOS, Windows, tvOS
> --------------------- ------------------------------------------------------------------------------------------


## Overview

This plugin allows you to discover and publish services over a local network. It allows <nobr>cross-platform</nobr> implementation of <nobr>zero-configuration</nobr> systems based on [mDNS](https://en.wikipedia.org/wiki/Multicast_DNS) which can be utilized for local multiplayer or to synchronize data over WiFi.

<div class="guide-notebox">
<div class="notebox-title">Notes</div>

* Service discovery is available by default on all platforms except Windows. To use this plugin on Windows, [Bonjour](https://support.apple.com/bonjour) version&nbsp;3 or higher must be installed.

* You can use "Bonjour&nbsp;Browser" type software to verify if service discovery is functioning properly.

</div>


## Syntax

	local zeroconf = require( "plugin.zeroconf" )


## Functions

<div class="small-header">

Initialization

</div>

#### [zeroconf.init()][plugin.zeroconf.init]

<div class="small-header">

Service Publishing

</div>

#### [zeroconf.publish()][plugin.zeroconf.publish]
#### [zeroconf.unpublish()][plugin.zeroconf.unpublish]
#### [zeroconf.unpublishAll()][plugin.zeroconf.unpublishAll]

<div class="small-header">

Service Discovery

</div>

#### [zeroconf.browse()][plugin.zeroconf.browse]
#### [zeroconf.stopBrowse()][plugin.zeroconf.stopBrowse]
#### [zeroconf.stopBrowseAll()][plugin.zeroconf.stopBrowseAll]


## Events

#### [PluginZeroConfEvent][plugin.zeroconf.event.PluginZeroConfEvent]


## Project Settings

To use this plugin, add an entry into the `plugins` table of `build.settings`. When added, the build server will integrate the plugin during the build phase.

``````lua
settings =
{
	plugins =
	{
		["plugin.zeroconf"] =
		{
			publisherId = "com.coronalabs"
		},
	},
}
``````


## Example

``````lua
-- Publishes a service of type '_corona_test._tcp' and then starts discovery for the service

-- Require the plugin
local zeroconf = require( "plugin.zeroconf" )

-- Listener to be called for ZeroConf events
local function zeroconfListener( event )

	-- Service has been found
	if ( event.phase == "found" and not event.isError ) then

		print( "SERVICE FOUND" )
		print( "-------------" )

		if event.serviceName then
			print( "Service name: " .. event.serviceName )
		end

		if event.port then
			print( "Port: " .. tostring(event.port) )
		end

		if ( event.addresses and #event.addresses > 0 ) then
			print( "Service provider addresses:" )
			for i = 1,#event.addresses do
				print( "  " .. event.addresses[i] )
			end
		end

	-- Service has been lost!
	elseif event.phase == "lost" then

		print( "SERVICE LOST!" )
		print( "-------------" )

		if event.serviceName then
			print( "Service name: " .. event.serviceName )
		end
	end
end

-- Initialize listener
zeroconf.init( zeroconfListener )

-- Generate a service name
local serviceName = system.getInfo("name") .. " (" .. system.getInfo("platformName") .. ")"

-- Publish a service (make it discoverable over the network)
local service = zeroconf.publish( { port=2929, name=serviceName, type="_corona_test._tcp" } )

-- Start looking for published services
local browser = zeroconf.browse( { type="_corona_test._tcp" } )
``````


<!---

``````lua
-- require the plugin
local zeroconf = require("plugin.zeroconf")


-- Setup a table to add entries to

local json = require("json")
local widget = require('widget')


local function onRowRender( event )
	local row = event.row
	local w,h = row.contentWidth, row.contentHeight
	local params = row.params

	t = display.newText( {
		parent = row,
		y = h*0.30,
		x = h*0.5,
		text = params.name,
		font = native.systemFontBold,
		align = "left",
	} )
	t:setFillColor( {0,0,} )
	t:translate( t.width*0.5, 0 )

	t = display.newText( {
		parent = row,
		y = h*0.7,
		x = h*0.5,
		text = params.address,
		align = "left",
	} )
	t:setFillColor( {0,0,} )
	t:translate( t.width*0.5, 0 )

end

local serviceTable = widget.newTableView({
	onRowRender = onRowRender
})


-- This listener would be called when service is found (or lost)
function listener( event )
	print( json.prettify(event) ) -- print whole message for debug purposes
	-- when service is found, add it to a table
	if event.phase == 'found' and not event.isError then
		addr = ""
		if event.addresses and #event.addresses > 0 then
			if #addr > 0 then
				addr = addr .. "   "
			end
			addr = addr .. event.addresses[1] .. ":" .. event.port
		end
		if event.hostname and #event.hostname>0 then
			if #addr > 0 then
				addr = addr .. "   "
			end
			addr = addr .. event.hostname .. ":" .. event.port
		end
		serviceTable:insertRow( {
			rowHeight = 35,
			params = {
				name = event.serviceName,
				address = addr ,
			}
	} )
	-- when service is lost, try removing it from a table
	elseif event.phase == 'lost' then
		for i=1,serviceTable:getNumRows( ) do
			local row = serviceTable:getRowAtIndex( i )
			if row and row.params.name == event.serviceName then
				serviceTable:deleteRow( i )
				break;
			end
		end
	end
end

-- initialize listener
zeroconf.init( listener )

-- Generate a name for a service provider
local name = system.getInfo("name") .. " (".. system.getInfo("platform") .. " " .. system.getInfo("platformVersion") .. ")"

-- Publish a service (make it discoverable over the network)
local service = zeroconf.publish{ port=2929, name=name, type='_corona_test._tcp' }

-- Start looking for published services
local browser = zeroconf.browse{ type='_corona_test._tcp' }

``````

-->
