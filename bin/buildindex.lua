#!/usr/bin/env lua
--#!/opt/local/bin/lua

local arg = arg

local shouldRecurse
local srcDir

for i,v in ipairs( arg ) do
	if ( "-r" == v ) then
		shouldRecurse = true
	else
		srcDir = v
	end
end

local lfs = require "lfs"
require "pl.init"

-- cached penlight functions
local normpath = path.normpath
local abspath = path.abspath
local copyfile = dir.copyfile
local rmtree = dir.rmtree
local clonetree = dir.clonetree
local makepath = dir.makepath
local dirtree = dir.dirtree
local getdirectories = dir.getdirectories
local getallfiles = dir.getallfiles
local splitext = path.splitext
local pbasename = path.basename
local pdirname = path.dirname
local lastmod = file.modified_time

local function emitMarkdown( baseDir, srcDir, dstFile )
	if ( not dstFile ) then
		dstFile = io.stdout
	end

	local files = getallfiles( srcDir )

	function string.startsWith( str, start )
		return string.sub( str, 1, string.len( start )) == start
	end

	function string.endsWith(str,End)
	   return End=='' or string.sub(str,-string.len(End))==End
	end

	function string.removePrefix( str, prefix )
		local _, last = string.find( str, prefix, 1, true )
		return string.sub( str, last + 1 )
	end

	local linkEntries = {}
	for i=1,#files do
		local path = files[i]
		local basename = pbasename( path )
		if ( not string.startsWith( basename, '.' ) 
				and not string.endsWith( basename, ".orig" ) ) then
			local src = io.open( path, "r" )

			local line
			repeat
				line = src:read()
				if ( not line ) then
					break
				end
			until ( '' ~= line and nil ~= string.match( line, "%s*") )

			if ( line ) then
				local str = string.match( line, "# (.*)" )
				if ( str ) then
					path = normpath(abspath( path ))
					local relpath = string.removePrefix( path, baseDir )
					local link = string.gsub( relpath, '/', '.' )
					local isIndex = nil ~= string.find( link, "%.index%.markdown" )
					link = string.gsub( link, "%.index%.markdown", '' )
					link = string.gsub( link, "%.markdown", '' )
					local _,count = string.gsub( link, '%.', '.' )
					link = string.format( "[%s][api%s]", str, link )

					relpath = string.gsub( relpath, "index%.markdown", '' )
					local entry = { link=link, isIndex=isIndex, relpath=relpath, count=count }
					table.insert( linkEntries, entry )
				end
			end

			src:close()
		end
	end

	table.sort( linkEntries, function( a, b )
		return (a.relpath < b.relpath)
	end )

	for i=1,#linkEntries do
		local entry = linkEntries[i]
		local link = entry.link
		local count = entry.count

		-- local prefix = '  '
		local prefix = '<p class="index">' -- '> ' --"&nbsp;&nbsp; "
		local suffix = '</p>'
		local padline = false
		if ( 1 == count ) then
			prefix = "## "
			suffix = ''
			padline = true
		elseif ( 2 == count ) then
			prefix = "#### "
			suffix = ''
			padline = true
		end

--print( entry.count, prefix .. link )
		if ( padline ) then
			--print()
			dstFile:write( "\n" )
		end
		local line = prefix .. link .. suffix
--print( line )
		dstFile:write(  line .. "\n" )
		dstFile:write( "\n" )

	end
end

-- Sort subdirectories: Library, Event, Type
srcDir = normpath(abspath( srcDir ))
local subDirs = getdirectories( srcDir )

local order = {
	["event.library"] = false,
	["library.event"] = true,
}
table.sort( subDirs, function( a, b ) 
	a = pbasename( a )
	b = pbasename( b )
	local result = order[ a .. "." .. b ]
	if ( nil == result ) then
		result = a < b
	end
	return result
end )

local dstFile = io.open( srcDir .. "/index.markdown" , "w")
local headerFile = io.open( srcDir .. "/indexHeader.markdown", "r" )
local footerFile = io.open( srcDir .. "/indexFooter.markdown", "r" )

dstFile:write( "<!-- ################################################## -->\n" )
dstFile:write( "<!-- GENERATED FILE - DO NOT EDIT - EDITS WILL BE LOST! -->\n" )
dstFile:write( "<!-- ################################################## -->\n\n" )

dstFile:write( headerFile:read( "*a" ) )

for i=1,#subDirs do

--	print( subDirs[i] )
--	print( srcDir, subDirs[i], dstFile )
	emitMarkdown( srcDir, subDirs[i], dstFile )
end

dstFile:write( footerFile:read( "*a" ) )

footerFile:close()
headerFile:close()
dstFile:close()

