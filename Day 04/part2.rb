lines = []

File.readlines('input.txt').each do |line|
    lines << line.chars 
end

def check_for_M(coords, grid)
    coord_sets = []
    [-1, 1].each do |y|
        [-1, 1].each do |x|
            if (coords[0] + x).between?(0,grid[0].length-1) && 
                (coords[1] + y).between?(0,grid.length-1) && 
                grid[coords[1] + y][coords[0] + x] == 'M'

                coord_sets << [x,y]
            end
        end
    end
    coord_sets
end

def check_cross(coords, direction, grid)
    if (coords[0] - direction[0]).between?(0,grid[0].length-1) &&
        (coords[1] - direction[1]).between?(0,grid.length-1) &&
        grid[coords[1] - direction[1]][coords[0] - direction[0]] == 'S'
        return true
    end
end
    
count = 0
lines.length.times do |y|
    lines[y].length.times do |x|
        if lines[y][x] == 'A'
            next_m = check_for_M([x,y], lines)
            next unless next_m.length > 1

            valid = next_m.all? { |direction| check_cross([x, y], direction, lines) }
            count += 1 if valid
        end
    end
end

puts "There are #{count} 'X-MASs'"
