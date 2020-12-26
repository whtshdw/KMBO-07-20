function mark_triangle!(r::Robot)
    num_vert = moves!(r, Sud)
    num_hor = moves!(r, West)
    lenght = moves!(r, Ost)
    hight = moves!(r, Nord)
    move_left_angle!(r)
    p=lenght+1
        for i in 1:hight
            while p-i != 0
                putmarker!(r)
                move!(r,Ost)
                p-=1
            end
            putmarker!(r)
            p=lenght+1
            go_back!(r)
            move!(r,Nord)
        end
    move_left_angle!(r)
    moves!(r, Nord, num_vert)
    moves!(r, Ost, num_hor)
end    
function move_left_angle!(r::Robot)
    for side in (Sud, West)
        while isborder(r, side) == false
            move!(r, side)
        end
    end
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
function go_back!(r::Robot)
    while isborder(r,West) == false
        move!(r,West)
    end
end
