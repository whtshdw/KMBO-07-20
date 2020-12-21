function pathFinder(r::Robot)
      path = []
      while isborder(r, West) == false || isborder(r, Sud) == false
            if isborder(r, West) == false
                  move!(r, West)
                  push!(path, true)
            else
                  move!(r, Sud)
                  push!(path, false)
            end
      end

      return reverse(path)
end

function leftDown!(r::Robot, path)
      for i in path
            if i move!(r, Ost)
            else move!(r, Nord)
            end
      end
end

mutable struct moveSide
      r::Robot
      side::HorizonSide

      function moveSide(r, side)
            while isborder(r, side) == false
                  move!(r, side)
            end
            putmarker!(r)
      end
end

function main5!(r::Robot)
      path = pathFinder(r)
      #Робот в левом нижнем углу и массив path создан

      moveSide(r, Nord)
      moveSide(r, Ost)
      moveSide(r, Sud)
      moveSide(r, West)
      #Каждый угол помечен

      leftDown!(r, path) #Робот в исходном положении
end