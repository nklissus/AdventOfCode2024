map_grid = []
guard_loc = []
directions = [[0, -1], [1, 0], [0, 1], [-1, 0]].cycle

File.readlines('input.txt').each do |line|
    map_grid << line.strip
end

map_grid.length.times do |y|
    next unless map_grid[y].include? '^'
    guard_loc = [map_grid[y].index('^'), y]
end

curr_dir = directions.next
while guard_loc[0] < map_grid[0].length && guard_loc[0] >= 0 && guard_loc[1] < map_grid.length && guard_loc[1] >= 0 do
    next_space = map_grid[guard_loc[1]][guard_loc[0]]

    if next_space == '#'
        guard_loc[0] -= curr_dir[0]
        guard_loc[1] -= curr_dir[1]
        curr_dir = directions.next
    end

    map_grid[guard_loc[1]][guard_loc[0]] = 'X'
    guard_loc[0] += curr_dir[0]
    guard_loc[1] += curr_dir[1]
end

total_positions = 0
map_grid.each do |line|
    total_positions += line.count('X')
end

puts "The guard visits a total of #{total_positions} positions"
