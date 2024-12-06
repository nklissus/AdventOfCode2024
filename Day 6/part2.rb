map_grid = []
guard_loc = []

File.readlines('input.txt').each do |line|
    map_grid << line.strip
end

map_grid.length.times do |y|
    next unless map_grid[y].include? '^'
    guard_loc = [map_grid[y].index('^'), y]
end

def is_loop(map, start_loc)
    directions = [[0, -1, "A"], [1, 0, "B"], [0, 1, "C"], [-1, 0, "D"]].cycle
    curr_dir = directions.next
    curr_loc = start_loc.dup

    while curr_loc[0] < map[0].length && curr_loc[0] >= 0 && curr_loc[1] < map.length && curr_loc[1] >= 0 do
        next_space = map[curr_loc[1]][curr_loc[0]]

        return true if next_space == curr_dir[2]

        if '#ABCD'.include? next_space
            map[curr_loc[1]][curr_loc[0]] = curr_dir[2]
            curr_loc[0] -= curr_dir[0]
            curr_loc[1] -= curr_dir[1]
            curr_dir = directions.next
        end

        map[curr_loc[1]][curr_loc[0]] = 'X' unless next_space == '^'
        curr_loc[0] += curr_dir[0]
        curr_loc[1] += curr_dir[1]
    end
    false
end

# Make a temporary map to find the possible locations for obstructions
poss_map = map_grid.map(&:dup)
is_loop(poss_map, guard_loc)

total_loops = 0
map_grid.length.times do |y|
    map_grid[y].length.times do |x|
        next unless poss_map[y][x] == 'X'
        temp_map = map_grid.map(&:dup)
        temp_map[y][x] = '#'
        total_loops += 1 if is_loop(temp_map, guard_loc)
    end
end

puts "The guard gets stuck in a loop with obstructions in #{total_loops} positions"
