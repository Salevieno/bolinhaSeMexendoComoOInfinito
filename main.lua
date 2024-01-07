function love.load()
    alien =
    {
        initx = 250,
        inity = 250,
        posx = 350,
        posy = 250,
        speedx = 0,
        speedy = 0,
        size = 15
    }

    step = 1
end

function cosh (x)
    if x == 0.0 then return 1.0 end
    if x < 0.0 then x = -x end
    x = math.exp(x)
    x = x / 2.0 + 0.5 / x
    return x
end

function sinh (x)
    if x == 0 then return 0.0 end
    local neg = false
    if x < 0 then x = -x; neg = true end
    if x < 1.0 then
      local y = x * x
      x = x + x * y *
          (((-0.78966127417357099479e0  * y +
             -0.16375798202630751372e3) * y +
             -0.11563521196851768270e5) * y +
             -0.35181283430177117881e6) /
          ((( 0.10000000000000000000e1  * y +
             -0.27773523119650701667e3) * y +
              0.36162723109421836460e5) * y +
             -0.21108770058106271242e7)
    else
      x = math.exp(x)
      x = x / 2.0 - 0.5 / x
    end
    if neg then x = -x end
    return x
  end

function love.update()
    step = step + 1
    local angle = 2 * math.pi * step / 360
    local mult = 1
    alien.speedx = 2*math.sin(angle)
    alien.speedy = 1.5*math.cos(2 * angle)

    if step % 360 <= 180 then
        mult = -1
    end

    alien.posx = alien.posx + alien.speedx
    alien.posy = alien.posy + alien.speedy
end

function love.draw()
    love.graphics.setColor(0, 0, 150)
    love.graphics.circle('fill', alien.posx, alien.posy, alien.size)
end