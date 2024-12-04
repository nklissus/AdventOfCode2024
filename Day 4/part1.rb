lines = []

File.readlines('input.txt').each do |line|
    lines << line.chars 
end

def check_for_M(coords, grid)
    coord_sets = []
    [-1, 0, 1].each do |y|
        [-1, 0, 1].each do |x|
            if (coords[0] + x).between?(0,grid[0].length-1) && 
                (coords[1] + y).between?(0,grid.length-1) && 
                grid[coords[1] + y][coords[0] + x] == 'M'

                coord_sets.append([x,y])
            end
        end
    end
    coord_sets
end

def check_for_AS(coords, direction, grid)
    if (coords[0] + (2 * direction[0])).between?(0,grid[0].length-1) && 
        (coords[1] + (2 * direction[1])).between?(0,grid.length-1)

        if grid[coords[1] + direction[1]][coords[0] + direction[0]] == 'A' && 
            grid[coords[1] + (2 * direction[1])][coords[0] + (2 * direction[0])] == 'S'

            return true
        end
    end
end
    
count = 0
lines.length.times do |y|
    lines[y].length.times do |x|
        if lines[y][x] == 'X'
            next_m = check_for_M([x,y], lines)
            next if next_m.empty?

            next_m.each do |direction|
                if check_for_AS([x + direction[0], y + direction[1]], direction, lines)
                    count += 1
                end
            end
        end
    end
end

puts "'XMAS' appears #{count} times"
