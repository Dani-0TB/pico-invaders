function new_bullet(x,y)
    local b = new_object(x,y)
    b.speed = 4
    b.active = false
    b.update = function(self)
        if self.active then
            self.y -= self.speed
            if self.y < 0 then
                self.active = false
            end
        end
    end
    b.draw = function(self)
        pset(self.x, self.y, 6)
    end

    b.collide = function(self,o)
        if  self.x > o.x and self.x < o.x + 7 and
            self.y > o.y and self.y < o.y + 7 then return true end
        return false
    end

    b.collide_barrier = function(self, offset)
        if pget(self.x,self.y-offset) == 11 then
            return true
        end
        return false
    end

    b.deactivate = function(self)
        self.active = false
        self.y = -1
    end
    return b
end