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
	local speed = 5
	local randomNum = 50
	local taps = 0
	local gameOver = false
	local scoreCount = 0


	local background = display.newRect (contentWidth/2, contentHeight/2, contentWidth, contentHeight)
	background:setFillColor(1,1,0)
	sceneGroup:insert(background)

	local ground = display.newRect (contentWidth / 2, contentHeight, contentWidth, contentHeight / 3)
	ground:setFillColor(0,0,0)
	sceneGroup:insert(ground)

	local bluntSheet = graphics.newImageSheet ("blunt1.png", {width = 50, height = 30, numFrames = 7, sheetContentWidth = 383, sheetContentHeight = 30})
	local sequence2 =
	{
		{name = "running", start = 1, count = 8, time = 600, loopDirection = "bounce"}, 
		{name = "jumping", start = 8, count = 8, time = 0},
		{name = "falling", start = 8, count = 8, time = 0}
	}
	local blunt = display.newSprite(bluntSheet, sequence2)
	sceneGroup:insert(blunt)
	blunt.x = 80 + 100
	blunt.y = contentHeight - 93 - ground.height /2 + 45
	blunt:play()
	
	local spriteSheet = graphics.newImageSheet ("sprite1.png", {width = 100, height = 93, numFrames = 7})
	local sequence1 =
	{
		{name = "running", start = 1, count = 7, time = 600}, 
		{name = "jumping", start = 7, count = 7, time = 0},
		{name = "falling", start = 7, count = 7, time = 0}
	}
	local sprite = display.newSprite (spriteSheet, sequence1)
	sceneGroup:insert(sprite)
	sprite.anchorX = 0
	sprite.anchorY = 0
	sprite.x = 100
	sprite.y = contentHeight - sprite.height - ground.height /2
	sprite:play()

	local obstacle1 = display.newRect(contentWidth + 100, contentHeight - ground.height /2 - 10, 50, 20)
	sceneGroup:insert(obstacle1)
	obstacle1:setFillColor(1,0,0)
	obstacle1.anchorX = 0
	local obstacle2 = display.newRect(obstacle1.x + randomNum, contentHeight - ground.height / 2 - 10, 50, 20)
	sceneGroup:insert(obstacle2)
	obstacle2:setFillColor(0,1,0)
	obstacle2.anchorX = 0
	local obstacle3 = display.newRect(obstacle2.x + randomNum, contentHeight - ground.height / 2 - 10, 50, 20)
	sceneGroup:insert(obstacle3)
	obstacle3:setFillColor(0,0,1)
	obstacle3.anchorX = 0
	obstacle1.enterFrame = gameLoop
	obstacle2.enterFrame = gameLoop
	obstacle3.enterFrame = gameLoop
	local scoreBoard = display.newText(scoreCount, contentWidth/2, 75, Arial, 30)
	sceneGroup:insert(scoreBoard)
	scoreBoard:setFillColor(0,0,0)
	

    -- Initialize the scene here
    -- Example: add display objects to "sceneGroup", add touch listeners, etc.
end


