function create_enemy(x,y,w,h,sp)
    local e = new_object(x,y)
    e.sp = sp
    e.n_fr = 2
    e.c_fr = 0
    e.w = w
    e.h = h
    e.snd = 1
    e.speed = 8
    e.update = function(self, timer)
        if timer == 0 then
            sfx(self.snd)
            if self.snd < 4 then
                self.snd += 1
            else
                self.snd = 1
            end
            self.c_fr += 1
            if self.c_fr + 1 > self.n_fr then
                self.c_fr = 0
            end
        end
    e.draw = function(self)
        spr(self.sp+self.c_fr,self.x,self.y)
        print(self.snd, self.x, self.y+16,6)
    end
    end
    return e
end