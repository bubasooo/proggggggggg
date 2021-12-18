include("1.jl")
function stepgood(r::Robot)
    putmarker!(r)
    i = 1
    while isborder(r,Nord)
        backing(r,HorizonSide(mod(i, 4))) 
        putmarker!(r)
        i = mod(i+2,4)
    end        
end