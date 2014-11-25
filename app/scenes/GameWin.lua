local  GameWin = class("GameWin", function ()
	return display.newScene("GameWin")
end)

function GameWin:ctor()
	ui.newTTFLabel({text = "Game Win", size = 64, align = ui.TEXT_ALIGN_CENTER})
        :pos(display.cx, display.cy + 120)
        :addTo(self)
    system = CCParticleSystemQuad()
    system:initWithFile("fengye.plist")
    system:setBlendAdditive(true)
    system:setPosition(ccp(display.cx, display.cy))
    self:addChild(system)

    local function newGame()
    	scene = require("app.myClass.StartNode").new()
    	self:addChild(scene)
    end
    	print("1")
    local function endGame()
        os.exit(0)
    	print("2")
    end
    lb = CCMenuItemFont:create("New Game")
    lb:setPosition(ccp(display.cx, display.cy))
    lb:registerScriptTapHandler(newGame)

    lb1 = CCMenuItemFont:create("end Game")
    lb1:setPosition(ccp(display.cx, display.cy-40))
    lb1:registerScriptTapHandler(endGame)
    local menu = ui.newMenu({lb, lb1})
    self:addChild(menu)
end

return GameWin