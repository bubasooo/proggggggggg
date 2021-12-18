include("1.jl")
include("11.jl")
include("14.jl")
function mark_allzicper(r::Robot)
    angleofsquare1111(r::Robot)
    putmarker!(r)
    snake11per(r)
    if (isborder(r,Ost))
        putmarkholeper(r,West)
    else 
        putmarkholeper(r,inverse(West))
    end
end
    


function snake11per(r::Robot)
    while !isborder(r,Nord)
        if (isborder(r,Ost))
            putmarkholeper(r,West)
        else 
            putmarkholeper(r,inverse(West))
        end
        if (isborder(r,Ost) || isborder(r,West))
            disexit(r,Nord)
            putmarker!(r)
        end
    end
    
end
function angleofsquare1111(r::Robot)
    while ((!isborder(r,Sud)) || (!isborder(r,West)))
        if (!isborder(r,Sud))
            disexit(r,Sud)
        end
        if (!isborder(r,West))
            disexit(r,West)
        end
    end
end