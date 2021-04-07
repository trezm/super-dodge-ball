sign = function(v)
    if abs(v) == v then
      return 1
    else
      return -1
    end
  end

  resetBall = function(damage)
          player.x += sign(ball.side) * 8
          player.y += 6
          ball.shoot = 0
          ball.x = ball.px
          ball.y = ball.py
          ball.shot =1
          player.health-= damage
    end

  newCollision = function(t)

    for playerIndex=0 to players.length-1
      player = players[playerIndex]
      // check if there's a collision, if there is then

      for ballIndex=0 to balls.length-1
        ball = balls[ballIndex]

  midPlayer = floory+floorh/2+player.y+ player.h/2
      if player.shield == 1 then hitX = 10 hitY = 20 elsif player.shield == 2 then hitX = 40  hitY = 40 end
        if abs(ball.x - player.x) < hitX and playerIndex != ballIndex and ball.shoot !=0 and abs(ball.y - midPlayer) <hitY then
          audio.beep("tempo 960 span 50 square volume 10 C6 C5")

        //if it's a charged ball player loses 50 health instead of 25

  //if you hit a shielded player with a charged ball, no damage is done and shield is broken
        if ball.superball ==1 and player.shield ==2 then resetBall(0)
          breakShield(player)

            elsif  player.shield ==2 then resetBall(0)
            player.shieldOpacity = player.shieldOpacity - 0.2


           elsif ball.superball == 1 then

                  resetBall(25)
                else
          resetBall(15)
          end
        end
      end
    end
  end









  dodgeball = class
   constructor = function(shootb, facing, px, py, speed, size)
     this.y = py
     this.size=size
  this.shootb = shootb
  this.facing = facing
  this.speed = speed
  this.w =0
  this.b = 1
  this.sprite = "ball"
  this.x = px
  this.ogspeed = speed
  this.superspeed = this.speed +2

  end

  dodgeupdate = function(px, py, facing)
    this.py =py
  this.facing = facing
  this.px = px

  //if  then the ball is charged.

    if this.superball==1 then
     //checks if b was pressed while the ball was shot

  this.speed = this.superspeed

  this.sprite = "energyball"


  else

    // these are all the defualt values for things when the ball is not supercharged.


  this.sprite = "ball"
   if fast ==2 then

     else

  this.speed = this.ogspeed
  end
    end


    if this.superball==1 then
        if this.shot == 1 then this.shot = 0 end
  else
    if this.shot ==1 then this.w = w +1     end


     if this.w%30 ==0 then
     this. shot = 0
      end

  if this.shot  == 0 then
    this.w=0 end
    end



    // basically defines which way the ball is going to shoot depending on which way the character is facing.

    if this.facing == 1 then this.side = 1 end
      if this.facing == -1 then this.side = -1  end
  if this.grappled != 2 then
    if keyboard[this.shootb] and this.shoot!= -1 and this.side == 1 and this.shot == 0 then
      this.shoot = 1

    else
      if keyboard[this.shootb] and this.shoot != 1 and this.side ==-1 and this.shot == 0 then
      this.shoot = -1

        end

    end
    end
  //shoots the ball right

    if this.shoot ==1  and this.shot ==0 then
  for this.i=1 to 400 by 1
          this.powerup2 =0
  this.powerup=0
    this.x=this.x+(0.01* this.speed)
    end
  end

  //shoots the ball left s

   if this.shoot ==-1 and this.shot ==0 then
  for this.i=1 to 400
    this.x=this.x-(0.01* this.speed)
       this.powerup2 =0
  this.powerup =0

  end

  end



  // makes the ball go to the player if it hit hit another player, or went off the screen

  if this.x <=-450 then this.shoot = 0   this.shot = 1   end
  if this.x >= 450 then this.shoot = 0  this.shot =1   end
  if this.grappled==2 then

  elsif
    this.shoot == 0 then
    this.x = this.px
    this.y = this.py
    end

  //print("power2: " + powerup2  + " power1: "+powerup )
  end
  draw = function()
  if this. grappled ==2 then
    this.bp = 0
    else
    this.bp= (10*-this.side)
      end
    screen.drawSprite(this.sprite, this.x+this.bp, this.y, this.size,)
  end
  end

  grapple = function()
         for playerIndex6=0 to players.length-1
      player = players[playerIndex6]

           for ballIndex6=0 to balls.length-1
      ball = balls[ballIndex6]

    if player.l == 4 then

  //change to bat
      if player.facing == 1 then player.sx = "bat.0" end
      if  player.facing== -1 then player.sx = "bat.1" end
      //draw bar
  screen.fillRect(player.x,floory+floorh/2+player.y+ player.h/2 + 40, 20, 5, "black")

  screen.fillRect(player.grapplex+player.x,floory+floorh/2+player.y+ player.h/2 + 40, player.grapplew, 5, "grey")

  player.grappled =2
  //get hook positions



  if playerIndex6 != ballIndex6 then

    balls[ballIndex6].grappled = 2

    player.hookY = (floory+floorh/2+player.y+ player.h/2)-4
  player.hookX = (player.x + (player.facing * 18 ))

  if player.hookX >ball.x  then ball.x= ball.x +5  end
   if player.hookX <ball.x  then ball.x= ball.x-5  end

    if player.hookY>ball.y then ball.y = ball.y+5 end
      if player.hookY<ball.y then ball.y = ball.y -5 end

      if abs(player.hookX - ball.x)<5 and abs(player.hookY - ball.y)<5   then
        ball.caught = 1
      end
      if ball.caught ==1 then
        balls[ballIndex6].x = player.hookX
        balls[ballIndex6].y = player.hookY
      end

    screen.drawLine( player.hookX, player.hookY, ball.x, ball.y, color )

   end

        if player.grappled == 2 and player.gt%300==0 then

  for ballindex7 = 0 to balls.length -1
  balls[ballindex7].grappled = 3
  balls[ballindex7].caught = 0
  end

  player.grappled = 1
  player.l = 0
  player.gt = 0
  player.currentSuper="nothing"


  end
    end
  end
         end
  end

  lives = function()

    numPlayers = players.legnth -1

    for  i=0 to players.length-1


      lives[i] = new Lives(players[i].lives, ((20)*i))
     w= screen.width/2-((LIVES) *20)
      t= (screen.height/2)-((players.length)*20)



  end


    end

    Lives = class


    constructor = function(lives ,location )

      this.location = location
      this.lives = lives

      end

    draw = function (livess, superd)
              screen.drawRoundRect(w+((LIVES-2)*20)/2, t+(10* (players.length-1)), (LIVES +1)*20, players.length*20, 10,"grey")

      this.lives = livess
          this.currentSuper= superd

          for o = 0 to LIVES-1

      screen.drawSprite("nolifeball", (o*20)+w, this.location+t, 20, 20)
  screen.drawRound(w-20, this.location +t, 14,14, "green")
      screen.drawSprite(this.currentSuper, w-20, this.location+t , 17, 17)
  end
      if this.lives> 0 then
      for o = 0 to this.lives -1
      screen.drawSprite("lifeball", (o*20)+w, this.location+t, 20, 20)

  end

  end

      end

    end









    endgame = function()


    for Player in players

      if Player.lives < 1  then

        game = false


        end

      end
        if game == false then
          audio.beep("saw duration 400 span 200 volume 30 F D E C")

          screen.fillRect(0,0,screen.width, screen.height, "black")
          screen.drawText("GAME OVER", 0, 10, 40, "white")
                  screen.drawText("Click to Restart", 0, -40, 20, "white")

  end

      end

