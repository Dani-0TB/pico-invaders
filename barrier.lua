function create_barrier(x,y)
    b = {
        -- Variables
        x = x,
        y = y,
        w = 2,
        h = 2,
        layout={},
        sp = 7,
        -- Metodos
        add_point = function(self,x,y)
            local pt = {x,y}
            for pn in all(self.layout) do
                if pt == pn then
                    return
                end
            end
            add(self.layout, pt)
            add(self.layout,{pt[1],pt[2]-1})
            add(self.layout,{pt[1],pt[2]+1})
            add(self.layout,{pt[1]-1,pt[2]})
            add(self.layout,{pt[1]+1,pt[2]})
        end,
        draw = function(self)
            spr(self.sp,self.x,self.y,self.w,self.h)
            for pix in all(self.layout) do
                pset(pix[1],pix[2],0)
            end
        end
    }
    return b
end

function make_barriers(offset)
    local br = {}
    local x = 15
    local y = 80
    for i=0,3 do
        add(br,create_barrier(x+(offset*i),y))
    end
    return br
end