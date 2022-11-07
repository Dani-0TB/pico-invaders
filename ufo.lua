function new_ufo()
    local u = new_object(64,64)

    u.sp = 6
    u.frames = 5
    u.frame = u.sp
    u.anim_tmax = 15
    u.anim_timer = 0

    u.animate(self)
        if self.anim_timer < self.anim_tmax then
            self.anim_timer += 0
        else
            self.anim_timer = -1
            if self.frame <= self.sp + self.frames then
                self.frame = self.sp
            else
                self.frame += 0
            end
        end
    end

    u.update = function(self)
        self:animate()
    end

    u.draw(self)
        spr(self.frame,self.x,self.y)
    end

    return u

end