callback = function(val)
  print("Welcome message received: " + val)
end

  init = function()
    playerId = random.nextInt(10000)

    print("Connecting from microcode as Player " + playerId)
    connection.connect()
    connection.send("joined", playerId)
    connection.listen("welcome", "callback")

    floory = -100
    floorh = 40
  LIVES = 4
  game = true
  platformX =60
  platformvx=1
  platformY =-20
  //powerup stuff
    sx="sprite.0"
        boost =["health", "strong", "fast", "shield","grapple"]
  y=100
  x=0

  show = 1

  players = [
    new Player("A", "D", "W","1",1, -150,100,4)

    new Player("J","L", "I", "0",-1, 150, 100,4)


  ]


  balls = [
    new dodgeball(players[0].shoot, players[0].facing, players[0].x,players[1].y-players[1].h*1.5, 3, players[0].h/3),
    new dodgeball(players[1].shoot, players[1].facing, players[1].x,players[1].y-players[1].h*1.5, 3, players[1].h/3)

  ]

  lives()

  end

  game = false
  update = function()
    if game == true then

  endgame()

  for Player in players
    Player.move()
  end


  for i=0 to balls.length
    balls[i].dodgeupdate(players[i].x,players[i].y-players[i].h*1.5 ,players[i].facing)
    end

  newCollision()
  powerUp()



  end
  end

  draw = function()
    if game == true then
    screen.fillRect(0,0,screen.width,screen.height,"#000")

        screen.drawMap("map1",0,0,460,200)

        for i=0 to players.length-1
    lives[i].draw(players[i].lives, players[i].currentSuper)
    end
  screen.setAlpha(1)

        screen.drawSprite("sprite5", 0, 20, screen.width+20,0 )
  if show == 1 then
      screen.drawSprite(boost[sprite], px, y, 15, 15)

  end
    platform()

  for Player in players
    Player.draw()
  end
  grapple()
  for dodgeball in balls

    dodgeball.draw()
  end

  strong()
  shield()
  regen()
  speed()
  end
    end

  platform = function()

       if platformX + 40 >= screen.width/2 then

       platformvx = -1
     elsif

      platformX - 40 <= -screen.width/2 then
          platformvx = 1

      end




  for Player in players


       if abs(platformX - Player.x)<40 and abs(platformY- (floory+floorh/2 + Player.y))<2   then
         Player.moving = 1
              Player.movingy=1




        elsif(abs(platformY- (floory+floorh/2 + Player.y))<2) and abs(platformX - Player.x)>40 then Player.moving =0  end

       if Player.moving ==1 then
         Player.vx = platformvx
       end



  end


    platformX = platformvx + platformX

      screen.fillRoundRect(platformX,platformY, 80, 6,4, "green")


    end

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


  if (keyboard[this.up] and this.y == this.miny) then

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
     this.miny =0 else this.miny = platformY+this.h+this.h end

  this.vy = this.vy -this.gravity


  this.y = max(this.miny, this.y+this.vy)



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

  powerUp = function()

     for i = 0 to 200

    y = y-0.01
     end


  x=x+1

    for playerIndex2 =0 to players.length-1
      player = players[playerIndex2]



     player.ht = player.ht + 1
  player.st = player.st + 1
    player.spt = player.spt + 1
    player.gt = player.gt + 1
  player.stt = player.stt +1

    player.strongtime = (player.stt/300)*20
  player.strongw = player.strongtime
  player.strongx = (20-player.strongtime)/2

    player.grappletime = (player.gt/300)*20
  player.grapplew = player.grappletime
  player.grapplex = (20-player.grappletime)/2

    player.speedtime = (player.spt/400)*20
  player.speedw = player.speedtime
  player.speedx = (20-player.speedtime)/2


    player.shieldtime = (player.st/300)*20
  player.shieldw = player.shieldtime
  player.shieldx = (20-player.shieldtime)/2


     player.healthtime = (player.ht/75)*20
  player.healthw = player.healthtime
  player.healthx = (20-player.healthtime)/2


  if go == 0 and x%200==0 then
    go =1
  sprite = floor(random.next()*boost.length)
  positiveOrNot = random.next()
  if positiveOrNot < 0.5 then side = -1 else side = 1 end
  px = round(random.next()*190 * side)
  end

  if go ==1 then

  if boost[sprite]== "fast" then
  if abs(player.x-px)<15 and abs(floory+floorh/2+player.y+ player.h/2-y)<15 and player.l ==0 and show !=3 then
  player.spt = 1
  player.l =1
  show = 3
  player.currentSuper ="fast"

  end

  elsif
   boost[sprite]== "health" then
  if abs(player.x-px)<15 and abs(floory+floorh/2+player.y+ player.h/2-y)<15  and show != 3 and  player.health<player.maxhealth and player.l ==0 then
  show = 3
  player.ht =1
  player.l = 2
  player.currentSuper ="health"


  end


  elsif
    boost[sprite]== "strong" then
  if abs(player.x-px)<15 and abs(floory+floorh/2+player.y+ player.h/2-y)<15   and  show !=3 and  player.l ==0  then
    show = 3
  player.l= 5
    player.stt=1
    player.currentSuper ="strong"

    end

  elsif
    boost[sprite]== "grapple" then

  if abs(player.x-px)<15 and abs(floory+floorh/2+player.y+ player.h/2-y)<15  and  show !=3 and  player.l ==0 and player.grappled==1 then
  show =3
  player.gt= 1
  player.l = 4
  player.currentSuper ="grapple"


   end

  elsif
    boost[sprite]== "shield" then
  if abs(player.x-px)<15 and abs(floory+floorh/2+player.y+ player.h/2-y)<15 and player.shield ==1 and player.l ==0 and show !=3  then
  show = 3
    player.st = 1
    player.l = 3
    player.shieldOpacity = 0.7
    player.currentSuper ="shield"

  end
  end
  end




  if y < - screen.height/2 - 200 then y = 100 go =0  show = 1 end

  end
    end

  regen = function()

     for playerIndex4=0 to players.length-1
      player = players[playerIndex4]


      if player.l == 2 then

        if player.facing == -1 then player.sx = "healleft" end
      if  player.facing== 1 then player.sx = "healright" end


  // screen.fillRect(player.x,floory+floorh/2+player.y+ player.h/2 + 50, 20, 5, "black")
  //screen.fillRect(player.healthx+player.x,floory+floorh/2+player.y+ player.h/2 + 50, player.healthw, 5, "yellow")
  player.healthed =1
  end


   if player.healthed == 1 and   player.ht%75==0 then
       player.healthed =2
      if player.health<player.maxhealth then
      player.health = player.maxhealth
     end
  player.l = 0
  player.ht = 0
  player.sx = "sprite"
    player.currentSuper="nothing"

   end


  end
  end

  breakShield = function(player)
  player.l = 0
  player.st = 0
  player.shield = 1
  player.gravity = player.originalGravity
  player.shieldOpacity = 0.7
  player.currentSuper = "nothing"
  end

  shield = function()
    for playerIndex3 =0 to players.length-1
      player = players[playerIndex3]

  if player.l==3 then
      if player.facing == 1 then player.sx = "shielded.1" end
      if  player.facing== -1 then player.sx = "shielded.0" end
    player.gravity = 0.2

    screen.setAlpha(player.shieldOpacity)
    screen.fillRound(player.x, floory+floorh/2+player.y+ player.h/2, 80, 80, "darkgreen")


         screen.setAlpha(1)

     screen.fillRect(player.x,floory+floorh/2+player.y+ player.h/2 + 50, 20, 5, "green")

  screen.fillRect(player.shieldx+player.x,floory+floorh/2+player.y+ player.h/2 + 50, player.shieldw, 5, "darkgreen")
  player.shield = 2


  end

    if player.shield == 2 and player.st%300==0 then
  breakShield(player)
  player.gravity = player.originalGravity

  end

  if player.shieldOpacity <= 0 then breakShield(player) end

  end
  end

  speed =function()
       for playerIndex5=0 to players.length-1
      player = players[playerIndex5]

      if player.l == 1 then



              if player.facing == 1 then player.sx = "speed.1" end
      if  player.facing== -1 then player.sx = "speed.0" end
      player.speeded = 1

      player.speed =12

           screen.fillRect(player.x,floory+floorh/2+player.y+ player.h/2 + 40, 20, 5, "black")

  screen.fillRect(player.speedx+player.x,floory+floorh/2+player.y+ player.h/2 + 40, player.speedw, 5, "red")




  if player.health < player.maxhealth then player.health = player.health + 0.1 end


  fast = 2


   screen.setAlpha(0.1)

    screen.fillRound(player.x, floory+floorh/2+player.y+ player.h/2, 70+bubbleW, 70+bubbleW, "yellow")
      screen.fillRound(player.x, floory+floorh/2+player.y+ player.h/2, 80+bubbleW, 80+bubbleW, "orange")
    screen.fillRound(player.x, floory+floorh/2+player.y+ player.h/2,60+bubbleW, 60+bubbleW, "yellow")
      screen.fillRound(player.x, floory+floorh/2+player.y+ player.h/2, 50+bubbleW, 50+bubbleW, "orange")

      end

  if fast ==2 and  player.l != 1 then
    screen.setAlpha(0.3)
     screen.fillRect(0,0, screen.width, screen.height, "red")
    player.speed = 2 and
    balls[playerIndex5].speed = 0.5
    player.jump = 3.5
    player.gravity  = 0.1

  end


      if player.speeded == 1 and player.spt%400==0 then
  player.speeded = 2
  player.l = 0
  player.gravity  = 0.3
  player.spt = 0
  player.currentSuper="nothing"
      fast = 1

  for playerindex7 = 0 to players.length -1
  players[playerindex7].jump = 7
  players[playerindex7].gravity = 0.3
  players[playerindex7].speed =4

  end

      end

  if player.speeded ==1 and player.spt%50 ==0 then
  bubbleW = bubbleW + 30
  end

  if player.speeded ==1 then
  if bubbleW > 0 then

    bubbleW = bubbleW - 0.8
    end
  end



       end
  end

  strong = function()

      for playerIndex=0 to players.length-1
      player = players[playerIndex]




    if player.l == 5 then

      balls[playerIndex].superball = 1


      screen.fillRect(player.x,floory+floorh/2+player.y+ player.h/2 + 40, 20, 5, "black")

  screen.fillRect(player.strongx+player.x,floory+floorh/2+player.y+ player.h/2 + 40, player.strongw, 5, "blue")


      if player.facing == 1 then player.sx = "cyborg.1" end
      if  player.facing== -1 then player.sx = "cyborg.0" end


      player.strong = 1
      end




    if player.strong ==1 and player.stt% 300 == 0 then
      player.l = 0
      player.strong = 0
      balls[playerIndex].superball = 0
      player.currentSuper="nothing"

      end



    end
    end