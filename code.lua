
start = {0,0}

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
  start = math.random(1,size)
  final = math.random(1,size)
  
end

map = create_map(8)  --we create our map


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
   map[x][y]
   
   table.insert(map,temp);
  end
  
  
end


a = get_heuristic(0,0,4,5)

print(a)