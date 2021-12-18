
function search11444(r::Robot)
    i = 2
    while (i > 0)
        if !ismarker(r)
            stepgoodvery(r,Nord)
            stepgoodvery(r,West)
            i += rrrruond444(r,i)
            i += 2

        end  
    end
end


function rrrruond444(r::Robot,i::Int64)
    j=0
    for side in (Ost,Sud,West,Nord)
        a = i
        while (a > 0)
            stepgoodvery(r,side)
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
function stepgoodvery(r::Robot,side::HorizonSide)
    i = 0
    j = Int(side) + 1
    while isborder(r,side)
        backgrow(r,HorizonSide(mod(j, 4)),i ) 
        j = mod(j+2,4)
        i += 1
    end
    p = mod(i,2)
    i = ((i+1)//2) - 1
    move!(r,side)
    while (i > 0)
        if (p == 1)
            move!(r,HorizonSide(mod(Int(side)+3, 4)))
        else
            move!(r,HorizonSide(mod(Int(side)+1, 4)))
        end
        i -=1
    end

end
function backgrow(r::Robot,side::HorizonSide,i::Int64)
     o = i 
     while (i > 0)
        move!(r,side)
        i -= 1
     end
    end