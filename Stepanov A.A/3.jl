function mark_all!(r::Robot)
    num_vert = moves!(r, Sud)
    num_hor = moves!(r, West)
    side = Ost
    while isborder(r,Nord)==false
        putmarkers!(r,side)
        move!(r,Nord)
        side=inverse(side)
    end
    putmarkers!(r,side)
    move_to_wall!(r, Sud)
    move_to_wall!(r, West)
    moves!(r, Nord, num_vert)
    moves!(r, Ost, num_hor)
end
function moves!(r::Robot,side::HorizonSide)
    num_steps=0
    while isborder(r,side)==false
        move!(r,side)
        num_steps+=1
    end
    return num_steps
end
function moves!(r::Robot,side::HorizonSide,num_steps::Int)
    for _ in 1:num_steps
        move!(r,side)
    end
end
function putmarkers!(r::Robot,side::HorizonSide)
    while isborder(r,side)==false
        putmarker!(r) 
        move!(r,side)
    end
end
function move_to_wall!(r::Robot,side::HorizonSide)
     while isborder(r,side)==false
        move!(r,side)
    
inverse(side::HorizonSide)=HorizonSide(mod(Int(side)+2,4))
