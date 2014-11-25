local StartNode = class("StartNode", function()
	return display.newNode()
end)

function StartNode:ctor()
	--背景
	audio.preloadMusic("backMusic.mp3")
	audio.playMusic("backMusic.mp3")
	local bg = display.newSprite("MainMenu.png")
	bg:setAnchorPoint(ccp(0, 0))
	bg:setScaleX(display.width/bg:getContentSize().width)
	bg:setScaleY(display.height/bg:getContentSize().height)
	bg:setPosition(ccp(0, 0))
	self:addChild(bg, 0)

	--开始按钮
	local start_btn = cc.ui.UIPushButton.new({normal = "button/PlayMenu.png"},{scale9 = true})
		start_btn:setScale(1.3)
		start_btn:setPosition(ccp(display.cx - 150, display.cy + 90))
		self:addChild(start_btn, 0)

		start_btn:onButtonClicked(function(event)
			gameScene = require("app.scenes.GameScene").new()
			CCDirector:sharedDirector():replaceScene(gameScene)
		end)

	--音乐开关按钮
	 isPlayMusic = true
	local music_btn = cc.ui.UICheckBoxButton.new({ on = "button/soundController.png", off = "button/soundController2.png"})	
	music_btn:setPosition(ccp(50, 50))
	music_btn:onButtonStateChanged(function(event)
		if event.state == "on" then
			if isPlayMusic == false then
				audio.resumeMusic()
				isPlayMusic = true
			end

			elseif event.state == "off" then
				if isPlayMusic == true then
					audio.pauseMusic()
					isPlayMusic = false
				end

		end
	end)
	music_btn:setButtonSelected(true)
	self:addChild(music_btn, 0)

end

return StartNode