function new_object(x,y)
    local o = {
        x = x,
        y = y,
        w = 8,
        h = 8,
        sp = 0,
        update = function (self)
        end,
        draw = function(self)
            
        end
    }
    return o
end