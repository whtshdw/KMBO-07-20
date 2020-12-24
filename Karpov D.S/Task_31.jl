function get_num_markers_lab(robot)
    #Робот - в произвольной клетке лабиринта

    num_steps, side_steps = move_to_start!(robot, (Sud,West))
    num_steps=reverse(num_steps)
    side_steps=reverse(side_steps)
    #Робот - в юго-западном углу

    side = Ost
    num_markers = get_num_markers!(robot, side)
    while is_move_posible!(robot, Nord, side) == true
        move!(robot, Nord)
        movements!(robot,side)
        side = inverse(side)
        num_markers += get_num_markers!(robot, side)
    end
    #Маркеры посчитаны, Робот где-то у северной границы в углу

    move_to_start!(robot, (Sud,West))
    #Робот - снова в юго-западном углу

    for (i,n) in enumerate(num_steps)
        movements!(robot, side_steps[i], n)
    end
    #Робот - в исходном положении
    return num_markers
end

function get_num_markers!(robot, side)
   
    nun_markers = ismarker(robot) ? 1 : 0
    while !isborder(robot,side)
        move!(robot,side)
        ismarker(robot) && num_markers += 1
    end
    return num_markers
end
