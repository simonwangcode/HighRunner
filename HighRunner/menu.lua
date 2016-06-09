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
	local buttonTaps = 0
	local hitsFromTheBong = audio.loadSound("hftb.mp3")
	audio.setVolume(1.0)
	local bgMusic = audio.play(hitsFromTheBong, {loops = -1})
    local sceneGroup = self.view
	display.setStatusBar (display.HiddenStatusBar)
	local contentWidth = display.contentWidth
	local contentHeight = display.contentHeight
	local background = display.newRect(contentWidth/2, contentHeight/2, contentWidth, contentHeight)
	sceneGroup:insert(background)
	background:setFillColor(1,1,1)
	local heading = display.newText("High Runner", contentWidth/2, 55, Arial, 40)
	heading:setFillColor(0,0,0)
	sceneGroup:insert(heading)
	local stoner = display.newImage("stoner.jpg")
	sceneGroup:insert(stoner)
	stoner.x = contentWidth/2 - 60
	stoner.y = contentHeight/2
	local startBlunt = display.newImage("blunt.jpg")
	startBlunt.xScale = 0.1
	startBlunt.yScale = 0.1
	startBlunt.x = stoner.x + stoner.width - 105
	startBlunt.y = stoner.y - 45
	startBlunt:scale(1, -1)
	sceneGroup:insert(startBlunt)
	local group = display.newGroup()
	group:insert(stoner)
	group:insert(startBlunt)
	group.x = group.x + 30
	group.y = group.y + 15
	sceneGroup:insert(group)
	local soundButton1 = display.newImage("soundOn.jpg")
	soundButton1.x = 20
	soundButton1.y = contentHeight - 45
	soundButton1.xScale = 0.15
	soundButton1.yScale = 0.15
	sceneGroup:insert(soundButton1)
	local soundButton2 = display.newImage("soundOff.jpg")
	soundButton2.x = 20
	soundButton2.y = contentHeight - 45
	soundButton2.xScale = 0.15
	soundButton2.yScale = 0.15
	soundButton2.isVisible = false
	sceneGroup:insert(soundButton2)
	local instructions = display.newImage("instructions.png")
	instructions.x = contentWidth - 20
	instructions.y = contentHeight - 45
	instructions.xScale = 0.1
	instructions.yScale = 0.1
	sceneGroup:insert(instructions)
	function rotate2 (event)
		transition.to(group, {rotation = 3, time = 1300, onComplete = rotate1})
	end
	function rotate1(event)
		transition.to(group, {rotation = -3, time = 1300, onComplete = rotate2})
	end
	transition.to(group, {rotation = 2, time = 1300, onComplete = rotate1})
	local footer = display.newText("Tap the blunt to start", contentWidth/2, contentHeight - 45, Arial, 20)
	footer:setFillColor(0,0,0)
	transition.blink(footer, {time = 1340})
	sceneGroup:insert(footer)
	
	function nextScene(event)
		composer.gotoScene("game1")
	end
	function animateBlunt(event)
		if (event.phase == "began") then
			transition.to(startBlunt, {x = stoner.x + stoner.width - 95, y = stoner.y - 55, time = 100})
		end		
		if (event.phase == "ended") then
			transition.to(startBlunt, {x = stoner.x + stoner.width - 105, y = stoner.y - 45, time = 100, onComplete = nextScene})
		end		
	end
	function animateSound(event)
		buttonTaps = buttonTaps + 1
		if (buttonTaps % 2 == 0) then
			audio.setVolume(1.0)
			soundButton1.isVisible = true
			soundButton2.isVisible = false
			
		else
			audio.setVolume(0.0)
			soundButton1.isVisible = false
			soundButton2.isVisible = true
		end
	end
	function goToInstructions(event)
		composer.gotoScene("instructions")
	end
	startBlunt:addEventListener("touch", animateBlunt)
	soundButton1:addEventListener("tap", animateSound)
	soundButton2:addEventListener("tap", animateSound)
	instructions:addEventListener("tap", goToInstructions)

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