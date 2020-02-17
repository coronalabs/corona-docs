# object:setExtension()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Object__            [CoronaPrototype][api.type.CoronaPrototype]
> __Library__           none
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Objects based on [CoronaPrototype][api.type.CoronaPrototype] cannot have their `__index` metamethod overridden.

When called, `indexFunc` will be called prior to the original `__index` metamethod. If `indexFunc` returns `nil`, then the original metamethod is called.

## Syntax

	object:setExtension( indexFunc )

##### indexFunc ~^(required)^~
_[Function][api.type.Function]._ The index function.