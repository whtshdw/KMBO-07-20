function moveFull!(r::Robot, side::HorizonSide, n)
      while n > 0
          move!(r, side)
          n -= 1
      end
  end
  
mutable struct sideChoice
      r::Robot
      side::HorizonSide
      n::Int

      function sideChoice(r, side, n)
            if n % 2 == 1
                  new(r, West, n)
            else
                  new(r, Ost, n)
            end
      end
end
  
  function main8!(r::Robot)
      cnt = 0
  
      while true
          if isborder(r, Nord) == false
              break
          end
  
          cnt += 1

          choice = sideChoice(r, West, cnt)

          moveFull!(r, choice.side, cnt)
      end         
  end