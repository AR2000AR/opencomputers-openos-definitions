---@meta

---@class libRobot
local robot = {}

---Returns the robot's name.
---@return string
function robot.name()
end

---Detects what is directly in front of the robot and returns if the robot could move through it as well as a generic description.
---Returns true if the robot if whatever is in front of the robot would prevent him from moving forward
---Drones return true even if the block is passable
---The second parameter describes what is in front in general and is one of either entity, solid, replaceable, liquid, passable or air.
---@returns boolean, string
function robot.detect()
end

---As robot.detect() except that it scans the block directly above the robot.
---@returns boolean, string
function robot.detectUp()
end
---As robot.detect() except that it scans the block directly below  the robot.
---@returns boolean, string
function robot.detectDown()
end

--Selects the given inventory slot (if specified) and returns the current inventory slot.
---Returns the currently selected slot. Either the one specified (if successfully selected) or the one that was previously selected.
---@param slot? number - the slot to select. If this parameter is omitted, no slot is selected.
---@return number Specifies the slot to count the items in. If omitted the currently selected slot is counted instead.
function robot.select(slot)
end

---Returns the amount of select-able internal robot inventory slots. 
---To get the number of inventory upgrade use: x = robot.inventorySize() / 16.
---@return number
function robot.inventorySize()
end

---Returns the amount of items currently in the specified or selected slot.
---@param slot? number Specifies the slot to count the items in. If omitted the currently selected slot is counted instead.
function robot.count(slot)
end

--- Returns the amount of items that can still be added to the the slot specified or the currently selected slot until it is considered full.
---@param slot? number Specifies the slot to count the items in. If omitted the currently selected slot is counted instead.
function robot.space(slot)
end

---Moves all or up to count items from the currently selected slot to the specified slot.
---Returns true if exchanging the content between those slots was successful, false otherwise.
---@param slot number
---@param count? number
---@return boolean
function robot.transferTo(slot, count)
end

---Compares the item of the currently selected slot to the item of the slot specified and returns whether they are equal or not.
---Returns true if the item type in the specified slot and the currently selected slot are equal, false otherwise.
---Two items are considered the 'same' if their item type and metadata are the same.
---@param slot number
---@returns boolean
function robot.compareTo(slot)
end

---Compares the block in front of the robot with the item in the currently selected slot and returns whether they are the same or not.
---Blocks are considered the 'same' if their type and metadata are the same.
---@return boolean
function robot.compare()
end

---Same as robot.compare just for the block directly above the robot.
---@return boolean
function robot.compareUp()
end

---Same as robot.compare just for the block belowabove the robot.
---@return boolean
function robot.compareDown()
end

---Tries to drop items from the currently selected inventory slot in front of the robot.
---Note that if you are trying to drop items into an inventory below you, this is the wrong method. Use dropDown for that case. 
---This method, drop, will drop the items to the front.
---Returns true if at least one item was dropped, false otherwise.
---@param count number
---@return boolean
function robot.drop(count)
end

---As robot.drop just for the block directly above the robot.
---@return boolean
function robot.dropUp()
end

---As robot.drop just for the block directly below  the robot.
---@return boolean
function robot.dropDown()
end

---Tries to pick up items from directly in front of the robot and puts it into the selected slot or (if occupied) first possible slot.
---Count limits the amount of items to pick up by this many. If omitted a maximum of one stack is taken.
---@param count? number
function robot.suck(count)
end

---As robot.suck except that it tries to pick up items from directly above the robot.
---@param count? number
function robot.suckUp(count)
end

---As robot.suck except that it tries to pick up items from directly below the robot.
---@param count? number
function robot.suckDown(count)
end

---Tries to place the block in the currently selected inventory slot in front of the robot.
---Side determines the surface on which the robot attempts to place the block for example to place torches to a specific side. If omitted the robot will try all possible sides.
---If sneaky is true, the robot will simulate a sneak-placement
---Returns true if an item could be placed, false otherwise. 
---If placement failed, the secondary return parameter will describe why the placement failed.
---@param side? number
---@param sneaky boolean
---@return boolean, string
function robot.place(side, sneaky)
end

---Same as robot.place except that the robot tries to place the item into the space directly above it.
---@param side? number
---@param sneaky boolean
---@return boolean, string
function robot.placeUp(side, sneaky)
end

---Same as robot.place except that the robot tries to place the item into the space directly below it.
---@param side? number
---@param sneaky boolean
---@return boolean, string
function robot.placeDown(side, sneaky)
end

---Returns the durability of the item currently in the tool slot, followed by its current durability, followed by its maximum durability.
---If no item is equipped or the item has no durability this returns nil and an error message describing why no durability could be returned. 
---The error message is one of no tool equipped or tool cannot be damaged.
---@return number, number, number
---@return nil, string
function robot.durability()
end

