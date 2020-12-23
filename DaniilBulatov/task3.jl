function markWholeSide!(r::Robot, side::HorizonSide)
    while isborder(r, side) == false
        move!(r, side)
        putmarker!(r)
    end
end

function main3!(r::Robot)
    #позиция 0, 0
    cnt_x, cnt_y = 0, 0
    while isborder(r, West) == false
        move!(r, West)
        cnt_x += 1
    end
    while isborder(r, Sud) == false
        move!(r, Sud)
        cnt_y += 1
    end

    #Начинаем закраску
    cnt = 1
    putmarker!(r)
    while isborder(r, Nord) == false
        if cnt % 2 == 1
            markWholeSide!(r, Ost)
            move!(r, Nord)
            putmarker!(r)
        else
            markWholeSide!(r, West)
            move!(r, Nord)
            putmarker!(r)
        end
        cnt += 1
    end

    if cnt % 2 == 1
        markWholeSide!(r, Ost)
    else
        markWholeSide!(r, West)
    end
    #Всё поле промаркировано

    #Возвращаем в позицию 0, 0
    while isborder(r, West) == false
        move!(r, West)
    end
    while isborder(r, Sud) == false
        move!(r, Sud)
    end

    #Возвращаем в начальную позицию
    while cnt_x > 0
        move!(r, Ost)
        cnt_x -= 1
    end
    while cnt_y > 0
        move!(r, Nord)
        cnt_y -= 1
    end
    #Робот в исходном положении
end