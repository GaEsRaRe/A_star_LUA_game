-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
local physics = require( "physics" )
physics.start()
--we load a temporal background
background = display.newImageRect( "background.jpg", 360, 570 )
local player = display.newImageRect("player.png",80,80)


background.x = display.contentCenterX
background.y = display.contentCenterY

player.x = display.contentCenterX
player.y = display.contentCenterY
player.alpha = 0.5

--we program the interface
local myText = display.newText( "Trying!", 0, 0, native.systemFont, 40 )
myText.x = display.contentWidth / 2
myText.y = display.contentWidth / 4
myText:setTextColor( 255,0,0 )


local function where_to_move() --insert where you tap so you can decide where to move in the map
  
    --you should get an x and y position
  end


local function pushBalloon()
    player.x = player.x + 1
end

player:addEventListener( "tap", pushBalloon )