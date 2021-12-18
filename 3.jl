include("1.jl")
function mark_allzic(r::Robot)
    angleofsquare1111(r::Robot)
    putmarker!(r)
    snake11(r)
    if (isborder(r,Ost))
        putmarkhole(r,West)
    else 
        putmarkhole(r,inverse(West))
    end
end
    


function snake11(r::Robot)
    while !isborder(r,Nord)
        if (isborder(r,Ost))
            putmarkhole(r,West)
        else 
            putmarkhole(r,inverse(West))
        end
        if (isborder(r,Ost) || isborder(r,West))
            move!(r,Nord)
            putmarker!(r)
        end
    end
    
end
function movehole11111(r::Robot,side::HorizonSide)
    while (!isborder(r,side))
        move!(r,side)
        if (isborder(r,Nord))
            break
        end
    end
    
end
function angleofsquare1111(r::Robot)
    while ((!isborder(r,Sud)) || (!isborder(r,West)))
        if (!isborder(r,Sud))
            move!(r,Sud)
        end
        if (!isborder(r,West))
            move!(r,West)
        end
    end
end