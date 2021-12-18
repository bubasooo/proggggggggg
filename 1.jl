function mark_kross!(r::Robot)
    for side in (Nord,Sud,Ost,West)
        putmarkhole(r,side)
        backing(r, inverse(side))
    end
    putmarker!(r)       
end

function putmarkhole(r::Robot,side::HorizonSide)
    while !isborder(r,side)
        move!(r,side)
        putmarker!(r)
    end
end

function backing(r::Robot,side::HorizonSide)
    while ismarker(r)
        move!(r,side)
    end
end

inverse(side::HorizonSide) = HorizonSide(mod(Int(side)+2, 4)) 
