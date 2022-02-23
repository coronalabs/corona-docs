# ImageInfo

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Table][api.type.Table]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          steam, steamworks, image, texture, avatar, ImageInfo
> __See also__          [steamworks.getAchievementImageInfo()][plugin.steamworks.getAchievementImageInfo]
>                       [steamworks.getUserImageInfo()][plugin.steamworks.getUserImageInfo]
>                       [steamworks.newImageRect()][plugin.steamworks.newImageRect]
>                       [steamworks.newTexture()][plugin.steamworks.newTexture]
>                       [steamworks.*][plugin.steamworks]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Provides information about one user avatar image or achievement image such as its pixel width, pixel height, and its unique handle which is needed to load the image via the [steamworks.newImageRect()][plugin.steamworks.newImageRect] and [steamworks.newTexture()][plugin.steamworks.newTexture] functions.

Objects of this type can be acquired by calling the [steamworks.getAchievementImageInfo()][plugin.steamworks.getAchievementImageInfo] and [steamworks.getUserImageInfo()][plugin.steamworks.getUserImageInfo] functions.


## Properties

#### [object.imageHandle][plugin.steamworks.type.ImageInfo.imageHandle]

#### [object.pixelHeight][plugin.steamworks.type.ImageInfo.pixelHeight]

#### [object.pixelWidth][plugin.steamworks.type.ImageInfo.pixelWidth]
