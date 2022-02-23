# gpgs.loadImage()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google Play Games Services, game network, gpgs, loadImage
> __See also__          [gpgs.*][plugin.gpgs]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Loads an image from Google's servers using a special Google&nbsp;Play&nbsp;Services URI and writes it to a specified file as a PNG image.


## Syntax

	gpgs.loadImage( params )

##### params ~^(required)^~
_[Table][api.type.Table]._ Contains parameters for the request &mdash; see the next section for details.

## Parameter Reference

The `params` table includes parameters for the request.

##### uri ~^(required)^~
_[String][api.type.String]._ Image resource URI retrieved from another call such as [gpgs.players.load()][plugin.gpgs.players.load].

##### filename ~^(required)^~
_[String][api.type.String]._ Path for the PNG image file to be saved.

##### baseDir ~^(optional)^~
_[Constant][api.type.Constant]._ Optional constant corresponding to the base directory where the file will be saved. Default value is [system.CachesDirectory][api.library.system.CachesDirectory].

##### listener ~^(optional)^~
_[Listener][api.type.Listener]._ Listener function which receives a [loadImage][plugin.gpgs.event.loadImage] event.
