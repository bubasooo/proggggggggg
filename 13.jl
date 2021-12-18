include("1.jl")
function mark_krossxxx(r::Robot)
    for side in (Nord,Sud,Ost,West)
        putmarkholexxx(r,side)
        backingxxx(r, inverse(side))
    end
    putmarker!(r)       
end

function putmarkholexxx(r::Robot,side::HorizonSide)
    while (!isborder(r,side) && !isborder(r,HorizonSide(mod(Int(side)+1, 4))))
        move!(r,side)
        move!(r,HorizonSide(mod(Int(side)+1, 4)))
        putmarker!(r)
    end
end

function backingxxx(r::Robot,side::HorizonSide)
    while ismarker(r)
        move!(r,side)
        move!(r,HorizonSide(mod(Int(side)+1, 4)))
    end
end
