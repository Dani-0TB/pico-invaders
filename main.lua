-- Main game loop
function _init()
    score = 0
    lives = 3
    interval = 40
    timer = interval
    p = {}
    enemies = {}
    add(p, create_player())
    add(enemies, create_enemy(8,8,6,6,2))
end

function _update()
    tick_timer()
    if btnp(2) then
        interval += 1
    end
    if btnp(3) then
        interval -= 1
    end
    for o in all(p) do
        o:update()
    end
    for e in all(enemies) do
        e:update(timer)
    end
end

function _draw()
    cls(0)
    for o in all(p) do
        o:draw()
    end
    for e in all(enemies) do
        e:draw()
    end
end

function tick_timer()
    if timer > 0 then
        timer -= 1
    else
        timer = interval
    end
end