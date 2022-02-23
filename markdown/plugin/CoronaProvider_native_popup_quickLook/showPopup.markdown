# native.showPopup() &mdash; Quick Look

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [function][api.type.Function]
> __Library__           [native.*][plugin.CoronaProvider_native_popup_quickLook]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          native, showPopup, quick look, preview
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Displays the operating system's default popup window for previewing/viewing documents.


## Syntax

	native.showPopup( name, options )

##### name ~^(required)^~
_[String][api.type.String]._ The string name of the popup to be shown. For the Quick Look plugin, use `"quickLook"`.

##### options ~^(required)^~
_[Table][api.type.Table]._ A table that specifies the properties for the popup &mdash; see the next section for details.


## Options Reference

Valid properties in the `options` table include the following:

##### files ~^(required)^~
_[Table][api.type.Table]._ A table of sub-tables, each specifying a file to view. Within each <nobr>sub-table,</nobr> `filename` indicates the file and `baseDir` indicates the system directory [constant][api.type.Constant] in which the file resides.

<div class="code-indent" style="width:600px;">

``````lua
files = 
{
	{ filename="myFile.txt", baseDir=system.ResourceDirectory },
}
``````

</div>

##### startIndex ~^(optional)^~
_[Table][api.type.Table]._ The file index at which the preview will start. For instance, if you have two file <nobr>sub-tables</nobr> in the `files` table and you set this value to `2`, it will preview the second file first, as opposed to starting at the first file. Default is `1`, indicating the first file.

##### listener ~^(optional)^~
_[Function][api.type.Function]._ Listener function to be called when the popup is dismissed. This function is passed an `event` table which contains the following properties:

* `event.name` ([string][api.type.String]) &mdash; Value of `"popup"`.
* `event.type` ([string][api.type.String]) &mdash; Value of `"quickLook"`.
* `event.action` ([string][api.type.String]) &mdash; Value of `"done"`.
* `event.file` ([table][api.type.Table]) &mdash; File table of the last item previewed prior to dismissing.


## Example

``````lua
local function quickLookListener( event )
	print( event.name )    --"popup"
	print( event.type )    --"quickLook"
	print( event.action )  --"done"
	print( event.file )    --file table of last item previewed prior to dismissing, for example: { filename="myFile.txt", baseDir=system.ResourceDirectory }
end

-- Quick Look options
local quickLookOptions = 
{
	files =
	{
		{ filename="myPDF.pdf", baseDir=system.ResourceDirectory },
		{ filename="myImage.jpg", baseDir=system.ResourceDirectory },
	},
	startIndex = 1,
	listener = quickLookListener
}

native.showPopup( "quickLook", quickLookOptions )
``````