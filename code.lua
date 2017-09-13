--[[
Artificial Inteligence project
Map Loader

Grid-based map

States:
0 is empty spot
1 is blocked spot
2 is character spot
3 is finish spot
4 is finished spot

We use A* Algorith to find the best possible path

]]-- 



require "data"
--Initializing seed
math.randomseed(os.time()) 

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
  --we select start and finish
  start = {2,math.random(1,size)}
  final = {size,math.random(1,size)}
  map[size][final[2]] = 3
  return map
end

function fill_map(map)

end


--code to work
function get_heuristic(x,y,xf,yf)
  return (math.abs(x-xf) + math.abs(y - yf))*10
end

a = get_heuristic(0,0,4,5)

map1 = create_map(size)


--develop variables
--we create our map




function get_directions(x,y,xf,yf)
  local movement = {}  -- 1 is left, 2 is right, 3 is up, 4 is down
  local weight = get_heuristic(x,y,xf,yf)
  local distance = 0;
  local node = {x,y,distance + weight,weight,0} --posx, posy, weight,
  local open = {node}
  local visited = {}
  local find = false
  print(get_closest(open))
  local actual = open[get_closest(open)]
  local temp = {}
  while(find == false) do
    table.remove(open,get_closest(open))
    --we check and add the parents
    if map1[x+1][y] ~= 1 then
      temp = {x + 1,y, 10 + distance + get_heuristic(x+1,y,xf,yf),distance + 10,1}
      table.insert(open,temp)
    end
    if map1[x-1][y] ~= 1 then
      temp = {x - 1,y, 10 + distance + get_heuristic(x-1,y,xf,yf),distance + 10,2}
      table.insert(open,temp)
    end
    if map1[x][y+1] ~= 1 then
      temp = {x,y + 1, 10 + distance + get_heuristic(x,y+1,xf,yf),distance + 10,3}
      table.insert(open,temp)
    end
    if map1[x][y-1] ~= 1 then
      temp = {x,y - 1, 10 + distance + get_heuristic(x,y-1,xf,yf),distance + 10,4}
      table.insert(open,temp)
    end

    actual = open[get_closest(open)] --we get the max node actually visitable from the open ones
    x,y = actual[1],actual[2] --we asign the values to x, y
    print(x,y,actual[3])
    distance = actual[4]
    if x == xf and y == yf then
      find = true
    end

  end
  print("we find it")

end

--code to generate
function show(array)
  for n = 1,size do
    for j = 1,size do

      print(n,j,array[n][j])
    end
  end
end


print(start[1],start[2])

dummy = {{2,1,9},{2,3,4},{2,2,8},{2,3,4},{2,2,8}}

print(get_closest(dummy))

show(map1)
get_directions(2,3,7,5)
--trial code
--print(math.random(1,10))