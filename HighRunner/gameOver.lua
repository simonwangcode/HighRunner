local composer = require( "composer" )

local scene = composer.newScene()

display.setStatusBar (display.HiddenStatusBar)
-- -----------------------------------------------------------------------------------------------------------------
-- All code outside of the listener functions will only be executed ONCE unless "composer.removeScene()" is called
-- -----------------------------------------------------------------------------------------------------------------

-- Local forward references should go here

-- -------------------------------------------------------------------------------


-- "scene:create()"
function scene:create( event )

    local sceneGroup = self.view
	display.setStatusBar (display.HiddenStatusBar)
	local contentWidth = display.contentWidth
	local contentHeight = display.contentHeight
	local background = display.newRect(contentWidth/2, contentHeight/2, contentWidth, contentHeight)
	background:setFillColor(1,1,1)
	sceneGroup:insert(background)
	local heading = display.newText("You tripped!", contentWidth/2, 55, Arial, 40)
	heading:setFillColor(0,0,0)
	sceneGroup:insert(heading)
	local button = display.newImage("blunt2.jpg")
	button.xScale = 0.2
	button.yScale = 0.2
	button.x = contentWidth/2
	button.y = contentHeight/2
	sceneGroup:insert(button)
	local footer = display.newText("Tap the blunt to play again", contentWidth/2, contentHeight - 45, Arial, 20)
	footer:setFillColor(0,0,0)
	sceneGroup:insert(footer)
	local back = display.newImage("back.png")
	back.x = contentWidth - 30
	back.y = 250
	back.xScale = 0.1
	back.yScale = 0.1
	sceneGroup:insert(back)
	function nextScene(event)
		composer.gotoScene("game1")
	end
	function animate(event)
		if (event.phase == "began") then
			transition.to(button, {y = contentHeight/2 - 20, time = 180})
		end		
		if (event.phase == "ended") then
			transition.to(button, {y = contentHeight/2, time = 180, onComplete = nextScene})
		end		
	end
	function returnToMenu (event)
		if (event.phase == "ended") then
			composer.gotoScene("menu")
		end
	end
	button:addEventListener("touch", animate)
	back:addEventListener("touch", returnToMenu)
    -- Initialize the scene here
    -- Example: add display objects to "sceneGroup", add touch listeners, etc.
end


-- "scene:show()"
function scene:show( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Called when the scene is still off screen (but is about to come on screen)
    elseif ( phase == "did" ) then
        -- Called when the scene is now on screen
        -- Insert code here to make the scene come alive
        -- Example: start timers, begin animation, play audio, etc.

    end
end


-- "scene:hide()"
function scene:hide( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Called when the scene is on screen (but is about to go off screen)
        -- Insert code here to "pause" the scene
        -- Example: stop timers, stop animation, stop audio, etc.
    elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen
    end
end


-- "scene:destroy()"
function scene:destroy( event )

    local sceneGroup = self.view

    -- Called prior to the removal of scene's view
    -- Insert code here to clean up the scene
    -- Example: remove display objects, save state, etc.
end


-- -------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-- -------------------------------------------------------------------------------

return scene