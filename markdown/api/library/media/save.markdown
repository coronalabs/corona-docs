
# media.save()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [media.*][api.library.media]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          media, photo library
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Adds specified file to photo library.

## Gotchas

### Simulator

On the Corona Simulator, the files are not added to the actual user's photo library. On Mac, it is saved to the location specified in the Corona Simulator Console output.

### Android

On Android, you must add the `android.permission.WRITE_EXTERNAL_STORAGE` permission to your project's `build.settings` file. Otherwise, Android will not allow your photo to be added to the photo library:

``````
settings =
{
	android =
	{
		usesPermissions =
		{
			"android.permission.WRITE_EXTERNAL_STORAGE",
		},
	},
}
``````

## Syntax

	media.save( filename [, baseDir] )

##### filename ~^(required)^~
_[String][api.type.String]._ The name of the image file to be added to the photo library, relative to `baseDirectory` (or `system.ResourceDirectory` by default).

##### baseDir ~^(optional)^~
_[Constant][api.type.Constant]._ Path to load the image data from filename. Default is `system.ResourceDirectory`. See [system.pathForFile()][api.library.system.pathForFile] for valid values).

## Example

`````lua
media.save( "world.jpg", system.TemporaryDirectory )
`````
