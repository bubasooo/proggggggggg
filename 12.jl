include("1.jl")
function standart(r::Robot,n::Int64)
    flag1 = 1
    while (!isborder(r,Nord))
        y = n
        while (y > 0)
            putmarkersus(r,flag1,n,Ost)
            move!(r,Nord)
            y -= 1
        end
        flag1 = mod(flag1 + 1, 2)
    end
    if (mod(flag1 + 1, 2) == 1)
        putmarkersus(r,flag1,n,Ost)
    end
end

function putmarkersus(r::Robot,flag::Int64,n::Int64,side::HorizonSide)
    flag0 = flag
    while (!isborder(r,side))
        y = n
        while (y > 0) 
            if ((flag0 == 0) && (!isborder(r,side)))                
                move!(r,side)
            end
            if ((flag0 == 1) && (!isborder(r,side)))
                putmarker!(r)
                move!(r,side)
            end
            y -= 1
        end
        flag0 = mod(flag0 + 1, 2)
    end
    if (mod(flag0 + 1, 2) == 1)
        putmarker!(r)
    end
    while (!isborder(r,inverse(side)))
        move!(r,inverse(side))
    end
end


