function fourdots(r::Robot)
    putmarker!(r)
    for side in (Nord,Sud,West,Ost)
        disexit(r,side)
        moveexist1(r,side)
        putmarker!(r)
        disexit(r,HorizonSide(mod(Int(side)+2, 4)))
        moveexist1(r,HorizonSide(mod(Int(side)+2, 4)))
    end
end


function disexit(r::Robot,side::HorizonSide)
    i = 0
    while (isborder(r,side))
        move!(r,HorizonSide(mod(Int(side)+1, 4)))
        i+=1
        if ((isborder(r,side)) && (isborder(r,HorizonSide(mod(Int(side)+1, 4)))))
            break
        end
    end

    if ((isborder(r,side)) && (isborder(r,HorizonSide(mod(Int(side)+1, 4)))))
        while (i > 0)
            move!(r,HorizonSide(mod(Int(side)+3, 4)))
            i -= 1
        end
        return(1)
    else
        move!(r,side)
        while ((isborder(r,HorizonSide(mod(Int(side)+3, 4)))) && (i > 0))
            move!(r,side)
        end
        while (i > 0)
            move!(r,HorizonSide(mod(Int(side)+3, 4)))
            i -= 1
            
        end
        return(0)
    end
end


function moveexist(r::Robot,side::HorizonSide)
    y = 0
    while (y != 1)
        y = disexit(r,side)

    end
end 
function moveexist1(r::Robot,side::HorizonSide)
    y = 0
    while (y != 1)
        if (ismarker(r))
            y = 1
        else
            y = disexit(r,side)
        end
    end
end 