---@meta

---@class ComponentGeolyzer : Component
local geolyzer = {}

---Analyzes the density of an area at the specified relative coordinates x, z and y. 
---This will return a list of hardness values for the blocks in the specified range. The coordinates are relative to the location of the geolyzer.
---Size of the analyzed area can be optionally given with parameters w, d and h which stand for width, depth and height, otherwise the area is assumed to be a single block at the specified offset.
---@param x number x offset
---@param z number z offset
---@param y? number y offset
---@param w? number width of scan
---@param d? number depth of scan
---@param h? number height of scan
---@return table 
---@overload fun(x:number, y:number,ignoreReplaceable:boolean):table
---@overload fun(x:number, y:number,options:table):table
function geolyzer.scan(x,z,y,w,d,h)
end

---Get some information on a directly adjacent block. By default the returned table returns the string ID of the block.
---Note that a single call to this consumes the same amount of energy a call to scan does!
---@param side number
---@param options? table
---@return table
function geolyzer.analyze(side, options)
end

---Stores an item stack representation of the block on the specified side of the geolyzer 
---to the specified slot of a database component with the specified address. 
---@param side number
---@param dbAddress number
---@param dbSlot number
---@return boolean
function geolyzer.store(side, dbAddress, dbSlot)
end
---Same as robot.detect 
---Detects the block on the given side, relative to the robot, and returns whether or not the robot can move into the block, as well as a general description of the block.
---Returns true if whatever is in front of the robot would prevent him from moving forward
---@param side number
---@return boolean, string 
function geolyzer.detect(side)
end

---Returns whether there is a clear line of sight to the sky directly above. 
---Transparent blocks, e.g. glass don't affect the line of sight.
---@return boolean
function geolyzer.canSeeSky()
end

---Returns whether the sun is currently visible directly above.
---The result is affected by possible blocks blocking the line of sight directly above
---and whether it's night or day.
---@return boolean
function geolyzer.isSunVisible()
end