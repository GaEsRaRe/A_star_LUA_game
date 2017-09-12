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

--Initializing seed
math.randomseed(os.time()) 

--global variables


start = {}  --This will be the start position with a X,Y point in the map, depends of the map and stuff
final = {}

size = 8  --actual map size, can vary depend of the options

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

  --we select start and finish
  start = {0,math.random(1,size)}
  final = {size,math.random(1,size)}
  map[size][final[2]] = 3
  return map
end

function fill_map(map)
  
end


--code to work




--develop variables
--we create our map


function get_heuristic(x,y,xf,yf)
  return math.abs(x-xf) + math.abs(y - yf)
end

function get_directions(x,y,xf,yf)
  local movement = {}  -- 1 is left, 2 is right, 3 is up, 4 is down
  local weight = get_heuristic(x,y,xf,yf)
  local distance = 0;
  local node = {x,y,distance + weight} --posx, posy, weight
  local open = {node}
  local visited = {}
  local find = false
  while(find == false) do
    
  end


end

--code to generate
a = get_heuristic(0,0,4,5)

map1 = create_map(size)

for n = 1,size do
  for j = 1,size do

    print(n,j,map1[n][j])
  end
end

print(start[1],start[2])

--trial code
print(math.random(1,10))