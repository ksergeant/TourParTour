-- Cette ligne permet d'afficher des traces dans la console pendant l'éxécution
io.stdout:setvbuf('no')

-- Empèche Love de filtrer les contours des images quand elles sont redimentionnées

-- Indispensable pour du pixel art
love.graphics.setDefaultFilter("nearest")

-- Cette ligne permet de déboguer pas à pas dans ZeroBraneStudio
if arg[#arg] == "-debug" then require("mobdebug").start() end

local myGame = require("Game")

local tableauCommand = "TabCommand :"
local command = "nul"

local Lander = {}
Lander.x = 0
Lander.y = 0
Lander.angle = 270
Lander.speed = 300
Lander.vx = 0
Lander.vy = 0
Lander.engineOn = false
Lander.img = love.graphics.newImage("images/Final_Ship.png")
Lander.imgEngine = love.graphics.newImage("images/Final_Engine.png")

local listeCommand = {}
local sprites = {}
local ListeTirs = {}
local tirs = {}

function CreeSprite(pNomImage, pX, pY)
  
  sprite = {}
  sprite.x = pX
  sprite.y = pY
  sprite.supprime = false
  sprite.image = love.graphics.newImage("images/"..pNomImage..".png")
  sprite.l = sprite.image:getWidth()
  sprite.h = sprite.image:getHeight()
  
  table.insert(sprites, sprite)
  
  return sprite
  
end

function love.load()

  largeur = love.graphics.getWidth()
  hauteur = love.graphics.getHeight()
  
  Lander.x = 50+25
  Lander.y = 50+25
  
  map = {
          {1,1,1,1,1,1,1,1,1,1,1,1,1,1},
          {1,1,1,1,1,1,1,1,1,1,1,1,1,1},
          {1,1,1,1,1,1,1,1,1,1,1,1,1,1},
          {1,1,1,1,1,1,1,1,1,1,1,1,1,1},
          {1,1,1,1,1,1,1,1,1,1,1,1,1,1},
          {1,1,1,1,1,1,1,1,1,1,1,1,1,1},
          {1,1,1,1,1,1,1,1,1,1,1,1,1,1},
          {1,1,1,1,1,1,1,1,1,1,1,1,1,1},
          {1,1,1,1,1,1,1,1,1,1,1,1,1,1},
          {1,1,1,1,1,1,1,1,1,1,1,1,1,1},


    }
  
end

function love.update(dt)
  
       -- Purge des sprites à supprimer
  for n=#sprites,1,-1 do
    if sprites[n].supprime == true then
      table.remove(sprites,n)
    end
  end

end
  
  


function love.draw()
  
  local n
  for n=1,#sprites do
    
    
    local s = sprites[n]
    love.graphics.draw(s.image, s.x, s.y, 0, 2, 2, s.l/2, s.h/2)
  end
  
   
   for y=1, #map do
      for x=1, #map[y] do
        if map[y][x] == 1 then
          love.graphics.rectangle("line", x*50, y*50,50,50)
        end
      end
    end
    
   
   
   love.graphics.draw(Lander.img, Lander.x, Lander.y, 
      math.rad(Lander.angle), 1, 1, Lander.img:getWidth()/2, Lander.img:getHeight()/2)
    
    local sDebug = " Debug:"
    sDebug = sDebug.. " x="..tostring(Lander.x)
    sDebug = sDebug.. " y="..tostring(Lander.y)
    local Tab = "Tab"
    Tab = Tab.. "command="..tostring(command)

    love.graphics.print(sDebug,0,0)
    love.graphics.print(Tab,815, 30)
    
    love.graphics.rectangle("fill", 752, 450, 250,50)
    love.graphics.setColor(1,0,0,100)
    love.graphics.print("Lancement",842, 470)
    love.graphics.setColor(255,255,255,100)
end


function love.keypressed(key)
  
  if key == "up" then
    Lander.y =  Lander.y - 50
    if Lander.y < 50 then
       Lander.y = 75
    end
  command = "up"
    print(key)
  end

  if key == "down" then
    Lander.y =  Lander.y + 50
    if Lander.y > 450 then
       Lander.y = 475
    end
    command = "down"
    print(key)
  end

  if key == "left" then
    Lander.x =  Lander.x - 50
    if Lander.x < 50 then
       Lander.x = 75
    end
    command = "left"
    print(key)
  end

  if key == "right" then
    Lander.x =  Lander.x + 50
    if Lander.x > 700 then
       Lander.x = 725
    end
    command = "right"
    print(key)
  end

  if key == "space" then
    
    
  end

end  