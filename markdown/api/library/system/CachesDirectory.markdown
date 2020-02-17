# system.CachesDirectory

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Constant][api.type.Constant]
> __Library__           [system.*][api.library.system]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          system directory, CachesDirectory
> __See also__          [system.pathForFile()][api.library.system.pathForFile]
>						[system.ApplicationSupportDirectory][api.library.system.ApplicationSupportDirectory]
>						[system.DocumentsDirectory][api.library.system.DocumentsDirectory]
>						[system.ResourceDirectory][api.library.system.ResourceDirectory]
>						[system.TemporaryDirectory][api.library.system.TemporaryDirectory]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Used with [system.pathForFile()][api.library.system.pathForFile] to create a path for storing and retrieving files that are available across application launches. This is ideal for saving state information. 

<div class="guide-notebox">
<div class="notebox-title">Note</div>

On iOS, this information is __not__ backed up by syncing.

</div>


## Syntax

	system.CachesDirectory
