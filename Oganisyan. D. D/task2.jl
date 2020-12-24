function moves!(r::Robot, side::HorizonSide)
    while isborder(r, side) == false
        move!(r, side)
        putmarker!(r)
    end
end

function getSP(r::Robot)
    x, y = 0, 0

    while isborder(r, Sud) == false
        y += 1
        move!(r, Sud)
    end

    while isborder(r, West) == false
        x += 1
        move!(r, West)
    end

    return x, y
end


function getSP!(r::Robot, x, y)
    while y > 0
        y -= 1
        move!(r, Nord)
    end

    while x > 0
        x -= 1
        move!(r, Ost)
    end
end

function main2!(r::Robot)
    x, y = getSP(r)
    moves!(r, Nord)
    moves!(r, Ost)
    moves!(r, Sud)
    moves!(r, West)
    getSP!(r, x, y)
    #Каждое условие выполнено
end