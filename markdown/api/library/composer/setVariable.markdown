# composer.setVariable()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [composer.*][api.library.composer]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          composer, scene, setVariable
> __See also__          [composer.getVariable()][api.library.composer.getVariable]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

This function sets a variable within the Composer module which you can access from any other scene via  [composer.getVariable()][api.library.composer.getVariable].

## Syntax

	composer.setVariable( variableName, value )

##### variableName
_[String][api.type.String]._ The name of the variable to set.

##### value
_[String][api.type.String]._ The value to assign to the variable.

## Example

`````lua
-- Set the Composer variable "money" to 100
composer.setVariable( "money", 100 )

-- In another scene...
local currentMoney = composer.getVariable( "money" )
`````