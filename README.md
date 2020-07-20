# Solar2D game engine documentation

![Deploy to GitHub pages](https://github.com/coronalabs/corona-docs/workflows/Deploy%20to%20GitHub%20pages/badge.svg)

This documentation gets deployed to: https://docs.coronalabs.com/

Engine source can be found [here](https://github.com/coronalabs/corona)

Documentation lives in `markdown/` directory. Note that it does not use GitHub flavored markdown, but rather its own flavor.

Plugin documentation lives in submodule. Mind it when checking out. Submodule documentation is auto-generated and not intended to be edited manually.

To build documentation yourself from `bin` directory run `lua build.lua`. Make sure Lua has LFS (Lua File System) accessible.
