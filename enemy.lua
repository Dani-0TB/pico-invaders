function create_enemy(x,y,w,h,sp)
    local e = new_object(x,y)
    e.sp = sp
    e.n_fr = 2
    e.c_fr = 0
    e.w = w
    e.h = h
    e.speed = 8
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
        self.y += 8
    end
    return e
end