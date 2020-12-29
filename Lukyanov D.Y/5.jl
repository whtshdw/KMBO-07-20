function mark_angles(r)
    num_steps=[]
    while isborder(r,Sud)==false || isborder(r,West) # Робот - не в юго-западном углу
        push!(num_steps, moves!(r, West)) 
        push!(num_steps, moves!(r, Sud))
    end
    # УТВ: Робот - в юго-западном углу и в num_steps - закодирован пройденный путь
    for side in (Nord,Ost,Sud,West)
        moves!(r,side) 
        putmarker!(r)
    end
    # УТВ: Маркеры поставлены и Робот - в юго-западном углу
    for (i,n) in enumerate(reverse!(num_steps))
        side = isodd(i) ? Ost : Nord 
        moves!(r,side,n)
    end
    #УТВ: Робот - в исходном положении
end
# перемещает Робота в заданном направлении до упора и возвращает число сделанных шагов
function moves!(r,side)
    num_steps=0
    while isborder(r,side)==false
        move!(r,side)
        num_steps+=1
    end
    return num_steps
end
# Перемещает Робота в заданном направлении на заданное число шагов
moves!(r,side,num_steps) = for _ in 1:num_steps move!(r,side)
 end