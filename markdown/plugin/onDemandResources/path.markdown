# onDemandResources.path()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      [String][api.type.String]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          on-demand resources, onDemandResources, path
> __See also__          [system.pathForFile()][api.library.system.pathForFile]
>                       [onDemandResources.*][plugin.onDemandResources]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Even though you can typically use <nobr>on-demand</nobr> resources as if they exist in your app's bundle, they are not physically there. Use this convenience function or alternatively [system.pathForFile()][api.library.system.pathForFile] to retrieve the actual path. This may be necessary when, for example, an <nobr>on-demand</nobr> resource is a text file <nobr>(not an image)</nobr> and [io.open()][api.library.io.open] is required to open the file and read its contents ([guide][guide.data.readWriteFiles]).


## Syntax

	onDemandResources.path( filename )

##### filename ~^(required)^~
_[String][api.type.String]._ The name of the file that was requested as part of an <nobr>on-demand</nobr> resources [request][plugin.onDemandResources.request].
