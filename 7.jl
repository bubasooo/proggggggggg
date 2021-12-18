include("1.jl")
function truechessal(r::Robot)
    putmarker!(r)
    flag = angleofsquare1(r)
    flag = chessal(r,flag)
    if isborder(r,Ost)
        putmarkhole2(r,West,flag)
    else 
        putmarkhole2(r,inverse(West),flag)
    end
    
end


function chessal(r::Robot,flag::Int64) 
    flag0 = flag

    while !isborder(r,Nord)
        if isborder(r,Ost)
            flag0 = mod(1 + putmarkhole2(r,West,flag0),2)
        else 
            flag0 = mod(1 + putmarkhole2(r,inverse(West),flag0),2)
        end
        if isborder(r,Ost) || isborder(r,West)
            move!(r,Nord)
        end
        
    end
    return(flag0)    
end

function putmarkhole2(r::Robot,side1::HorizonSide,flag::Int64)
    n = 0
    if (flag == 1) 
        putmarker!(r)
    end
    while (!isborder(r,side1))
        move!(r,side1)
        flag = mod(flag + 1 ,2)
        if (flag == 1)
            putmarker!(r)
        end
        n = flag 
    end 
    return(n)  
end
function angleofsquare1(r::Robot)
    flag = 1
    while ((!isborder(r,Sud)) || (!isborder(r,Ost)))
        if (!isborder(r,Sud))
            move!(r,Sud)
            flag += 1
        end
        if (!isborder(r,Ost))
            move!(r,Ost)
            flag += 1
        end
    end
    return(mod(flag,2))
end