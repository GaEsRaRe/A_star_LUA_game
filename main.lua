-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------


--requiere files

require("code")


-- Your code here

local physics = require( "physics" )
local widget = require("widget")
physics.start()

local posx = start[1]
local posy = start[2]
--we load a temporal background
background = display.newImageRect( "background.jpg", 360, 570 )


background.x = display.contentCenterX
background.y = display.contentCenterY



--we load the map based on a mapping

grid = {}
obstacles = {}
mapping = {}
for n = 1,8 do
  grid[n] = {}
  obstacles[n] = {}
  mapping[n] = {}
end
for n = 1,8 do
  for m = 1,8 do
    grid[n][m] = display.newImageRect("player.png",30,30)
    grid[n][m].x = display.contentWidth/ 20 + (n * 30)
    grid[n][m].y = display.contentHeight /20 + (m * 30)
  end

end


--now we add the obstacles

for n = 1,8 do
  for m = 1,8 do
    if map1[n][m] == 1 then
      obstacles[n][m] = display.newImageRect("/Pictures/Map/obstacle.png",30,30)
      obstacles[n][m].x = display.contentWidth/ 20 + (n * 30)
      obstacles[n][m].y = display.contentHeight /20 + (m * 30)
    end

  end
end



local player = display.newImageRect("/Pictures/Tank/player.png",30,30)

player.x = display.contentWidth/ 20 + (start[1] * 30)
player.y = display.contentHeight /20 + (start[2] * 30)

--we program the interface
local myText = display.newText( "Trying!", 0, 0, native.systemFont, 40 )
myText.x = display.contentWidth / 2
myText.y = display.contentWidth / 4
myText:setTextColor( 255,0,0 )


--button

local function handleButtonEvent(event)
  local phase = event.phase
  if "ended" == phase then
    for n = 1,#path do
      mapping[n] = display.newImageRect("/Pictures/Map/obstacle.png",30,30)
      mapping[n].x = display.contentWidth/ 20 + (path[n][1] * 30)
      mapping[n].y = display.contentHeight /20 + (path[n][2] * 30)
      mapping[n].alpha = 0.4


    end
  end
end


local accept = widget.newButton
{
  left = display.contentWidth / 2,
  top = display.contentWidth - (display.contentWidth / 30),
  width = 150,
  height = 50,
  defaultFile = "/Pictures/GUI/calculate.png",
  --overFile = "over.png",
  label = "Press to Generate",
  onEvent = handleButtonEvent,


}




local function where_to_move() --insert where you tap so you can decide where to move in the map

  --you should get an x and y position
end


local function pushBalloon()
  player.x = player.x + 1
end

local function move()


end



player:addEventListener( "tap", pushBalloon )