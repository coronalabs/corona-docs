#!/usr/bin/env lua

--[[-------------------------------------------------------------------------------

# build.lua

Build script for mirroring markdown directory to html directory, appending reference
links to markdown files, and converting markdown source files to html.

## Requirements:

- Lua 5.1
- LuaFileSystem 1.5.0
- Pandoc 1.9


### External Resources:

- Lua: http://lua.org
- LuaFileSystem: https://lunarmodules.github.io/luafilesystem/
- Pandoc: http://johnmacfarlane.net/pandoc/

- LuaFileSystem(old link): http://keplerproject.github.com/luafilesystem/

## USAGE:

build.lua [-c/--clean] [revision label] [revision_base_url]


Default: build only modified files.
	./build.lua

Clean build:
	./build.lua -c
	or
	./build.lua --clean

Set revision (will use REV_URL_BASE constant below as default base)
	./build.lua 2012.798
	or
	./build.lua -c 2012.798
	or
	./build.lua --clean 2012.798

Use custom revision base url:
	./build.lua 2012.798 http://www.coronadocs.com/
	or
	./build.lua -c 2012.796 http://www.coronadocs.com/
	or
	./build.lua --clean 2012.799 http://coronadocs.com/

---------------------------------------------------------------------------------]]
local startTime = os.time( )
local markdown_subdir = "markdown"
local markdown_dir = "../markdown"
local markdown_images_subdir = "markdown/images"
local markdown_images_dir = "../" .. markdown_images_subdir
local html_dir = "../html"
local resources_subdir = "resources"
local nav_file = "../resources/nav.markdown"
local css_file = "../resources/css/style.css"
local css_file_sh = "../resources/css/shCoreDefault.css"
local output_css_path = html_dir .. "/css"
local images_dir = "../resources/images"
local output_images_dir = html_dir .. "/images"

-- strings to substitute throughout docs content (not headers or footers though)
local title_prefix = "Solar2D Documentation"
local default_rev_label = "Release 2024.3703"
local REV_LABEL = default_rev_label

local CORONA_CORE_PRODUCT = "Solar2D"
local CORONA_NATIVE_PRODUCT = "Solar2D Native"
local CORONA_CARDS_PRODUCT = "CoronaCards"

-- Do NOT directly reference DEFAULT_REV_URL and REV_URL_BASE variables in docs. 
-- To reference DEFAULT_REV_URL and REV_URL_BASE in the docs, use REVISION_URL.
-- Editing DEFAULT_REV_URL and REV_URL_BASE would change REVISION_URL.
local DEFAULT_REV_URL = "https://solar2d.com/download/"
local REV_URL_BASE = "https://solar2d.com/download/"  -- don't forget the trailing slash '/'

-- Do NOT directly reference SOLAR_LINK_PLUGINS and SOLAR_LINK_PLAYGROUND variables in docs.
-- To reference SOLAR_LINK_PLUGINS and SOLAR_LINK_PLAYGROUND in the docs, use PLUGINS_DIR and SOLAR_PLAY respectively.
-- Editing SOLAR_LINK_PLUGINS and SOLAR_LINK_PLAYGROUND would change PLUGINS_DIR and SOLAR_PLAY respectively.
local SOLAR_LINK_PLUGINS = "https://plugins.solar2d.com/"
local SOLAR_LINK_PLAYGROUND = "https://playground.solar2d.com/"


require "lfs"
require "pl.init"
local aliases = require "aliases"
local math_ceil = math.ceil
local string_gsub = string.gsub
local string_sub = string.sub
local string_find = string.find

-- cached penlight functions
local normpath = path.normpath
local abspath = path.abspath
local copyfile = dir.copyfile
local rmtree = dir.rmtree
local clonetree = dir.clonetree
local makepath = dir.makepath
local dirtree = dir.dirtree
local getallfiles = dir.getallfiles
local splitext = path.splitext
local pbasename = path.basename
local pdirname = path.dirname
local lastmod = file.modified_time

