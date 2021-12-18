function snake11rrr(r::Robot)
        j = 0
        while !isborder(r,Sud)
            if (isborder(r,Ost))
                j += movehole11111rrr(r,West)
            else 
                j += movehole11111rrr(r,inverse(West))
            end
            if (isborder(r,Ost) || isborder(r,West))
                move!(r,Sud)
            end
        end
        if (isborder(r,Ost))
            movehole11111rrr(r,West)
        else 
            movehole11111rrr(r,inverse(West))
        end
        return(j)
    end   
function movehole11111rrr(r::Robot,side::HorizonSide)
    flag = 0
    n = 0
    while (!isborder(r,side))
        move!(r,side)
        if flag == 0
            if isborder(r,Sud)
                n += 1
                flag = 1
            end
        else 
            if (!isborder(r,Sud))
                flag = 0
            end
        end
    end 
    return(n)       
end