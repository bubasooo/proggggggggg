include("16.jl")
function angleofsquare41111(r::Robot)
    angleofsquare1111(r::Robot)
    for side in (Nord,West,Sud,Ost)
        movehole11111(r,side)
        putmarker!(r)
    end
    
end


function angleofsquare1111(r::Robot)
    while ((!isborder(r,Sud)) || (!isborder(r,Ost)))
        if (!isborder(r,Sud))
            move!(r,Sud)
        end
        if (!isborder(r,Ost))
            move!(r,Ost)
        end
    end
end
function movehole11111(r::Robot,side::HorizonSide)
    while (!isborder(r,side))
        move!(r,side)
    end   
end