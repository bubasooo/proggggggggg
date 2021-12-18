include("1.jl")
function temp(r::Robot)
    a = collect(snake1(r))
    if isborder(r,Ost)
        a += collect(movehole12(r,West))
        
    else 
        a += collect(movehole12(r,inverse(West)))
    end
    return(a[1]/a[2])
end

function snake1(r::Robot)
    i = [0,0]
    while !isborder(r,Nord)
        
        if isborder(r,Ost)
            i += collect(movehole12(r,West))
            
        else 
            i += collect(movehole12(r,inverse(West)))
        end
        if isborder(r,Ost) || isborder(r,West)
            move!(r,Nord)
        end
    end
    return (i)
end
function movehole12(r::Robot,side::HorizonSide)
    t = 0
    n = 0
    while (!isborder(r,side))
        move!(r,side)
        if (ismarker(r))
            t += temperature(r)
            n += 1
        end
    end
    return(t,n)
end