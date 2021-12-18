include("1.jl")
include("5.jl")
function smallsquare(r::Robot)
    angleofsquare(r)
    i = mod(snake(r,West),2)
    if (i == 1)
        i = 1
    else i = 3
    end
    
    for side in (HorizonSide(mod(i, 4)),Nord,HorizonSide(mod(i+2, 4)),Sud)
        putmarker!(r)
        putmarkhole1(r,side,mod(i+2,4))
        move!(r,HorizonSide(mod(Int(side) + (i+2), 4)))
    end
    
end
function snake(r::Robot,side1::HorizonSide)
    i = 0
    while !isborder(r,Nord)
        if isborder(r,Ost)
            movehole1(r,side1)
        else 
            movehole1(r,inverse(side1))
        end
        if isborder(r,Ost) || isborder(r,West)
            move!(r,Nord)
        end
        i+=1
    end
    return i
end
function movehole1(r::Robot,side::HorizonSide)
    while (!isborder(r,side))
        move!(r,side)
        if (isborder(r,Nord))
            break
        end
    end
    
end
function putmarkhole1(r::Robot,side::HorizonSide,i::Int64)
    
    while isborder(r,HorizonSide(mod(Int(side) + i, 4)))
        move!(r,side)
        putmarker!(r)
    end
end