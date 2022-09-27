-- Main game loop
function _init()
    score = 0
    lives = 3
    interval = 40
    timer = interval
    sound = 1
    level = 1
    p = {}
    enemies = make_enemies() 
    add(p, create_player())
    barriers = make_barriers(28)


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
    -- collide with enemies
    for row in all(enemies) do
        for e in all(row) do
            if p[1].blt:collide(e) then
                del(row,e)
                sfx(6)
                p[1].blt:deactivate()
                score += e.points
                if interval > 1 then
                    interval -= 0.5
                end
                break
            end
        end
    end
    move_enemies(timer)
    -- collide with barrier
    for b in all(barriers) do
        for i=0,p[1].blt.speed do
            if p[1].blt:collide_barrier(i) then
                b:add_point(p[1].blt.x,p[1].blt.y - i)
                p[1].blt:deactivate()
                sfx(7)
            end
        end
    end
end

function _draw()
    cls(0)
    for o in all(p) do
        o:draw()
    end
    for row in all(enemies) do
        for e in all(row) do
            e:draw()
        end
    end
    for b in all(barriers) do
        b:draw()
    end
    print_ui()
end

function tick_timer()
    if timer > 0 then
        timer -= 1
    else
        timer = flr(interval)
    end
end

function print_ui()
    print("level: "..level, 0,0,6)
    print("lives: "..lives, 35,0,6)
    print("score: "..score, 75,0,6 )
end
