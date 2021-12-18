include("1.jl")
function angleofsquare4(r::Robot)
    angleofsquare(r::Robot)
    for side in (Nord,West,Sud,Ost)
        movehole(r,side)
        putmarker!(r)
    end
    
end


function angleofsquare(r::Robot)
    while ((!isborder(r,Sud)) || (!isborder(r,Ost)))
        if (!isborder(r,Sud))
            move!(r,Sud)
        end
        if (!isborder(r,Ost))
            move!(r,Ost)
        end
    end
end
function movehole(r::Robot,side::HorizonSide)
    while (!isborder(r,side))
        move!(r,side)
        end
    end