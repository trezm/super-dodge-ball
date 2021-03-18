   
 //  screen.drawSprite("speed.1", player5.cloneX, floory+floorh/2+player5.cloneY+ 40/2, 40, 40)

   player5.cloneVY = player5.cloneVY -0.3

   player5.cloneY = max(0, player5.cloneY+player5.cloneVY) 
   player5.cloneX= player5.cloneX + player5.cloneVX
   

   if player5.cloneX + 12 >= 190 then 
     
     player5.cloneVX = -12
   elsif  
     
     player5.cloneX - 12 <= -190 then 
        player5.cloneVX = 12

     end 

  //          screen.fillRect(player5.cloneX,player5.cloneY+ 40, 20, 5, "black")

//screen.fillRect(player5.speedx+player5.cloneX,player5.cloneY + 40, player5.speedw, 5, "red")
   
  // screen.fillRect(player5.cloneX, player5.cloneY+ 30, player5.healthBarWidth, 5, "black")
//screen.fillRect(player5.hx+player5.cloneX, player5.cloneY+ 30, player5.hw, 5, "green")



Player = class
constructor = function(left, right, up, shoot, facing, startx, health, speed)
  this.left = left
  this.right = right
  this.up = up
  this.w = 40
  this.h = 40
  this.shoot =shoot
  this.facing = facing
  this.x= startx
  this.go = 0
  this.y =100
  this.maxhealth= health 
  this.health = health 
  this.healthBarWidth= 20
  this.shield = 1
  this.originalSpeed= speed 
  this.speed=this.originalSpeed
  this.originalGravity = 0.3
  this.gravity = this.originalGravity
  this.grappled= 1
  this.jump = 7 
  this.lives = LIVES
  this.movingy =0
end



  move = function()
if (keyboard[this.up] and this.y == 0 or keyboard[this.up]  and this.moving ==1 and this.movingy==1) then

    this.vy = this.jump
    
      end
      
if  keyboard[this.left] and this.x >=- 190 then 
    this.facing =-1
     this.vx=-this.speed
elsif
     keyboard[this.right] and this.x <= 190 then 
  this.facing =1
     this.vx=this.speed
elsif this.moving ==1 then 
  else 
  this.vx =0
  end
 if this.moving != 1 then
this.vy = this.vy -this.gravity


this.y = max(0, this.y+this.vy) 
else 
  this.vy = this.vy -this.gravity


this.y = max(platformY+this.h+this.h, this.y+this.vy) 
  
  
  
end 
this.x += this.vx
// health 
if this.health> -1 then
this.percenthealth = (this.health/this.maxhealth)*this.healthBarWidth
this.hw = this.percenthealth
this.hx = (this.healthBarWidth-this.percenthealth)/-2
end 
if this.health<=0 and this.lives>=1 then 
  this.health = this.maxhealth
  this.lives = this.lives -1   

end 
//this.middle = 
end
  
  
  draw = function()
    if this.l != 0 then else 

  if this.facing ==0 then this.sx= "sprite.0"else
  if this.facing ==-1 then this.sx = "sprite.1" else 
    if this.facing ==1 then this.sx = "sprite.2" else 
      if this.facing ==3 then this.sx = "sprite.3"else
        if this.facing ==4 then this.sx = "sprite.4" end end end end end end
//draws player
      screen.drawSprite(this.sx, this.x, floory+floorh/2+this.y+ this.h/2, this.w, this.h, "blue")
//draws healthbar
 screen.fillRect(this.x, floory+floorh/2+this.y+ this.h/2 + 30, this.healthBarWidth, 5, "black")
screen.fillRect(this.hx+this.x, floory+floorh/2+this.y+ this.h/2 + 30, this.hw, 5, "green")

  end
  
  

  
end