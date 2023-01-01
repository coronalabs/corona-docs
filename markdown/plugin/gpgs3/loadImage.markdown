# gpgs.loadImage()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google Play Games Services, game network, gpgs
> __See also__          [gpgs.*][plugin.gpgs3]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Loads an image from Google's server using a special Google Play Services URI and writes it to a specified file as a PNG image.

## Syntax

	gpgs.loadImage(params)

##### params ~^(required)^~
_[Table][api.type.Table]._ Contains parameters — see the next section for details.

## Parameter Reference

##### uri ~^(required)^~
_[String][api.type.String]._ Image resource URI, it must be something that was retrieved from another call to Google Play services.

##### filename ~^(required)^~
_[String][api.type.String]._ Path for the to be saved PNG image file.

##### baseDir ~^(optional)^~
_[Constant][api.type.Constant]._ Constant corresponding to the base directory where the file will be located. Default value is `system.CachesDirectory` if the parameter is not provided.

##### listener ~^(optional)^~
_[Listener][api.type.Listener]._ Receives [loadImage][plugin.gpgs3.event.loadImage] event.