function getHorLen(r::Robot)
      cnt = 0
      while isborder(r, Ost) == false
          cnt += 1
          move!(r, Ost)
      end
      while isborder(r, West) == false
          move!(r, West)
      end
      return cnt
end

mutable struct coords
      r::Robot
      x::Int
      y::Int
      function coords(r, x, y)
            while isborder(r, Sud) == false
                  move!(r, Sud)
                  y += 1
            end
            while isborder(r, West) == false
                  move!(r, West)
                  x += 1
            end
            new(r, x, y)
      end
end

function backToWest!(r::Robot)
      while isborder(r, West) == false
            move!(r, West)
      end
end

function markOstUntil!(r::Robot, n)
      while n > 0
            putmarker!(r)
            move!(r, Ost)
            n -= 1
      end
      putmarker!(r)
end

function main4!(r::Robot)
      XY = coords(r, 0, 0) #getting coords via COORDS type
      n = getHorLen(r)

      while isborder(r, Nord) == false && n > 0
            markOstUntil!(r, n)
            move!(r, Nord)
            n -= 1
            backToWest!(r)
      end

      markOstUntil!(r, n)

      posX, posY = XY.x, XY.y

      coords(r, 0, 0) #return to the 0, 0

      while posX > 0
            move!(r, Ost)
            posX -= 1
      end

      while posY > 0
            move!(r, Nord)
            posY -= 1
      end

      #Все условия выполнены не за минимальное количество шагов, однако этого не просилось
end