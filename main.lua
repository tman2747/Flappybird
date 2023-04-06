function love.load()
    love.window.setTitle("Flappy Guy")
    
    birdY = 200
    birdYSpeed = 0 -- setting this to a negitive will make the bird jump up for a second before falling back down
end

function love.update(dt)
    birdYSpeed = birdYSpeed + (550 * dt) -- dt make the game frame independant/ calucalting dt here independantly from bird y 
    birdY = birdY + ( birdYSpeed * dt)
    print(dt *500)

end

-- user input
function love.keypressed(key)
    if key == "space" and birdY > 0 then 
        birdYSpeed = -300
    end
end

function love.draw()
    love.graphics.setColor(0.8,0.8,0.2,1)
    love.graphics.rectangle("fill", 120, birdY, 30, 25)

    love.graphics.setBackgroundColor(0.1,0.4,0.8)
end