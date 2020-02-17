# CoronaExternalTextureCallbacks

> --------------------- ------------------------------------------------------------------------------------------
> __Revision__			[REVISION_LABEL](REVISION_URL)
> __Keywords__			iOS, CORONA_NATIVE_PRODUCT, C, CoronaGraphics.h, CoronaExternalTextureCallbacks
> __See also__			[CoronaGraphics.h][native.C.CoronaGraphics]
>						[Corona C Functions][native.C]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

This structure contains fields which provide information about the texture and callbacks to be invoked by Corona when events occur or when Corona is requesting information about the texture. Textures are managed by Corona and plugins have no control on when the texture is to be released. Thus, information about a texture's bitmap must be available upon request.

<div class="guide-notebox">
<div class="notebox-title">Note</div>

Always initialize an instance of this structure with zeros. Some of the fields are optional and the texture can be created even if they are `NULL`. Other fields are required, however, and the texture will not be pushed if they aren't present.

``````c
CoronaExternalTextureCallbacks callbacks;
memset(&callbacks, 0, sizeof(CoronaExternalTextureCallbacks));
callbacks.size = sizeof(CoronaExternalTextureCallbacks);
``````

</div>


## Syntax

``````c
typedef struct CoronaExternalTextureCallbacks
{
	unsigned long size;
	unsigned int (*getWidth)(void* userData);
	unsigned int (*getHeight)(void* userData);
	const void* (*onRequestBitmap)(void* userData);
	void (*onReleaseBitmap)(void* userData);
	CoronaExternalBitmapFormat (*getFormat)(void* userData);
	void (*onFinalize)(void *userData);
	int (*onGetField)(lua_State *L, const char *field, void* userData);
} CoronaExternalTextureCallbacks;
``````

##### size ~^(required)^~
When creating an instance of this type, set this member to the number of bytes the `CoronaExternalTextureCallbacks` type is. This field is used for identifying the API version.

``````c
size = sizeof(CoronaExternalTextureCallbacks);
``````

##### getWidth ~^(required)^~
Callback that will be invoked when Corona is requesting the plugin to provide the bitmap's pixel width. This callback receives the `userData` pointer passed when the texture resource was created. Note that some bitmap formats, such as <nobr>8-bit</nobr> masks, require the width to be a multiple of&nbsp;4 bytes.

##### getHeight ~^(required)^~
Callback that will be invoked when Corona is requesting the plugin to provide the bitmap's pixel height. This callback receives the `userData` pointer passed when the texture resource was created.

##### onRequestBitmap ~^(required)^~
Callback that will be invoked by Corona when the bitmap's pixel array has been requested by Corona's rendering system. This function call will always be followed by a call to the `onReleaseBitmap` callback. This callback receives the `userData` pointer passed when the texture resource was created.

<div class="guide-notebox">
<div class="notebox-title">Notes</div>

* This function must return a valid pointer to the data containing bitmap information. Corona expects bitmap data to be a <nobr>row-by-row</nobr> array of pixels starting from the top left of the image, and each pixel is represented by <nobr>`bpp = CoronaExternalFormatBPP(getFormat())`</nobr> bytes. Each color channel uses 1 byte and is ordered the same as the format name, left to right. So, with RGBA format, the R index is&nbsp;`0`.

* The overall size of memory must be at least...

<div class="code-indent">

``````c
unsigned int bitmapSizeInBytes = getWidth() * getHeight() * bytesPerPixel;
``````

</div>

* Accessing the <nobr>left-most</nobr> value of the bitmap (R&nbsp;in&nbsp;RGBA) could be written as...

<div class="code-indent">

``````c
void* byteArray = onRequestBitmap();
int bytesPerPixel = CoronaExternalFormatBPP(getFormat());
int red = (int)byteArray[((Y * getWidth()) + X) * bytesPerPixel];
``````

</div>

* Remember that the default format, RGBA, uses premultiplied alpha.

</div>

##### onReleaseBitmap ~^(optional)^~
Callback that will be invoked by Corona to notify the plugin that the texture bitmap's data is no longer required, meaning that the plugin can delete the bitmap data from memory. After this callback is invoked, the pointer previously returned by the `onRequestBitmap` callback is no longer expected to be valid. This callback receives the `userData` pointer passed when the texture resource was created.

##### getFormat ~^(optional)^~
Callback that will be invoked by Corona when requesting the pixel format of the bitmap. This callback receives the `userData` pointer passed when the texture resource was created. This must return a [CoronaExternalBitmapFormat][native.C.CoronaGraphics.CoronaExternalBitmapFormat] enum constant, such as `kExternalBitmapFormat_RGBA`.

##### onFinalize ~^(optional)^~
Callback that will be invoked by Corona to notify the plugin that the Lua [TextureResourceExternal][api.type.TextureResourceExternal] object is about to be destroyed. After this callback is invoked, no callbacks or returned bitmap pointers can be accessed. Essentially, this releases all objects and resources associated with this texture resource. This callback receives the `userData` pointer passed when the texture resource was created.

##### onGetField ~^(optional)^~
Callback to be invoked when an unknown Lua property has been accessed from the Lua [TextureResourceExternal][api.type.TextureResourceExternal] object. This is the plugin's opportunity to provide custom <nobr>read-only</nobr> fields from the Lua object. Argument `field` provides the name of the property being accessed from the [TextureResourceExternal][api.type.TextureResourceExternal] object. Argument `userData` is the pointer passed when the texture resource was created. This function returns the number of values pushed onto the Lua stack.