-- get absolute path to script root
local script_root = normpath( abspath( "." ) )
script_root = string_sub( script_root, 1, #script_root-1 )

-- detect if 'clean' flag is specified (in which case a full rebuild will happen)
local flags, args = app.parse_args()
local is_clean_build = flags["c"] or flags["clean"]

-- check to see if a revision label and url was specified
if #args == 1 then
	REV_LABEL = args[1]
	if not tonumber(string.sub( args[1], 1, 1 )) then
		REV_URL_BASE = "#"
	end

elseif #args == 2 then
	REV_LABEL = args[1]
	REV_URL_BASE = args[2]

else
	-- no revision label and url specified
	REV_URL_BASE = "#"
end

print( "Building docs for: " .. REV_LABEL )
local currentPublicBuildYear, currentPublicBuild = string.match( default_rev_label, "(%d+)%.(%d+)" )

--
-- UTIL FUNCTIONS
--

-- generic string-splitting function
local function split(self, sep)
	local sep, fields = sep or ":", {}
	local pattern = string.format("([^%s]+)", sep)
	self:gsub(pattern, function(c) fields[#fields+1] = c end)
	return fields
end

-- url-encode a string
local function url_encode(str)
  if (str) then
    str = string_gsub (str, "\n", "\r\n")
    str = string_gsub (str, "([^%w ])",
        function (c) return string.format ("%%%02X", string.byte(c)) end)
    str = string_gsub (str, " ", "+")
  end
  return str
end

-- Get relative url string to 'absolute' from 'current'
local function getRelPath(absolute, current)
	if absolute == "/" or current == "/" then return end

	local basesegs = split(current:sub(2), "/")
	local oldsegs = split(absolute:sub(2), "/")

	if oldsegs[1] ~= basesegs[1] then return end

	table.remove(basesegs)

	while #oldsegs > 1 and #basesegs > 0 and oldsegs[1] == basesegs[1] do
		table.remove(oldsegs, 1)
		table.remove(basesegs, 1)
	end

	local path_naked = true
	local newpath = ""
	while #basesegs > 0 do
		table.remove(basesegs, 1)
		newpath = newpath .. "../"
		path_naked = false
	end

	if path_naked and #oldsegs == 1 and oldsegs[1] == "" then
		newpath = "./"
		table.remove(oldsegs)
	end

	while #oldsegs > 0 do
		if path_naked then
			if oldsegs[1]:find(":") then
				newpath = newpath .. "./"
			elseif #oldsegs > 1 and oldsegs[1] == "" and oldsegs[2] == "" then
				newpath = newpath .. "/."
			end
		end

		newpath = newpath .. oldsegs[1]
		path_naked = false
		table.remove(oldsegs, 1)
		if #oldsegs > 0 then newpath = newpath .. "/" end
	end

	return newpath
end

print( "Generating new API index...")
-- Generate new API index
local buildindex_script = script_root .. "buildindex.lua"
local api_dir = script_root .. markdown_dir .. "/api" 
local command = '"' .. buildindex_script .. '" "' .. api_dir .. '"'
utils.execute("lua " .. command )
print( "\tDone.")

--
-- Create tmp directories
-- And copy markdown_dir to tmp_dir
--
local tmp_dir = '../tmp'
local tmp_markdown_dir = tmp_dir .. "/" .. markdown_subdir
local tmp_resources_dir = tmp_dir .. "/" .. resources_subdir
local tmp_markdown_images_dir = tmp_dir .. "/" .. markdown_images_subdir

-- remove current tmp dir (in case it already exists)
print( "Removing temporary folder...")
rmtree( tmp_dir )



print( "Creating temporary folder at: " .. normpath( abspath( tmp_dir ) ) )

print( "Cloning tree...")
-- copy markdown folder to temp folder
utils.execute("mkdir -p \"" .. tmp_dir .. "\"")
utils.execute("cp -rf \"" .. markdown_dir .. "\" \"" .. tmp_markdown_dir .. "\"")
print( "\tDone.")


--
-- HTML OUTPUT PREP
-- Create output html directory and copy css and images into it
--

-- remove current html folder and recreate it with css folder
if is_clean_build then print("Cleaning ..."); rmtree( html_dir ); end

-- copy css file to css folder
makepath( output_css_path )
copyfile( css_file, output_css_path .. "/style.css" )
copyfile( css_file_sh, output_css_path .. "/shCoreDefault.css" )

print( "Copied stylesheet.\n" )

-- copy all images
print( "Copying images.\n" )

local src = normpath( abspath( markdown_images_dir ) )

utils.execute('rsync -a --exclude ".*" "' .. src .. '/" "' .. output_images_dir .. '"')


print( "\tDone.")


--
-- CUSTOMIZATION
-- Append reference links to all markdown files
-- And then generate HTML using Pandoc
--

-- open JSON file that holds timestamps of last modified files
local last_build_date
if path.exists( ".lastbuild.log" ) then
	local fh = io.open( ".lastbuild.log", "r" )
	local df = Date.Format( "yyyy-mm-dd HH:MM:SS" )
	last_build_date = df:parse( fh:read( "*a" ) )
	io.close( fh ); fh = nil
end

-- For each markdown file, loop through all other files and append reference links
local original_markdown = getallfiles( markdown_dir, "*.markdown" )
local markdown_files = getallfiles( tmp_markdown_dir, "*.markdown" )

-- Determine image files (ignore .hg hidden directory)
local markdown_images_files = {}
local pngFiles = getallfiles( tmp_markdown_images_dir, "*.png" )
for i=1,#pngFiles do
	local f = pngFiles[i]
	if nil == string_find( f, ".hg", 1, true ) then
		table.insert( markdown_images_files, f )
	end
end

local file_count = 0

local refLinkFiles = {}
local newPrefixCache = {}

-- create tmp_resources_dir
makepath( tmp_resources_dir )
local tmp_nav_path = tmp_resources_dir .. "/nav.markdown"
local tmp_bodyPrefix = tmp_resources_dir .. "/bodyPrefix.html"
local tmp_nav_html_path = tmp_resources_dir .. "/nav.html"
local tmp_pandoctemplate_path = tmp_resources_dir .. "/main.html"
local real_pandoc_template_path = tmp_resources_dir .. "/main"
local tmp_footer_path = tmp_resources_dir .. "/footer.html"
local full_css_path = normpath(abspath(tmp_markdown_dir .. "/css/style.css"))
local full_css_SH_path = normpath(abspath(tmp_markdown_dir .. "/css/shCoreDefault.css"))
local pandoc = "pandoc -f markdown -t html -o " .. tmp_nav_html_path .. " " .. tmp_nav_path
local crumb_mdPerm = "<div id=\"breadcrumb\">" .. "[Documentation](https://docs.coronalabs.com)"
--local crumb_mdPerm = "<div id='breadcrumb'><a href='https://docs.coronalabs.com'><img class='bchome' src='../../../images/bchome.png' title=''></a>"
--local crumb_mdPerm = "<div id='breadcrumb'>"

copyfile( "../resources/bodyPrefix.html", tmp_bodyPrefix )
local prefixhandle = io.open( normpath(abspath( tmp_bodyPrefix )), "r" )
local prefixHTMLPerm = prefixhandle:read( "*a" )
io.close( prefixhandle )

-- save new temporary main.html file (pandoc template)
copyfile( "../resources/main.html", tmp_pandoctemplate_path )
local full_pandoctemplate_path = normpath(abspath( tmp_pandoctemplate_path ))
local fh = io.open( full_pandoctemplate_path, "r" )
local mainHTMLPerm = fh:read( "*a" )
io.close( fh )

-- read ATS override template file
local fh = io.open( normpath(abspath( "../resources/ats.html" ) ), "r" )
local templateATS = fh:read( "*a" )
io.close( fh )

-- copy footer html file to tmp folder, open, and store in variable
copyfile( "../resources/footer.html", tmp_footer_path )
local fh = io.open( normpath(abspath( tmp_footer_path ) ), "r" )
local footerHTMLPerm = fh:read( "*a" )
io.close( fh )

-- local function genRelPaths(pathFrom, pathTo, tmp_markdown_dir, extension)
-- 	-- pathFrom and pathTo are normalized absolute paths
-- 	local relpath = getRelPath( pathFrom, pathTo )
-- 	if not extension then
-- 		extension = ".html"
-- 	end

-- 	local ext_relpath = pathFrom:sub(pathTo:len() + 2)
-- 	ext_relpath = splitext( ext_relpath ) .. extension

-- 	local path2noext = splitext(pathFrom)
-- 	if pbasename( path2noext ) == "index" then
-- 		path2noext = pdirname( path2noext )
-- 	end
-- 	local startBase, endBase = string_find( pathFrom, tmp_markdown_dir )
-- 	local path2base = string_sub( path2noext, endBase+2 )
-- 	local refName = string_gsub( path2base, "/", "." )
-- 	local refLink = "[" .. refName .. "]: "

-- 	return refLink, ext_relpath
-- end

-- local refLinkTable = {}

-- Creates a table which has the relative path from the root dir to every markdown/image file
-- Later this table is used to generate links from every file to every other file
-- local function genRefLinkTable(t)
-- 	local refLinkTable = t
-- 	for j=1,#markdown_files do
-- 		local path2 = normpath( abspath( markdown_files[j] ) )
-- 		local refLink, relPath = genRelPaths( path2, normpath( abspath(tmp_markdown_dir)), tmp_markdown_dir )
-- 		refLinkTable[refLink] = relPath
-- 	end

-- 	for j=1,#markdown_images_files do
-- 		local path2 = normpath( abspath( markdown_images_files[j] ) )
-- 		local refLink, relPath = genRelPaths( path2, normpath( abspath(tmp_markdown_dir)), tmp_markdown_dir, ".png" )
-- 		refLinkTable[refLink] = relPath
-- 	end
-- end

-- genRefLinkTable(refLinkTable)

-- This table will contain the info needed to create the navigation links.  It has the relative path from the root dir to every file at this stage.
-- local stringBuffer = {}
-- local prevV = nil
-- for k, v in pairs(refLinkTable) do
-- 	if prevV then
-- 		table.insert( stringBuffer, prevV .. "\n" .. k )
-- 	else
-- 		table.insert( stringBuffer, "\n\n\n" .. k )
-- 	end
-- 	prevV = v
-- end
-- table.insert( stringBuffer, prevV )

local pandocCommands = {}

for i=1,#markdown_files do
	local original_path = normpath( abspath( original_markdown[i] ) )
	local path1 = normpath( abspath( markdown_files[i] ) )
	local last_mod_date = lastmod( original_path )
	local page_title = ""
	local page_description = "Solar2D lets you build games/apps for all major platforms including iOS, Android, Kindle, Apple TV, Android TV, macOS, and Windows. Get the free toolset!"

	-- only build the file if the last modified date is greater than last time build script was run
	if is_clean_build or (not last_build_date) or (last_build_date:__lt( Date(last_mod_date) )) then
		file_count = file_count + 1

		-- construct breadcrumb div and corresponding markdown (with reference links)
		local crumb_path = markdown_files[i]:sub( 17, -10 )
		crumb_path = utils.split( crumb_path, "/" )
		local crumb_md = crumb_mdPerm 
		for i=1,#crumb_path do
			local page = crumb_path[i]
			if page ~= "index" then
				-- convert 'page' to corresponding alias
				for i=1,#aliases do
					if page == aliases[i].real then
						-- check for exceptions to alias override
						local skipAlias = false
						if ( crumb_path[1] == "api" and (  --indicates this is in the "/api/" root directory
								page == "native" or  --native.* (library)
								page == "system" or  --system.* (library)
								page == "physics" or  --physics.* (library)
								page == "media" or  --media.* (library)
								page == "graphics" or  --graphics.* (library)
								page == "system" or  --system.* (library)
								page == "type"
								)
							) then skipAlias = true; end
						if ( crumb_path[1] == "plugin" and ( page == "library" or page == "type" or page == "data" or page == "event" ) ) then
							skipAlias = true
						end
						-- if no exception, use the alias
						if skipAlias == false then
							page = aliases[i].shown
						end
						break
					end
				end

				-- construct the rest of the breadcrumb markdown reference link
				local mdlink = ""
				local mdindex = i
				if crumb_path[mdindex] == "index" then mdindex = i-1; end
				for j=1,mdindex do
					mdlink = mdlink .. crumb_path[j]
					if j ~= mdindex then
						mdlink = mdlink .. "."
					end
				end
				if	(	-- the following conditional cases omit that breadcrumb element
						-- mdindex is the breadcrumb item index after the static left-most Docs link
						-- crumb_path[x] represents the directory at that point, i.e. any of these three: api/library/composer
						-- 1) this omits any breadcrumb bits beyond mdindex of 2 for Guides or Tutorials
						( mdindex > 2 and ( crumb_path[1] == "guide" or crumb_path[1] == "tutorial" ) ) or
						-- 2) this omits the breadcrumb bit for the nested event folder within any plugin directory
						( mdindex == 3 and crumb_path[1] == "plugin" and crumb_path[3] == "event" ) or
						( mdindex == 4 and crumb_path[1] == "plugin" and crumb_path[4] == "event" ) or
						( mdindex == 5 and crumb_path[1] == "plugin" and crumb_path[5] == "event" ) or
						-- 3) this omits the breadcrumb bit for the nested event folder within any API directory
						( mdindex == 4 and crumb_path[1] == "api" and crumb_path[4] == "event" ) or
						-- 4) this omits the breadcrumb bit for the nested type folder within any plugin directory
						( mdindex == 3 and crumb_path[1] == "plugin" and crumb_path[3] == "type" ) or
						( mdindex == 4 and crumb_path[1] == "plugin" and crumb_path[4] == "type" ) or
						-- 5) this omits the breadcrumb title for nested guides within any plugin directory
						( mdindex == 4 and crumb_path[1] == "plugin" and crumb_path[3] == "guide" )
					) then  -- (do nothing)
				else
					mdlink = "[" .. page .. "][" .. mdlink .. "] "
					--if ( mdindex == 1 ) then
					--	crumb_md = crumb_md .. mdlink
					--else
						crumb_md = crumb_md .. " &nbsp;&#9656;&nbsp; " .. mdlink
					--end
					page_title = page_title .. " | " .. page
				end
				-- if i ~= #crumb_path then
				--	if crumb_path[i+1] ~= "index" then
				--		crumb_md = crumb_md .. "&nbsp;&#9656;&nbsp; "
				--	end
				-- end
				--end
			end
		end
		crumb_md = crumb_md .. "</div>"
		print( "Writing: " .. markdown_files[i]:sub( 16, -10 ) .. ".html" )

		-- get "last modified" string from original markdown file (not the temp one, which has inaccurate last mod date)
		local formatted_date = os.date( "%d-%b-%Y", last_mod_date)
		local modified_date = "(Last updated: " .. formatted_date .. ")"

		local refLinkPath = pdirname( path1 )

		-- local refAppend = refLinkFiles[refLinkPath]
		-- if nil == refAppend then

		-- 	local relPath = getRelPath(normpath( abspath(tmp_markdown_dir)), path1)

		-- 	-- remove the "../markdown"
		-- 	relPath = relPath:sub(0, relPath:len() - 11)

		-- 	-- Appends the path from the current markdown file to the root dir to the root dir to markdown table
		-- 	refAppend = table.concat( stringBuffer, relPath )
		-- 	refLinkFiles[refLinkPath] = refAppend
		-- end
		
		local newPrefix = newPrefixCache[refLinkPath]
		if nil == newPrefix then
			local prefixHTML = prefixHTMLPerm

			-- copy nav.markdown to temporary resources folder, store contents in variable
			copyfile( nav_file, tmp_nav_path )
			utils.execute( "\"" .. script_root .. "genRefLinks.sh\" \"" .. tmp_nav_path .. "\" \"" .. path1 .. "\"" )
			assert(utils.execute( "pandoc -f markdown -t html -o " .. tmp_nav_html_path .. " " .. tmp_nav_path ))
			local navhandle = io.open( normpath( abspath( tmp_nav_html_path ) ), "r" )
			local navHTML = navhandle:read( "*a" )
			io.close( navhandle ); navhandle = nil

			-- replace template tag with navHTMl contents
			newPrefix = string_gsub( prefixHTML, "NAV_LINKS", navHTML )

			newPrefixCache[refLinkPath] = newPrefix
		end

		-- create page title (to be used in header)
		page_title = string_gsub( page_title, "|", "—", 1 )
		page_title = title_prefix .. page_title

		-- replace title and meta tag template text in main.html (pandoc template) with proper page title
		local function main_template_replacements( w )
			if w == "PAGE_TITLE" then
				return page_title
			elseif w == "DATE_REVISED" then
				return formatted_date
			elseif w == "PAGE_DESCRIPTION" then
				return page_description
			end
		end
		local mainHTML = string_gsub( mainHTMLPerm, "%u+_%u+", main_template_replacements )

		local fh = io.open( splitext( full_pandoctemplate_path ) .. i .. ".html", "w+" )
		fh:write( mainHTML )
		io.close( fh )

		-- save new temporary bodyPrefix.html file
		local prefixhandle = io.open( normpath(abspath( splitext ( tmp_bodyPrefix ) .. i .. ".html" )), "w+" )
		prefixhandle:write( newPrefix )
		io.close( prefixhandle ); prefixhandle = nil

		-- replace footer template tags
		local function footer_replacements( w )
			if w == "LAST_MODIFIED" then
				return modified_date
			elseif w == "API_LINK" then
				local api_link_page = string_sub( string_gsub( markdown_files[i]:sub( 16, -10 ), "/", "." ), 2 )
				return api_link_page
			elseif w == "REVISION_LABEL" then
				local footer_rev_label = REV_LABEL
				if REV_LABEL == default_rev_label then footer_rev_label = url_encode( REV_LABEL ); end
				return footer_rev_label
			end
		end
		local footerHTML = string_gsub( footerHTMLPerm, "%u+_%u+", footer_replacements )
		
		-- open actual markdown file and read it into a 'content' variable
		local fh = io.open( path1, "r" )
		local content = fh:read( "*a" )
		io.close( fh )

		-- replace various constant strings with defined/default values
		local function content_replacements( w )
			if w == "REVISION_LABEL" then
				return REV_LABEL
			elseif w == "REVISION_URL" then
				if REV_URL_BASE ~= '#' then
					return REV_URL_BASE .. string_gsub( REV_LABEL, "%.", "/" )
				else
					return DEFAULT_REV_URL
				end
			elseif w == "CORONA_CORE_PRODUCT" then
				return CORONA_CORE_PRODUCT
			elseif w == "CORONA_NATIVE_PRODUCT" then
				return CORONA_NATIVE_PRODUCT
			elseif w == "CORONA_CARDS_PRODUCT" then
				return CORONA_CARDS_PRODUCT
			elseif w == "PLUGINS_DIR" then
				return SOLAR_LINK_PLUGINS
			elseif w == "SOLAR_PLAY" then
				return SOLAR_LINK_PLAYGROUND
			elseif w == "CURRENT_RELEASE" then
				return string_sub( default_rev_label, -9, -1 )
			elseif w == "TEMPLATE_ATS" then
				return templateATS
			end
		end
		content = string_gsub( content, "[%u_]+", content_replacements )

		-- find daily build notes and substitute in content from '/resources/buildNotes/*.markdown' file
		for buildNoteYear, buildNoteID in string.gmatch( content, "DAILY_BUILD_NOTE_(%d+)%.([%d\%_]+)" ) do
			-- only render notes that apply to a daily build later than the current public release
			if ( currentPublicBuild and tonumber(string_sub(buildNoteID,1,4)) > tonumber(currentPublicBuild) ) then
				-- get the path of the template file to read from
				local buildNoteTemplatePath = "../resources/buildNotes/" .. buildNoteYear .. "_" .. buildNoteID .. ".markdown"
				local fh = io.open( buildNoteTemplatePath, "r" )
				if fh then
					local templateFile = fh:read( "*a" )
					if templateFile then
						-- prefix template content with surrounding CSS code
						local templateContent = '<div class="docs-tip-outer docs-tip-color-orange"><div class="docs-tip-inner-left"><div class="fa fa-clock-o" style="font-size: 38px; padding-top: 2px;"></div></div><div class="docs-tip-inner-right">'
						-- append additional note on which is the current public release
						if ( currentPublicBuild and currentPublicBuildYear and buildNoteID ~= "9999" ) then
							templateContent = templateContent .. "The current public release is <strong>" .. currentPublicBuildYear .. "." .. currentPublicBuild .. "</strong>. "
						end
						-- append template content and closing CSS code
						templateContent = templateContent .. templateFile .. '</div></div>'
						-- substitute above string in place of Markdown placeholder
						content = string_gsub( content, "DAILY_BUILD_NOTE_" .. buildNoteYear .. "." .. buildNoteID, templateContent )
						templateFile = nil
					end
					io.close( fh )
				else
					-- if there was a file error, substitute empty string in place of Markdown placeholder
					content = string_gsub( content, "DAILY_BUILD_NOTE_" .. buildNoteYear .. "." .. buildNoteID, "" )
				end
				fh = nil
			else
				-- if the note applied to a build equal to or older than current public release, substitute empty string in place of Markdown placeholder
				content = string_gsub( content, "DAILY_BUILD_NOTE_" .. buildNoteYear .. "." .. buildNoteID, "" )
			end
		end

		-- add breadcrumb markdown to beginning and append footer/reference links md to end of file
		fh = io.open( path1, "w+" )
		content = "\n" .. crumb_md .. "\n" .. content
		fh:write( content .. "\n\n" .. footerHTML )
		io.close( fh ); fh = nil
		
		local startBase, endBase = string_find( path1, tmp_markdown_dir )
		local path1dirname = pdirname( string_sub( path1, endBase+2 ) )
		
		-- create html path if it doesn't exist
		makepath( html_dir .. "/" .. path1dirname )
		
		-- get path to html file that will be outputted by pandoc
		local html_filename = pbasename( splitext(path1) )
		local full_html_path = normpath( abspath( html_dir .. "/" .. path1dirname .. "/" .. html_filename .. ".html" ) )

		-- remove the file (if it currently exists)
		file.delete( full_html_path )
		
		-- get relative path to css file
		local relative_css_path = getRelPath( full_css_path, path1 )
		local relative_css_SH_path = getRelPath( full_css_SH_path, path1 )

		-- Map relative links in markdown file.
		utils.execute( "\"" .. script_root .. "genRefLinks.sh\" \"" .. path1 .. "\"" )
		
		-- Run pandoc command on the markdown file
		local pandoc = "pandoc -f markdown -t html -o '" .. full_html_path .. "' '" .. path1 .. "'"
			.. " --section-divs"
			.. " --css " .. relative_css_path
			.. " --css " .. relative_css_SH_path
			.. " --toc"
			.. " --toc-depth=6"
			.. " --template=" .. real_pandoc_template_path .. i
			.. " --include-before-body '" .. script_root .. splitext ( tmp_bodyPrefix ) .. i .. ".html" .. "'"
			.. " --include-after-body '" .. script_root .. "../resources/bodySuffix.html'"
			.. " --no-highlight"
			.. " --filter '" .. script_root .. "filter-SyntaxHighlighter.py'"
			.. " || exit 255"

		table.insert( pandocCommands, pandoc )

		-- utils.execute( pandoc )
		pandoc = nil
	end

	-- local percent_completed = math_ceil((i/#markdown_files)*100)
	-- print( "PROGRESS:" .. percent_completed )
end

local execute = normpath(abspath( tmp_resources_dir .. "/execute" ))
local handle = io.open( execute, "w+")
handle:write( table.concat( pandocCommands, "\0" ) )
io.close( handle )

utils.execute("cat '" .. execute .. "' | xargs -n1 -P8 -0 bash -c")
-- write last modified date to file
local fh = io.open( ".lastbuild.log", "w" )
fh:write( Date():__tostring() )
io.close( fh )

for src in dirtree(markdown_dir) do
    if path.isdir(src) and pbasename(src) == "html" then
        local srcNormalized = normpath(abspath(src))
        local p1 = srcNormalized
        local p2 = normpath(abspath(markdown_dir))

        -- Ensure p2 is a prefix of p1
        local _, i = string.find(p1, p2, 1, true)
        if not i then
            print("Error: markdown_dir is not a prefix of the current path:", p1)
        else
            -- Compute relative path
            local relPath = string.sub(p1, i + 1)
            local dstNormalized = normpath(abspath(html_dir .. relPath))

            -- Remove trailing 'html'
            dstNormalized = pdirname(dstNormalized)

            print("Copying from", srcNormalized, "to", dstNormalized)
            local success, _, code = os.execute('cp -rf "' .. srcNormalized .. '" "' .. dstNormalized .. '"')
            if not success then
                print("Error copying directory:", srcNormalized, "to", dstNormalized, "Error code:", code)
            end
        end
    end
end


--
-- Cleanup
-- (Disable cleanup to debug)
--
rmtree( tmp_dir )

if file_count == 0 then
	print( "No changes found. Use --clean to perform complete rebuild.\n" )
else
	if file_count == 1 then
		print( "\n" .. file_count .. " page constructed." )
	else
		print( "\n" .. file_count .. " pages constructed." )
	end
end
print( "Temporary directory removed." )
print( "Build complete. Took: " .. ( os.time() - startTime ) )

print( "\n" .. "View docs with: open " .. normpath( abspath( html_dir )) .. "/index.html" )
