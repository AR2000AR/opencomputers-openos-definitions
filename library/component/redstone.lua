---@meta

---@class ComponentRedstone
local redstone = {}

---Returns current incoming (non-bundled) redstone values. `getInput(side)` returns the redstone level from the specified side. `getInput()` returns a table of redstone levels from all sides.\
---Note that the table returned is zero based. That is because the keys of the table are the ordinal values of the sides, and `sides.bottom` is 0.\
---Note also that the side is relative to the computer's orientation, i.e. `sides.south` is in front of the computer, not south in the world. Likewise, `sides.left` is to the left of the computer, so when you look at the computer's front, it'll be to your right.\
---If you use mods such as RedLogic the input may exceed the vanilla values of [0, 15].
---@param side number
---@return number
---@overload fun():table<number>
function getInput(side) end

---Gets the currently set output on the specified side, or the set value of all sides if called with no arguments
---@param side number
---@return number
---@overload fun():table<number>
function getOutput(side) end

---Sets the strength of the redstone signal to emit. Returns the *old* value. This can be an arbitrarily large number for mods that support this. The first variant of this method takes a side and the redstone strength to apply to just that side. `setOutput(values)` allows you to set the redstone strength of all sides (or a subset of sides) in a single call.
---@param side number
---@param value number
---@return number
---@overload fun(values:table<number>):table<number>
function setOutput(side, value) end

---Like `getInput`, but for bundled input, reading the value for the channel with the specified API/Colors.\
---As of OC 1.3: only available on a tier two redstone card.\
---`getBundledInput(side, color)` returns the strength of the incoming redstone value on the specified side on the specified color channel.\
---`getBundledInput(side)` returns a table (Map[Int, Int] structure) of redstone values on the specified side in a bundled pack, indexed by color.\
---`getBundledInput()` returns all redstone values, of all sides and all colors. It is a Map[Int, Map[Int, Int]] structure. The top level keys are in [0, 5] range, values of sides (keep in mind sides.bottom is zero). The child map of each side is the same data structure returned by `getBundledInput(side)`.
---@param side number
---@param color number
---@return number
---@overload fun(side:number):table
---@overload fun():table
function getBundledInput(side, color) end

---Like `setOutput`, but for bundled output, setting the value for the channel with the specified API/Colors. Returns the previous values set. `setBundledOutput(side, values)` sets a pack of color-indexed redstone values, [0, 15]. `colors.white` is zero. The values table doesn't have to be contiguous, and values omitted are left unchanged. `setBundledOutput(values)` allows you to set redstone levels for any side and any color in a single api call.
---@param side number
---@param color number
---@param value number
---@return number
function setBundledOutput(side, color, value) end

---Get the comparator input on the specified side.
---@param side number
---@return number
function getComparatorInput(side) end

---Get the wireless redstone input.
---@return number
function getWirelessInput() end

---Get the wireless redstone output.
---@return boolean
function getWirelessOutput() end

---Set the wireless redstone output.
---@param value boolean
---@return boolean
function setWirelessOutput(value) end

---Get the currently set wireless redstone frequency.
---@return number
function getWirelessFrequency() end

---Set the wireless redstone frequency to use.
---@param frequency number
---@return number
function setWirelessFrequency(frequency) end

---Gets the current wake-up threshold.
---@return number
function getWakeThreshold() end

---Sets the wake-up threshold to the specified number.
---@param threshold number
---@return number
function setWakeThreshold(threshold) end
