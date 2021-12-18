include("2.jl")
include("5.jl")
function obolochkaper(r::Robot)
    angleofsquare(r)
    kub(r)
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
