include("1.jl")
include("11.jl")
function mark_krossper(r::Robot)
    for side in (Nord,Sud,Ost,West)
        putmarkholeper(r,side)
        backingper(r, inverse(side))
    end
    putmarker!(r)       
end

function putmarkholeper(r::Robot,side::HorizonSide)
    y = 0
    while (y != 1)
        y = disexit(r,side)
        putmarker!(r)
    end
end

function backingper(r::Robot,side::HorizonSide)
    while ismarker(r)
        disexit(r,side)
    end
end

