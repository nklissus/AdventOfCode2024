topo_map = File.readlines('test.txt').map(&:strip).map { |x| x.split('').map(&:to_i) }

trailheads = []
topo_map.each_with_index do |line, y|
    line.each_with_index do |value, x|
        trailheads << [y, x] if value == 0
    end
end

def find_next(map, curr_coords, curr_value)
    adjacent = [[-1, 0], [0, -1], [1, 0], [0, 1]]
    eligible_pos = []
    adjacent.each do |direction|
        adj_coords = [curr_coords[0] + direction[0], curr_coords[1] + direction[1]]
        next if adj_coords[0] < 0 || adj_coords[0] >= map[0].length || adj_coords[1] < 0 || adj_coords[1] >= map.length
        eligible_pos << adj_coords if map[adj_coords[0]][adj_coords[1]] == curr_value + 1
    end
    eligible_pos
end

def find_trails(map, trailhead)
    curr_val = 0
    next_spaces = [trailhead.dup]
    until curr_val == 9
        curr_spaces = next_spaces.dup
        next_spaces = []
        curr_spaces.each do |space_coords|
            next_spaces += find_next(map, space_coords, curr_val)
        end
        curr_val += 1
    end
    next_spaces.length
end

tot_rating = 0
trailheads.each do |head|
    tot_rating += find_trails(topo_map, head)
end

puts "The sum of all trailhead ratings is #{tot_rating}"