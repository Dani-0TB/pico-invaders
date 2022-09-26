function create_enemy(x,y,w,h,sp,points)
    local e = new_object(x,y)
    e.sp = sp
    e.n_fr = 2
    e.c_fr = 0
    e.w = w
    e.h = h
    e.speed = 2
    e.points = points
    e.update = function(self, timer)
    end
    e.draw = function(self)
        spr(self.sp+self.c_fr,self.x,self.y)
    end
    e.move = function(self)
        self.c_fr += 1
        if self.c_fr + 1 > self.n_fr then
            self.c_fr = 0
        end
        self.x += self.speed
    end

    e.down = function(self)
        self.y += 2
    end

    e.collide = function(self)
        if self.x + self.speed < 0 or self.x + self.w + self.speed > 127 then
            return true
        end
        return false
    end
    return e
end

function make_enemies()
    et = {}
    local x = 7
    local y = 8
    local xoff = 12
    local yoff = 8
    for row=0,6 do
        t = {}
        for cell=0,9 do
            if row < 3 then
                add(t,create_enemy(x + xoff * cell, y + yoff * row, 8, 8, 2, 100))
            else
                add(t,create_enemy(x + xoff * cell, y + yoff * row, 8, 8, 4, 75))
            end
            
        end
        add(et,t)
    end
    return et
end

function check_collision()
    for list in all(enemies) do
        for e in all(list) do
            if e:collide() then
                return true
            end
        end
    end
    return false
end

function move_enemies(timer)
    if timer == 0 then
        sfx(sound)
        sound += 1
        if sound > 4 then
            sound = 1
        end
        if check_collision() then
            for list in all(enemies) do
                for e in all(list) do
                    e.speed *= -1
                    e:down()
                    e:move()
                end
            end
        else
            for list in all(enemies) do
                for e in all(list) do
                    e:move()
                end
            end
        end
    end
end