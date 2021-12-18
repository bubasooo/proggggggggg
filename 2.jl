include("1.jl")
function obolochka(r::Robot)
    godownost(r,Sud,Ost)
    kub(r)
end    

function godownost(r,side1::HorizonSide,side2::HorizonSide)
    for side in (side1,side2)
        while !isborder(r,side)
            move!(r,side)
        end
    end
end
function kub(r::Robot)
    for side in (Nord,West,Sud,Ost)
        putmarkhole(r,side)
    end
end