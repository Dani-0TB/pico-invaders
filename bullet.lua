function new_bullet(x,y)
    local b = new_object(x,y)
    b.speed = 3
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
    return b
end