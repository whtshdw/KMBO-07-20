module ShessMark
    using HorizonSideRobots
    import Main.moves!, Main.inverse
#=
    После выполнеия include("roblib.jl") имена функций moves!, inverse оказались в пространстве имен Main
    и теперь их от туда необходимо импортировать в наш модуль
=#
    export mark_chess

    FLAG_MARK = nothing

    function mark_chess(r)
        global FLAG_MARK 

        num_hor = moves!(r,West)
        num_vert = move!(r,Sud)
        #УТВ: Робот - в юго-западном углу
        FLAG_MARK = odd(num_hor+num_vert) ? true : false
        # значение FLAG_MARK определяет, нужно ли в юго-западном углу ставить маркер

        side = Ost
        mark_chess(r,side)
        while isborder(Nord)==false
            move!(r,Nord); FLAG_MARK = !FLAG_MARK
            side = inverse(side)
            mark_chess(r,side)
        end
        #Робот - у северной границы поля И маркеры расставлены в шахматном порядке

        for side in (West,Sud) moves!(r,side) end
        #Робот - в юго-западном углу

        move!(r,Ost,num_hor)
        move!(r,Nord,num_vert)
        #Робот - в исходном положении
    end
    function mark_chess(r,side)
        global FLAG_MARK
        while isborder(r,side)==false
            if FLAG_MARK == true
                putmarker(r)
            end
            move!(r,side); FLAG_MARK = !FLAG_MARK
        end
    end
end
