
# path.textureVertices

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Table][api.type.Table]
> __Object__            [Path][api.type.Path]
> __Library__           [display.*][api.library.display]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          texture, vertices
> --------------------- ------------------------------------------------------------------------------------------

## Overview

A read-only array of the form `{u1, v1, u2, v2, ...}` with each `(u, v)` pair containing the texture coordinates at one of the display object's vertices. The values are normalized from 0 to 1 (versus pixels as in image sheets).

## Example

``````lua
local tex = graphics.newTexture{ type = "canvas", width = 128, height = 128 }
local back = display.newRect(0, 0, 128, 128)

back:setFillColor(1, 0, 0)

local rect = display.newRect(0, 0, 32, 64)

rect:setFillColor(0, 0, 1)

tex:draw(back)
tex:draw(rect)
tex:invalidate()

local fill = { type = "image", filename = tex.filename, baseDir = tex.baseDir }

local function Vertices (object)
    local vertices, t = object.path.textureVertices, {}

    for i = 1, #vertices, 2 do
        t[#t + 1] = "\t(" .. vertices[i] .. ", " .. vertices[i + 1] .. ")"
    end

    return "Vertices:\n" .. table.concat(t, "\n")
end

local vanilla = display.newRect(50, 50, 30, 30)

vanilla.fill = fill

print("VANILLA RECT")
print(Vertices(vanilla))
print("")

local polygon = display.newPolygon(150, 120, { 0, -110, 27, -35, 105, -35, 43, 16, 65, 90, 0, 45, -65, 90, -43, 15, -105, -35, -27, -35, })

polygon.fill = fill

print("STAR POLYGON")
print(Vertices(polygon))
print("")

local mesh = display.newMesh{
    x = 300, y = 100,
    mode = "triangles",
    vertices = {
        -5, 0, 90, 0, 0, 100,
        0, 100, 90, 0, 130, 100,
        130, 100, 90, 0, 100, 0
    },
    uvs = {
        0, 0, 0.25, 0, 0, .9,
        0, .9, 0.25, 0, 1, .75,
        1, .75, 0.25, 0, 1, 0
    }
}

mesh:translate(mesh.path:getVertexOffset())  -- Translate mesh so that vertices have proper world coordinates
 
mesh.fill = fill

print("MESH")
print(Vertices(mesh))
print("")

local options = {
    frames = {
        {
            x = 64 - 16,
            y = 64 - 32,
            width = 32,
            height = 64
        }
    }
}

local sheet = graphics.newImageSheet(tex.filename, tex.baseDir, options)
local image = display.newImage(sheet, 1)

image.x, image.y = 500, 100

print("SHEET-BASED IMAGE")
print(Vertices(image))
print("")

local sprite = display.newSprite(sheet, { name = "state", start = 1, count = 1 })

sprite.x, sprite.y = 600, 150

print("SPRITE FRAME")
print(Vertices(sprite))
``````
