local GameOver = class("GameOver", function()
	return display.newScene("GameOver")
end)

StartNode = require("app.myClass.StartNode")
--GameScene = require("app.scenes.GameScene")

	function GameOver:ctor()
		ui.newTTFLabel({text = "Game Over", size = 64, align = ui.TEXT_ALIGN_CENTER})
        :pos(display.cx, display.cy + 120)
        :addTo(self)
local function onClicked(tag)
	if tag == 1 then
		scene = require("app.scenes.GameScene").new()
		CCDirector:sharedDirector():replaceScene(scene)
		print("1")
	end
	if tag == 2 then
		local  startNode = StartNode.new()
        self:addChild(startNode)
		print("2")
	end
end

        local item1 = ui.newTTFLabelMenuItem({
        	text = "重新开始",
        	font = "Arial",
        	size = 24,
        	aligh = ui.TEXT_ALIGN_CENTER,
        	listener = onClicked,
        	x = display.cx,
        	y = display.cy,
        	tag =1
        	})
        local item2 = ui.newTTFLabelMenuItem({
        	text = "返回开始界面",
        	size = 24,
        	aligh = ui.TEXT_ALIGN_CENTER,
        	listener = onClicked,
        	x = display.cx,
        	y = display.cy-40,
        	tag =2
        	})
        local menu = ui.newMenu({item1, item2})
        self:addChild(menu)
	end
return GameOver