---Makes the robot use the item currently in the tool slot against the block or space immediately in front of the robot in the same way as if a player would make a left-click.
---If side is given, the robot will try to 'left-click' only on the surface as specified by side, otherwise the robot will try all possible sides.
---Returns true if the robot could interact with the block or entity in front of it, false otherwise.
---If successful the secondary parameter describes what the robot interacted with and will be one of 'entity', 'block' or 'fire'.
---@param side? number
---@param sneaky? boolean
---@return boolean, string?
function robot.swing(side, sneaky)
end

--- Same as robot.swing except that the block or entity directly above the robot will be the target.
---@param side? number
---@param sneaky? boolean
---@return boolean, string?
function robot.swingUp(side, sneaky)
end

--- Same as robot.swing except that the block or entity directly below the robot will be the target.
---@param side? number
---@param sneaky? boolean
---@return boolean, string?
function robot.swingDown(side, sneaky)
end

---Attempts to use the item currently equipped in the tool slot in the same way as if the player would make a right-click.
---If side is given the robot will try to 'right-click' only on the surface as specified by side, otherwise the robot will try all possible sides.
---If sneaky is set to true the robot will simulate a sneak-right-click (like if the player would be using shift during a right-click).
---Duration determins how long the item is used. 
---@param side number
---@param sneaky? boolean
---@param duration? number
---@return boolean, string?
function robot.use(side, sneaky, duration)
end

--- Same as robot.use except that the block or entity directly above the robot will be the target.
---@param side number
---@param sneaky? boolean
---@param duration? number
---@return boolean, string?
function robot.useUp(side, sneaky, duration)
end

--- Same as robot.use except that the block or entity directly below the robot will be the target.
---@param side number
---@param sneaky? boolean
---@param duration? number
---@return boolean, string?
function robot.useDown(side, sneaky, duration)
end

---Tries to move the robot forward.
---Returns: true if the robot successfully moved, nil otherwise. 
---If movement fails a secondary result will be returned describing why it failed
---@return boolean, string?
function robot.forward()
end

---Same as robot.forward() except that the robot tries to move backward.
---@return boolean, string?
function robot.back()
end

---Same as robot.forward() except that the robot tries to move up.
---@return boolean, string?
function robot.up()
end

---Same as robot.forward() except that the robot tries to move down.
---@return boolean, string?
function robot.down()
end

---Turns the robot 90° to the left.
function robot.turnLeft()
end

---Turns the robot 90° to the right.
function robot.turnRight()
end

---This is the same as calling robot.turnRight twice.
function robot.turnAround()
end

---The number of tanks installed in the robot.
---@return number
function robot.tankCount()
end

---Select the specified tank. This determines which tank most operations operate on.
---@param tank number
function robot.selectTank(tank)
end

---The the current fluid level in the specified tank, or, if none is specified, the selected tank.
---@param tank number
---@return number
function robot.tankLevel(tank)
end

---The the remaining fluid capacity in the specified tank, or, if none is specified, the selected tank.
---@return number
function robot.tankSpace()
end

---Tests whether the fluid in the selected tank is the same as in the specified tank.
---@param tank number
---@return boolean
function robot.compareFluidTo(tank)
end

---Transfers the specified amount of fluid from the selected tank into the specified tank. If no volume is specified, tries to transfer 1000 mB.
---@param tank number
---@param count? number
---@return boolean
function robot.transferFluidTo(tank, count)
end

---Tests whether the fluid in the selected tank is the same as in the world or the tank in front of the robot.
---@return boolean
function robot.compareFluid()
end

---Like compareFluid, but operates on the block above the robot.
---@return boolean
function robot.compareFluidUp()
end

---Like compareFluid, but operates on the block below the robot.
---@return boolean
function robot.compareFluidDown()
end

---Extracts the specified amount of fluid from the world or the tank in front of the robot. 
---When no amount is specified, will try to drain 1000 mB. 
---When the drained fluid is in the world and it cannot be fully stored in the selected tank, the operation fails.
---@param count? number
---@return boolean
function robot.drain(count)
end

---Like drain, but operates on the block above the robot.
---@param count? number
---@return boolean
function robot.drainUp(count)
end

---Like drain, but operates on the block below the robot.
---@param count? number
---@return boolean
function robot.drainDown(count)
end

---Injects the specified amount of fluid from the selected tank into the the world or the tank in front of the robot. 
---When no amount is specified, will try to eject 1000 mB. 
--- When there is not enough fluid to fill a block, or the target tank does not have enough room, the operation fails.
---@param count? number
---@return boolean
function robot.fill(count)
end

---Like fill, but operates on the block above the robot.
---@param count? number
---@return boolean
function robot.fillUp(count)
end

---Like fill, but operates on the block below the robot.
---@param count? number
---@return boolean
function robot.fillDown(count)
end
return robot