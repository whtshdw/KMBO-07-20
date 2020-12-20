function markWholeSide!(r::Robot, side::HorizonSide)
      while isborder(r, side) == false
          move!(r, side)
          putmarker!(r)
      end
  end

mutable struct coords
      x::Int
      y::Int
end

XY = coords(0, 0)

mutable struct turn
      num::Int
      side::HorizonSide
      
      function turn(num, side)
            if num % 2 == 1
                  new(1, Ost)
            else
                  new(0, West)
            end
      end
end

choice = turn(0, West)

function main3!(r::Robot)
      #позиция 0, 0
      XY.x, XY.y = 0, 0
      while isborder(r, West) == false
            move!(r, West)
            XY.x += 1
      end
      while isborder(r, Sud) == false
            move!(r, Sud)
            XY.y += 1
      end

      #Начинаем закраску
      cnt = 1
      putmarker!(r)
      while isborder(r, Nord) == false
            choice = turn(cnt, West) #CHOICE OBJ IN ACTION
            markWholeSide!(r, choice.side)
            move!(r, Nord)
            putmarker!(r)
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
      while XY.x > 0
            move!(r, Ost)
            XY.x -= 1
      end
      while XY.y > 0
            move!(r, Nord)
            XY.y -= 1
      end
      #Робот в исходном положении
end