#!/usr/bin/env python

"""
Responsible for converting CodeBlock elements for use with SyntaxHighlighter.
"""

from pandocfilters import toJSONFilter, CodeBlock, RawBlock

supportedBrushes = [ "c#", "java", "js", "lua", "php", "sql", "xml" ]
shSpecialKeys = [ "brush", "gutter", "auto-link", "collapse", "first-line", "highlight", "html-script", "smart-tabs", "tab-size", "toolbar" ]

def setBrushForCodeBlocks(key, value, fmt, meta):
  if key == "CodeBlock" and fmt == "html" :
    [[ident, classes, keyvals], code] = value
    keyvals = dict(keyvals)

    # Convert from the default class to the KV list we'll parse.
    if classes and classes[0] in supportedBrushes:
      keyvals["brush"] = classes[0]
      classes.pop(0)
    elif "brush" not in keyvals:
      keyvals["brush"] = "lua"

    # SH uses some wacky classes. Because they would be a pain to define via
    # markdown as classes, we remap them here.
    for k in keyvals:
      if k in shSpecialKeys:
        classes.insert( 0, k + ":" )
        classes.insert( 1, keyvals[k] + ";" )

    # Rewrite the block as raw, otherwise Pandoc will include <code> tags that SH
    # won't like.
    preId = " id=\"" + ident + "\"" if ident else ""
    preClasses = " class=\"" + " ".join(classes) + "\"" if classes else ""
    return RawBlock( "html", "<pre" + preId + preClasses + ">" + code.replace( "<", "&lt;") + "</pre>" )

if __name__ == "__main__":
  toJSONFilter(setBrushForCodeBlocks)