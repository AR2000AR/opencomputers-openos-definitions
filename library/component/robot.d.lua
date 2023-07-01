---@meta

---@class ComponentRobot : Component
local robot = {}

--#region Base methods
---Get the durability of the currently equipped tool.
---@return number
function robot.durability()
end

---Move in the specified direction. 
---@param direction number
---@return boolean
function robot.move(direction)
end

---Rotate in the specified direction.
---@param clockwise boolean
---@return boolean
function robot.turn(clockwise)
end

---Get the name of the robot.
---@return string
function robot.name()
end

---Lets the robot use the currently equipped item in the tool slot against the block or space directly in front of the robot. 
---Returns true if successful, false if the operation fails with a description of why it failed.
---@param side number
---@return boolean, nil|string
function robot.swing(side)
end

---Attempts to use the item currently equipped in the tool slot in the same way as if the player would make a right-click.
---side - if given the robot will try to 'right-click' only on the surface as specified by side, otherwise the robot will try all possible sides
---sneaky - if set to true the robot will simulate a sneak-right-click
---duration - how long the item is used.
---Returns true if the robot could interact with the block or entity in front
---the secondary parameter describes what the robot interacted
---@param side number
---@param sneaky? boolean
---@param duration? number
---@return boolean, nil|string
function robot.use(side, sneaky, duration)
end

---Tries to place the block in the currently selected inventory slot on the specified side of the robot 
---If sneaky is set to true, the robot will simulate a sneak-placement
---Returns true if successfully placed
---If an unsupported value is provided as a parameter, the operation will fail with a description of why it failed
---@param side number
---@param sneaky boolean
---@return boolean, nil|string
function robot.place(side, sneaky)
end

---Get the current color of the activity(robot) or flap(drone) light as an integer encoded RGB value (0xRRGGBB)
---@return number
function robot.getLightColor()    
end

---Set the color of the activity(robot) or flap(drone) light to the specified integer encoded RGB value (0xRRGGBB)
---@return number
function robot.setLightColor()
end

--#endregion

--#region Internal Inventory Methods

---Returns the size of the device's internal inventory.
---@return number
function robot.inventorySize()
end

---Get the currently selected slot; set the selected slot if specified.
---@param slot? number
---@return number
function robot.selected(slot)
end

---Get the number of items in the specified slot, otherwise in the selected slot.
---@params slot? number
---@return number
function robot.count(slot)
end

---Get the remaining space in the specified slot, otherwise in the selected slot.
---@param slot? number
---@return number
function robot.space(slot)
end

---Compare the contents of the selected slot (in the robot inventory) to the contents of the specified slot (also in the robot inventory).
---@param otherSlot number
---@return boolean
function robot.compareTo(otherSlot)
end

---Move the specified amount of items from the selected slot into the specified slot. If no amount is specified, the entire stack is moved to the target slot.
---@param toSlot number
---@param amount? number
---@return boolean
function robot.transferTo(toSlot, amount)
end

---Returns the number of tanks installed in the robot.
---@return number
function robot.tankCount()
end

---Selects the specified tank (if robot contains more than one Tank upgrade). Any tank operations will use this tank.
---@param tank number
function robot.selectTank(tank)
end

---Returns the fluid level in the specified tank. If no tank specified, returns the fluid level in the selected tank (using selectTank()).
---@param tank? number
---@return number
function robot.tankLevel(tank)
end

---Returns the remaining fluid capacity (empty space) in the specified tank. If not tank specified, returns the remaining capacity in the selected tank.
---@param tank? number
---@return number
function robot.tankSpace(tank)
end

---Tests whether the fluid in the selected tank (in the robot inventory) is the same as in the specified tank (requires Tank upgrade).
---@param tank number
---@return boolean
function robot.compareFluidTo(tank)
end

---Transfer the specified amount of fluid in the selected tank into the specified tank. If no volume is specified, the robot will attempt to transfer 1000mB.
---@param tank number
---@param count? number
---@return boolean
function robot.transferFluidTo(tank, count)
end

--#endregion

--#region External Inventory Methods

---Detects the block on the given side, relative to the robot, \
---and returns whether or not the robot can move into the block, \
---as well as a general description of the block
---Returns true if the block will prevent the robot from moving forward, false otherwise. \
---Drones return true even if the block is passable.
---@param side number
---@return boolean
function robot.detect(side)
end

---Compares fluid in the selected tank to fluid in the world or in an external tank on the specified side of the robot.
---@param side number
---@return boolean
function robot.compareFluid(side)
end

---Extracts the specified amount of fluid from the world or a tank on the specified side of the robot.
---If no amount is specified, the robot will try to drain 1000mB.
---If the tank is unable to store the specified amount of fluid, the operation will fail.
---@param side number
---@param count? number
---@return boolean
function robot.drain(side, count)
end

---Fills the specified amount of fluid from the selected tank into the world or a tank in front of the robot. 
---If no amount is specified, the robot will try to fill the target tank with 1000mB of fluid. 
---If there is not enough fluid to fill a block, or not enough space in the target tank, the operation will fail.
---@param side number
---@param count? number
---@return boolean
function robot.fill(side, count)
end

---Compares the block on the specified side of the robot with the item in the currently selected slot and returns whether they are the same or not.
---Blocks are considered identical if the type and metadata matches.
---@param side number
---@param fuzzy? boolean 
function robot.compare(side, fuzzy)
end

---Drops the specified number of items from the currently selected slot.
---Returns true if at least one item is dropped.
---If the block in front of the robot is an inventory, the robot will try to place the item into the inventory.
---If the inventory doesn't accept the item, the item is not dropped into the world (the operation will fail and return false)
---@param side number
---@param count? number
---@return boolean
function robot.drop(side, count)
end

---Tries to pick up the specified number of items and place it in the selected slot. 
---If the selected slot is occupied, items will be placed in the first available slot. 
---Returns the number of items sucked else false.
---@param side number
---@param count? number
---@return boolean
function robot.suck(side, count)
end

--#endregion