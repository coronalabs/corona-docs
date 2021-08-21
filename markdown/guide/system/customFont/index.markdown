# Using Custom Fonts

This guide outlines how to include and use custom embedded fonts in Corona, allowing you to stylize your app more consistently across platforms.

<div class="guides-toc">

* [Font File Support](#support)
* [Including and Using Fonts](#fonts)

</div>


<a id="support"></a>

## Font File Support

While both [TrueType](https://en.wikipedia.org/wiki/TrueType) (`.ttf`) and [OpenType](https://en.wikipedia.org/wiki/OpenType) (`.otf`) fonts are theoretically supported, there is no guarantee that any font will work across all platforms. Essentially, fonts are loaded by the operating system, and whether or not a particular font is supported depends on the platform and OS version. For example, on Windows and some versions of Android, there may be compatibility issues with certain OpenType font files (`.otf`), and if the platform/OS refuses to load a font, Corona will fall back to a default system font and the error will get logged. Essentially, if you use custom fonts, you should test on as many potential target devices as possible.


<a id="fonts"></a>

## Including and Using Fonts

1. Copy the __font file__ to the main project directory, alongside `main.lua` or copy it to a subdirectory. If you do include the subdirectory name in the path.

2. To use the font, pass the font __file&nbsp;name__ as a [string][api.type.String] to the appropriate API, including the file extension:

<div class="code-indent">

``````lua
-- Standard text object -- font in the same folder with main.lua
local displayText = display.newText( "Hello World", 150, 80, "CoolCustomFont.ttf", 24 )

-- Standard text object -- font in a folder named "fonts"
local displayText = display.newText( "Hello World", 150, 80, "fonts/CoolCustomFont.ttf", 24 )

-- Font for native text input field
local inputText = native.newFont( "CoolCustomFont.ttf", 16 )
local textField = native.newTextField( 150, 150, 180, 30 )
textField.font = inputText
``````

</div>
