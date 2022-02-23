# event.conflicts

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Table][api.type.Table]
> __Event__             [iCloudDocEvent][plugin.iCloud.event.iCloudDocEvent]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          iCloud, sync, storage, iCloudDocEvent, conflicts
> __See also__          [iCloudDocEvent][plugin.iCloud.event.iCloudDocEvent]
>						[iCloud.*][plugin.iCloud]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

If there are document conflicts gathered from [iCloud.docConflicts()][plugin.iCloud.docConflicts], this table will contain an entry \([table][api.type.Table]\) for each conflict. Each instance will contain the following properties:

* `origin` &mdash; [String][api.type.String] name of the device where the conflict originated.

* `time` &mdash; [Number][api.type.Number] indicating the modification date of the conflict, formatted similar to [os.time()][api.library.os.time].

* `dataHandle` &mdash; [String][api.type.String] value which can be used to retrieve the conflict data &mdash; see the next section for details.


## Resolving Conflicts

Conflicts should be resolved. Here is an example workflow:

1. Merge the data automatically or ask the user to choose which version to keep. [iCloud.docConflictData()][plugin.iCloud.docConflictData] can be used to retrieve conflict data.

2. Write the proper version to the file with [iCloud.docWrite()][plugin.iCloud.docWrite].

3. Resolve and delete conflicted versions with [iCloud.docResolve()][plugin.iCloud.docResolve].
