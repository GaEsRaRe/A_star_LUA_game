--[[
Artificial Inteligence project
Map Loader

Grid-based map

States:
0 is empty spot
1 is blocked spot
3 is finish spot

We use A* Algorith to find the best possible path

]]-- 

require "data"
--Initializing seed
math.randomseed(os.time()) 




function wait(seconds)
  local start = os.time()
  repeat until os.time() > start + seconds
  end
--global variables


  start = {}  --This will be the start position with a X,Y point in the map, depends of the map and stuff
  final = {}

  size = 8  --actual map size, can vary depend of the options

--helping functions

  function get_closest(array)
    max = 900 --
    pos = 1
    for n = 1,#array do
      if array[n][3]  < max then
        max = array[n][3]
        pos = n
      end
    end

    return pos
  end


--code to generate
  function create_map(size)
    
    --We start our map
    local map = {}
    for n = 1,size do 
      map[n] = {}
    end
    for n = 1,size do
      for m = 1,size do 
        map[n][m] = 0
      end
    end
--borders
    for n = 1,size do
      map[1][n] = 1
      map[size][n] = 1
      map[n][1] = 1
      map[n][size] = 1

    end
    for n = 3,size-2 do
      for i = 1, math.random(1,4) do
        map[n][math.random(2,6)] = 1
      end

    end

--we select start and finish
    start = {2,math.random(2,size - 1)}
    final = {size,math.random(2,size - 1)}
    map[size][final[2]] = 3
    map[2][start[2]] = 0
    return map
  end



  function dont_exist(x,y,array)
    for i = 1,#array do
      if array[i][1] == x then
        if array[i][2] == y then
          print("find same")
          return false
        end
      end
    end
    return true
  end
--code to work
  function get_heuristic(x,y,xf,yf)
    return math.sqrt((x-xf)*(x-xf) + (y-yf)*(y - yf))*10
  end

--a = get_heuristic(0,0,4,5)

  map1 = create_map(size)



--develop variables
--we create our map

  function find_parent(x,y,array)
    for n = 1,#array do
      for n = 1,#array do
        if array[n][1] == x and array[n][2] == y then
          return array[n][5]
        end
      end
    end
  end 

--code to generate
  function show(array)
    for n = 1,size do
      for j = 1,size do
        print(n,j,array[n][j])
      end
    end
  end

  function get_directions(x,y,xf,yf)
    local sx,sy = x,y
    local movement = {}  -- 1 is left, 2 is right, 3 is up, 4 is down
    local weight = get_heuristic(x,y,xf,yf)
    local distance = 0;
    local counter = 1;
    local node = {x,y,distance + weight,weight,0} --posx, posy, weight,
    local open = {node}
    local visited = {}
    local find = false
    local actual = open[get_closest(open)]
    local temp = {}
    table.insert(visited,actual)
    while(find == false) do
      table.remove(open,get_closest(open))
      --we check and add the parents
      if map1[x+1][y] ~= 1 then
        if dont_exist(x+1,y,open) then
          if dont_exist(x+1,y,visited) then
            temp = {x + 1,y, 10 + distance + get_heuristic(x+1,y,xf,yf),distance + 10,1}
            table.insert(open,temp)
          end
        end
        --Temp

      end
      if map1[x-1][y] ~= 1 then
        if dont_exist(x-1,y,open) then
          if dont_exist(x-1,y,visited) then
            temp = {x - 1,y, 10 + distance + get_heuristic(x-1,y,xf,yf),distance + 10,2}
            table.insert(open,temp)
            print(x,y,actual[3])
          end
        end
      end
      if map1[x][y+1] ~= 1 then
        if dont_exist(x,y+1,open) then
          if dont_exist(x-1,y,visited) then
            temp = {x,y + 1, 10 + distance + get_heuristic(x,y+1,xf,yf),distance + 10,3}
            table.insert(open,temp)
          end
        end
      end
      if map1[x][y-1] ~= 1 then
        if dont_exist(x,y-1,open) then
          temp = {x,y - 1, 10 + distance + get_heuristic(x,y-1,xf,yf),distance + 10,4}
          table.insert(open,temp)
        end
      end

      actual = open[get_closest(open)] --we get the max node actually visitable from the open ones
      x,y = actual[1],actual[2] --we asign the values to x, y
      print(x,y,actual[3],actual[5])
      distance = actual[4]
      if x == xf and y == yf then
        find = true
        temp = {x,y}
        table.insert(movement,1,temp)
      end
      table.insert(visited,actual)
      --we find our path

    end
    print("we find it")
    --Now we get the path
    finished = false
    while finished ~= true do
      direction = find_parent(x,y,visited)
      if direction == 1 then
        x = x - 1
      end
      if direction == 2 then
        x = x + 1
      end
      if direction == 3 then
        y = y - 1
      end
      if direction == 4 then
        y = y + 1
      end
      temp = {x,y}
      table.insert(movement,1,temp)
      if x== sx and y == sy then
        finished = true
      end
    end
    for n = 1,#movement do
      print(movement[n][1],movement[n][2]) --x and y
    end
    return movement
  end

  function get_movement(directions)
    local to_move = {} --an array for the n-1 movements with the array
    for i = 1,(#directions - 1) do
      if directions[i][1] < directions[i+1][1] then
        table.insert(to_move,2)
      end
      if directions[i][1] > directions[i+1][1] then
        table.insert(to_move,1)
      end
      if directions[i][2] > directions[i+1][2] then
        table.insert(to_move,3)  --
      end
      if directions[i][2] < directions[i+1][2] then
        table.insert(to_move,4)
      end
    end
    for n = 1,#to_move do
      print(to_move[n])
    end
    return to_move
  end


--show(map1)
  path = get_directions(start[1],start[2],final[1],final[2])
--trial code

  function restart()
    start = {}  --This will be the start position with a X,Y point in the map, depends of the map and stuff
    final = {}
    map1 = create_map(size)
    path = get_directions(start[1],start[2],final[1],final[2])
  end
