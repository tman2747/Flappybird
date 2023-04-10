function love.load()

    width = 1000
    height = 900
    pipe1x = (1000 - 100)
    pipe2x = (1000 + 550)
    pipeWidth = 100
    love.window.setTitle("Flappy Guy")
    love.window.setMode(width, height)
        
    birdY = 200
    birdX = 120
    birdYSpeed = 0 -- setting this to a negitive will make the bird jump up for a second before falling back down
    jumpthru = 150
    pipeLength = 350
    pipeLength2 = 350
    pipeStartingX = (width - pipeWidth)
    score = 0
    nextpipe = 1

end

function love.update(dt)
    birdYSpeed = birdYSpeed + (550 * dt) -- dt make the game frame independant/ calucalting dt here independantly from bird y 
    birdY = birdY + ( birdYSpeed * dt)
    --print(dt *500)
    pipe1x = pipe1x - (350 * dt)
    pipe2x = pipe2x - (350 * dt)

    if pipe1x < -150 then
        pipe1x = 1150
        pipeLength = math.random(100,650)
    end

    if pipe2x < -150 then
        pipe2x = 1150
        pipeLength2 = math.random(100,650)
    end
--Pipe1 hitbox top
    if (birdX > pipe1x or birdX +30 > pipe1x) and birdX < (pipe1x + pipeWidth) and 
    birdY <  pipeLength then
        love.load()
    end
    --hitbox bottom
    if (birdX > pipe1x or birdX +30 > pipe1x) and
    birdX + 30 > pipe1x and
    birdX < pipe1x + pipeWidth and
    (birdY > pipeLength + jumpthru or birdY + 25 > pipeLength + jumpthru) then
        love.load()
    end

--pipe2 Hitbox
    if (birdX > pipe2x or birdX +30 > pipe2x) and birdX < (pipe2x + pipeWidth) and
    birdY <  pipeLength2 then
        love.load()
    end
    --hitbox bottom
    if (birdX > pipe2x or birdX +30 > pipe2x) and
    birdX + 30 > pipe2x and
    birdX < pipe2x + pipeWidth and
    (birdY > pipeLength2 + jumpthru or birdY + 25 > pipeLength2 + jumpthru) then
        love.load()
    end

    if birdX > pipe1x + pipeWidth and nextpipe == 1 then
        nextpipe = 2
        score = score + 1
        print(
            "score"
        )
    end
    
    if birdX > pipe2x + pipeWidth and nextpipe == 2 then
        nextpipe = 1
        score = score + 1
        print(
            "score"
        )
    end
    
end

-- user input
function love.keypressed(key)
    if key == "space" then 
        birdYSpeed = -300
    end
end

function love.draw()
 
    
    --background
    love.graphics.setBackgroundColor(0.1,0.4,0.8)
    
    --pipe


    love.graphics.setColor(0.1,0.8,0.1)
    love.graphics.rectangle("fill", pipe1x, 0, pipeWidth, pipeLength)
    love.graphics.rectangle("fill",pipe1x, pipeLength + jumpthru, pipeWidth, height - pipeLength - jumpthru)

    --pipe2
    love.graphics.rectangle("fill", pipe2x, 0, pipeWidth, pipeLength2)
    love.graphics.rectangle("fill",pipe2x, pipeLength2 + jumpthru, pipeWidth, height - pipeLength2 - jumpthru)
      
    -- bird
    love.graphics.setColor(0.8,0.8,0.2,1)
    love.graphics.rectangle("fill", birdX, birdY, 30, 25)

    -- Score
    love.graphics.print(score,100,100)
    
end