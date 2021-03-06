


function love.load()

love.window.setMode(800, 600, {resizable=true, vsync=false, minwidth=400, minheight=300})


	bgImage=love.graphics.newImage("backgrounds/Cloudsville.png")

  loveframes=require("libs.LoveFrames")
	
	require("game-explore")

	math.randomseed(os.time())

	love.keyboard.setKeyRepeat(false)

  loveframes.SetState("mainmenu")
	frame = loveframes.Create("frame")
	frame:SetName("MAIs cradle MAIN MENU")
	frame:SetResizable(true)
	frame:Center()
	frame:ShowCloseButton(false)
	local text=loveframes.Create("text", frame)
	text:SetText("Welcome To MAIs Cradle!")
	text.Update = function(object,dt)
		object:CenterX()
		object:SetY(40)
	end

	local singlePlayerButton = loveframes.Create("button", frame)
	singlePlayerButton:SetText("New Game"):SetWidth(100):Center()
	--singlePlayerButton.DrawColor={255,0,0,255}
	singlePlayerButton.OnClick = function(object)
    print("clicked")
		mainCharacter= newPony("sprites", 
		"w", love.keyboard.isDown,
		"s", love.keyboard.isDown,
		"a", love.keyboard.isDown,
		"d", love.keyboard.isDown,
		"lshift", love.keyboard.isDown,
		"space", love.keyboard.isDown,
		{"w","a","s","d"}, FC_double_key_only_one,
		"lshift",FC_double_key
	)	
		maingame=newExploreGame("levels/town.lua",mainCharacter,100,100)
		loveframes.SetState("game-explore")
	end

	frame:SetState("mainmenu")
  --singlePlayerButton.OnClick()
  

	require("libs.DialogueWindow")	

end

function love.resize(w,h)
	if maingame~=nil then
		maingame:resize(w,h)
	end
	frame:Center()
	dialogueWindow.resize()
end

function love.update(dt)
	if maingame~=nil then
		maingame:update(dt)
	end
	loveframes.update(dt)
	dialogueWindow.update(dt)
end

function love.draw()
	love.graphics.draw(bgImage,0,0,0,1,1,0,0)	
	if maingame~=nil then
		maingame:draw()
	end
	loveframes.draw()
end

function love.mousepressed(x,y,button)
	loveframes.mousepressed(x,y,button)
end

function love.mousereleased(x,y,button)

	loveframes.mousereleased(x,y,button)
end

function love.keypressed(key, unicode)
	if maingame~=nil then
		maingame:keypressed(key)
	end
	loveframes.keypressed(key,unicode)
end

function love.keyreleased(key)

	loveframes.keyreleased(key)
end

function love.textinput(text)

	loveframes.textinput(text)
end

