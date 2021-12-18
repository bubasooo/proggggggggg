function search11(r::Robot)
    i = 2
    while (i > 0)
        if !ismarker(r)
            move!(r,Nord)
            move!(r,West)
            i += rrrruond(r,i)
            i += 2
        end  
    end
end


function rrrruond(r::Robot,i::Int64)
    j=0
    for side in (Ost,Sud,West,Nord)
        a = i
        while (a > 0)
            move!(r,side)
            if ismarker(r)
                a = -1
                break
            end 
            a -= 1
        end
        if (a == -1)
            j = -i-2
            break
         
        end
        
    end
    return(j)  
end