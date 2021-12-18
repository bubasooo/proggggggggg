include("1.jl")
include("2.jl")
function updowntwicestep(r::Robot,side1::HorizonSide)
    godownost(r,Sud,West)
    putmarker!(r)
    putmarkhole(r,side1)
    while !isborder(r,Nord)
        move!(r,Nord)
        putmarkhole(r,inverse(side1))
        backing(r, side1)
        move!(r,inverse(side1))
    end
end

        

