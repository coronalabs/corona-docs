# CoronaGraphics.h

> --------------------- ------------------------------------------------------------------------------------------
> __Type__				C header
> __Revision__			[REVISION_LABEL](REVISION_URL)
> __Keywords__			iOS, CORONA_NATIVE_PRODUCT, C, CoronaGraphics.h
> __See also__			[Corona C Functions][native.C]
>						[TextureResourceExternal][api.type.TextureResourceExternal]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

`CoronaGraphics.h` contains interfaces to interact with the Corona graphics pipeline. These interfaces are all prefixed with `CoronaExternal`.


## External Bitmaps

These interfaces allow bitmaps loaded from a C plugin to be made displayable in Corona by pushing them to Lua as [TextureResourceExternal][api.type.TextureResourceExternal] objects. A bitmap that is wrapped in a Lua [TextureResourceExternal][api.type.TextureResourceExternal] object can then be displayed in Corona via APIs that accept image `filename` and `baseDir` parameters such as the Lua [display.newImage()][api.library.display.newImage], [display.newImageRect()][api.library.display.newImageRect], and [graphics.newImageSheet()][api.library.graphics.newImageSheet] functions. Textures can also be applied to display objects that have a [fill][api.type.ShapeObject.fill] property such as a [ShapeObject][api.type.ShapeObject].

Please see the [Texture Loading/Management][guide.graphics.textureManagement] guide for examples on how to use and manage textures in Corona.


## Functions

#### [CoronaExternalPushTexture()][native.C.CoronaGraphics.CoronaExternalPushTexture]

#### [CoronaExternalGetUserData()][native.C.CoronaGraphics.CoronaExternalGetUserData]

#### [CoronaExternalFormatBPP()][native.C.CoronaGraphics.CoronaExternalFormatBPP]


## Enums

#### [CoronaExternalBitmapFormat][native.C.CoronaGraphics.CoronaExternalBitmapFormat]


## Structs

#### [CoronaExternalTextureCallbacks][native.C.CoronaGraphics.CoronaExternalTextureCallbacks]


## Example

This example is a hypothetical `plugin.texturer` with a single function, `newTexture()`, that pushes an image from <nobr>third-party</nobr> APIs <nobr>(prefixed with `TPA_`)</nobr>. Images have indices and <nobr>third-party</nobr> APIs can retrieve images with these indices.

1. Declare the plugin with the `luaopen_` function. This is common for all plugins.

<div class="code-indent">

``````c
CORONA_EXPORT int luaopen_plugin_texturer( lua_State *L )
{
    // Functions in library
    const luaL_Reg kVTable[] =
    {
        { "newTexture", newTexture },
        { NULL, NULL }
    };

    luaL_openlib( L, kName, kVTable, 0 );

    return 1;
}
``````

</div>

2. Implement the `newTexture()` function which will push images:

<div class="code-indent">

``````c
/** TextureResourceExternal texturer.newTexture(image) */
int newTexture(lua_State* luaStatePointer)
{
    int image = 0;
    if (lua_type(luaStatePointer, 1) == LUA_TNUMBER)
    {
        image = (int)lua_tointeger(luaStatePointer, 1);
    }
    else
    {
        luaL_argerror( L, 1, "image must be a number")
    }

    // creating callbacks structure and initializing it with zeros
    CoronaExternalTextureCallbacks callbacks = {0};
    // setting size
    callbacks.size = sizeof(CoronaExternalTextureCallbacks);
    // setting callbacks
    callbacks.getWidth = getWidth;
    callbacks.getHeight = getHeight;
    callbacks.onRequestBitmap = onRequestBitmap;
    callbacks.onReleaseBitmap = onReleaseBitmap;
    callbacks.onFinalize = onFinalize;

    // Creating helper structure
    HelperStruct* helper = new HelperStruct();
    helper->image = image;    
    helper->w = TPA_GetImageWidth(image);   //caching width and height
    helper->h = TPA_GetImageHeight(image);

    int ret = CoronaExternalPushTexture(L, &callbacks, (image));

    // Note that we're not deleting `helper` when everything is OK. It would be released in finalizing callback.
    if (ret == 0)
    {
        // something went wrong. Texture was not pushed, so should clean up to prevent memory leak
        delete helper;
    }
    return ret;
}
``````

</div>

3. Implement callbacks and helper:

<div class="code-indent">

``````c
struct HelperStruct
{
    unsigned w;
    unsigned h;
    int image;
    void *buff;    
}


unsigned getWidth(void* userData)
{
    HelperStruct* self = (HelperStruct*)userData;
    return self->w;
}

unsigned getHeight(void* userData)
{
    HelperStruct* self = (HelperStruct*)userData;
    return self->h;
}

const void* onRequestBitmap(void* userData)
{
    HelperStruct* self = (HelperStruct*)userData;

    int sz = self->w*self->h*4; // we know that our API always return 4 byte RGBA
    self->buff = new unsigned char[sz];
    TPA_GetImageRGBA(self->image, self->buff, sz);
    return self->buff;
}

void onReleaseBitmap(void* userData)
{
    HelperStruct* self = (HelperStruct*)userData;
    delete [] self->buff;
}

void onFinalize(void *userData)
{
    HelperStruct* self = (HelperStruct*)userData;
    // release helper when texture is no longer required
    delete self;
}
``````

</div>

4. Use the plugin in Lua code:

<div class="code-indent">

``````lua
local texturer = require( "plugin.texturer" )

local tex = texturer.newTexture( 42 )
display.newImageRect( tex.filename, tex.baseDir, tex.width, tex.height )
tex:releaseSelf()
``````

</div>

<div class="guide-notebox">
<div class="notebox-title">Note</div>

When the texture is created, callbacks will not be instantly called. Corona creates textures between frames and only when they're required. Also, after `texture:releaseSelf()` is called, `texture` is not necessarily released&nbsp;&mdash; only this Lua __reference__ is. If any display objects are using the texture, it will not be released, such that they can still be rendered correctly.

</div>
