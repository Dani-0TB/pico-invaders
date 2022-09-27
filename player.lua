function create_player()
    -- initialize player variables
    local p = new_object(60,116)
    p.sp = 1
    p.w = 7
    p.h = 7
    p.speed = 2
    p.blt = new_bullet(p.x, -1)
    
    -- Player logic
    p.update = function(self)
        -- Check for input and apply speed
        if (btn(0)) then
            self.x -= self.speed
        end
        if (btn(1)) then
            self.x += self.speed
        end

        -- Basic screen collisions.
        if self.x < 0 then
            self.x = 0
        end
        if self.x > 121 then
            self.x = 121
        end
        -- shooting
        if btnp(4) then
            if not self.blt.active then
                self:shoot()
                sfx(0)
            end
        end
        self.blt:update()
    end

    -- Player draw routines
    p.draw = function(self)
        spr(self.sp, self.x, self.y)
        self.blt:draw()
    end

    p.shoot = function(self)
        self.blt.x = self.x + self.w / 2
        self.blt.y = self.y-1
        self.blt.active = true
    end


    return p
end