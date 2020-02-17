# composer.getVariable()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [composer.*][api.library.composer]
> __Return value__      various
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          composer, scene, getVariable
> __See also__          [composer.setVariable()][api.library.composer.setVariable]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Retrieves the value of a variable from within the Composer module that was previously set via [composer.setVariable()][api.library.composer.setVariable].

## Syntax

	composer.getVariable( variableName )

##### variableName
_[String][api.type.String]._ The name of the variable previously set via [composer.setVariable()][api.library.composer.setVariable].

## Example

`````lua
-- Set the Composer variable "money" to 100
composer.setVariable( "money", 100 )

-- In another scene...
local currentMoney = composer.getVariable( "money" )
`````