-- "scene:show()"
function scene:show( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Called when the scene is still off screen (but is about to come on screen)
		local contentWidth = display.contentWidth
		local contentHeight = display.contentHeight
		local speed = 5
		local randomNum = 300
		local taps = 0
		local gameOver = false
		local scoreCount = 0		
		local background = display.newRect (contentWidth/2, contentHeight/2, contentWidth, contentHeight)
		background:setFillColor(1,1,1)
		sceneGroup:insert(background)
		local ground = display.newRect (contentWidth / 2, contentHeight, contentWidth, contentHeight / 3)
		ground:setFillColor(0,0,0)
		sceneGroup:insert(ground)
		local obstacle1 = display.newRect(contentWidth, contentHeight - ground.height /2 - 10, 50, 20)
		sceneGroup:insert(obstacle1)
		obstacle1:setFillColor(0,0,0)
		obstacle1.anchorX = 0
		local obstacle2 = display.newRect(obstacle1.x + randomNum, contentHeight - ground.height / 2 - 10, 50, 20)
		sceneGroup:insert(obstacle2)
		obstacle2:setFillColor(0,0,0)
		obstacle2.anchorX = 0
		local obstacle3 = display.newRect(obstacle2.x + randomNum, contentHeight - ground.height / 2 - 10, 50, 20)
		sceneGroup:insert(obstacle3)
		obstacle3:setFillColor(0,0,0)
		obstacle3.anchorX = 0
		local obstacle4 = display.newRect(obstacle3.x + randomNum, contentHeight - ground.height / 2 - 10, 50, 20)
		sceneGroup:insert(obstacle4)
		obstacle4:setFillColor(0,0,0)
		obstacle4.anchorX = 0
		local obstacle5 = display.newRect(obstacle4.x + randomNum, contentHeight - ground.height / 2 - 10, 50, 20)
		sceneGroup:insert(obstacle5)
		obstacle5:setFillColor(0,0,0)
		obstacle5.anchorX = 0
		obstacle1.enterFrame = gameLoop
		obstacle2.enterFrame = gameLoop
		obstacle3.enterFrame = gameLoop
		obstacle4.enterFrame = gameLoop
		obstacle5.enterFrame = gameLoop
    elseif ( phase == "did" ) then
        -- Called when the scene is now on screen
        -- Insert code here to make the scene come alive
        -- Example: start timers, begin animation, play audio, etc.
		display.setStatusBar (display.HiddenStatusBar)
		local contentWidth = display.contentWidth
		local contentHeight = display.contentHeight
		local speed = 5
		local randomNum = 300
		local taps = 0
		local gameOver = false
		local scoreCount = 0


		local background = display.newRect (contentWidth/2, contentHeight/2, contentWidth, contentHeight)
		background:setFillColor(1,1,1)
		sceneGroup:insert(background)

		local ground = display.newRect (contentWidth / 2, contentHeight, contentWidth, contentHeight / 3)
		ground:setFillColor(0,0,0)
		sceneGroup:insert(ground)
		
		local bluntSheet = graphics.newImageSheet ("blunt1.png", {width = 50, height = 30, numFrames = 7, sheetContentWidth = 383, sheetContentHeight = 30})
		local sequence2 =
		{
			{name = "running", start = 1, count = 8, time = 600, loopDirection = "bounce"}, 
			{name = "jumping", start = 8, count = 8, time = 0},
			{name = "falling", start = 8, count = 8, time = 0}
		}
		local blunt = display.newSprite(bluntSheet, sequence2)
		sceneGroup:insert(blunt)
		blunt.x = 80 + 100
		blunt.y = contentHeight - 93 - ground.height /2 + 45
		blunt:play()
	
		local spriteSheet = graphics.newImageSheet ("sprite1.png", {width = 100, height = 93, numFrames = 7})
		local sequence1 =
		{
			{name = "running", start = 1, count = 7, time = 600}, 
			{name = "jumping", start = 7, count = 7, time = 0},
			{name = "falling", start = 7, count = 7, time = 0}
		}
		local sprite = display.newSprite (spriteSheet, sequence1)
		sceneGroup:insert(sprite)
		sprite.anchorX = 0
		sprite.anchorY = 0
		sprite.x = 100
		sprite.y = contentHeight - sprite.height - ground.height /2
		sprite:play()

		local obstacle1 = display.newRect(contentWidth + 100, contentHeight - ground.height /2 - 10, 50, 20)
		sceneGroup:insert(obstacle1)
		obstacle1:setFillColor(0,0,0)
		obstacle1.anchorX = 0
		local obstacle2 = display.newRect(obstacle1.x + randomNum, contentHeight - ground.height / 2 - 10, 50, 20)
		sceneGroup:insert(obstacle2)
		obstacle2:setFillColor(0,0,0)
		obstacle2.anchorX = 0
		local obstacle3 = display.newRect(obstacle2.x + randomNum, contentHeight - ground.height / 2 - 10, 50, 20)
		sceneGroup:insert(obstacle3)
		obstacle3:setFillColor(0,0,0)
		obstacle3.anchorX = 0
		local obstacle4 = display.newRect(obstacle3.x + randomNum, contentHeight - ground.height / 2 - 10, 50, 20)
		sceneGroup:insert(obstacle4)
		obstacle4:setFillColor(0,0,0)
		obstacle4.anchorX = 0
		local obstacle5 = display.newRect(obstacle4.x + randomNum, contentHeight - ground.height / 2 - 10, 50, 20)
		sceneGroup:insert(obstacle5)
		obstacle5:setFillColor(0,0,0)
		obstacle5.anchorX = 0
		obstacle1.enterFrame = gameLoop
		obstacle2.enterFrame = gameLoop
		obstacle3.enterFrame = gameLoop
		obstacle4.enterFrame = gameLoop
		obstacle5.enterFrame = gameLoop
		local scoreBoard = display.newText(scoreCount, contentWidth/2, 75, Arial, 45)
		sceneGroup:insert(scoreBoard)
		scoreBoard:setFillColor(0,0,0)
		function gameLoop (event)
			scoreBoard.text = scoreCount
			if (gameOver == false) then
				if (obstacle1.x < -50) then
					randomNum = math.random(200,600)
					obstacle1.x = obstacle5.x + randomNum 		
				else
					obstacle1.x = obstacle1.x - speed
				end
				if (obstacle2.x < -50) then
					randomNum = math.random(200,600)
					obstacle2.x = obstacle1.x + randomNum
				else
					obstacle2.x = obstacle2.x - speed
				end
				if (obstacle3.x < -50) then
					randomNum = math.random(200,600)
					obstacle3.x = obstacle2.x + randomNum
				else
					obstacle3.x = obstacle3.x - speed
				end
				if (obstacle4.x < -50) then
					randomNum = math.random(200,600)
					obstacle4.x = obstacle3.x + randomNum
				else
					obstacle4.x = obstacle4.x - speed
				end
				if (obstacle5.x < -50) then
					randomNum = math.random(200,600)
					obstacle5.x = obstacle4.x + randomNum
				else
					obstacle5.x = obstacle5.x - speed
				end
				if ((obstacle1.x + obstacle1.width >= sprite.x + 10 and obstacle1.x <= sprite.x + sprite.width - 35) and sprite.y + sprite.height >= contentHeight - ground.height/2 - 20) then
					onCollision()
				end
				if ((obstacle2.x + obstacle2.width >= sprite.x + 10 and obstacle2.x <= sprite.x + sprite.width - 35) and sprite.y + sprite.height >= contentHeight - ground.height/2 - 20) then
					onCollision()
				end
				if ((obstacle3.x + obstacle3.width >= sprite.x + 10 and obstacle3.x <= sprite.x + sprite.width - 35) and sprite.y + sprite.height >= contentHeight - ground.height/2 - 20) then
					onCollision()
				end
				if ((obstacle4.x + obstacle4.width >= sprite.x + 10 and obstacle4.x <= sprite.x + sprite.width - 35) and sprite.y + sprite.height >= contentHeight - ground.height/2 - 20) then
					onCollision()
				end
				if ((obstacle5.x + obstacle5.width >= sprite.x + 10 and obstacle5.x <= sprite.x + sprite.width - 35) and sprite.y + sprite.height >= contentHeight - ground.height/2 - 20) then
					onCollision()
				end
			end
		end
		function jump (event)
			if (gameOver == false) then
				if (taps == 0) then
					if (event.phase == "began") then
						taps = taps + 1
						sprite:setSequence("jumping")
						sprite:play()
						blunt:setSequence("jumping")
						blunt:play()
						transition.to(blunt, {x = 75 + sprite.width, y = sprite.y - 55, time = 600})
						transition.to(blunt, {x = 80 + sprite.width, y = sprite.y + 45, time = 600, delay = 600})
						transition.to(sprite, {y = contentHeight - ground.height / 2 - sprite.height - 100, time = 600})
						transition.to(sprite, {y = contentHeight - ground.height / 2 - sprite.height, time = 600, delay = 600, onComplete = resumeRunning})
					end
				end
			end
		end
		function resumeRunning (event)
			if (gameOver == false) then
				if (obstacle1.x + obstacle1.width <= sprite.x or obstacle2.x + obstacle2.width <= sprite.x or obstacle3.x + obstacle3.width <= sprite.x or obstacle4.x + obstacle4.width <= sprite.x or obstacle5.x + obstacle5.width <= sprite.x) then
					scoreCount = scoreCount + 1
				end
				taps = 0
				sprite:setSequence("running")
				sprite:play()
				blunt:setSequence("running")
				blunt:play()
			end
		end
		function gameOverScreen()
			composer.gotoScene("gameOver")
		end
		function onCollision()
			gameOver = true
			sprite:setSequence("falling")
			sprite:play()
			transition.to(sprite, {x = 200, y = contentHeight - ground.height / 2 - 180, rotation = 40, time = 333})
			transition.to(sprite, {x = 300, y = contentHeight - ground.height / 2 - 72, rotation = 52, time = 333, delay = 333})
			blunt:setSequence("falling")
			blunt:play()
			transition.to(blunt, {x = 300, y = contentHeight - ground.height / 2 - 220, rotation = 45, time = 333})
			transition.to(blunt, {x = 400, y = contentHeight - ground.height / 2, rotation = 80, time = 333, delay = 333, onComplete = gameOverScreen})	
		end
		Runtime:addEventListener ("enterFrame", gameLoop)
		Runtime:addEventListener("touch", jump)
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



