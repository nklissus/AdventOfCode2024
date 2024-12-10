lines = File.readlines('input.txt').map(&:strip)

freqs = Hash.new { |h, k| h[k] = [] }

lines.length.times do |y|
    lines[y].split('').length.times do |x|
        char = lines[y][x]
        freqs[char] << [x ,y] unless char == '.'
    end
end

node_locations = []
freqs.each do |freq|
    callsign = freq[0]
    antinodes = []
    freq[1].each do |initial_coords|
        freq[1].each do |second_coords|
            next unless initial_coords != second_coords
            antinodes << [initial_coords[0] + (initial_coords[0] - second_coords[0]), initial_coords[1] + (initial_coords[1] - second_coords[1])]
        end
    end
    antinodes.each do |node_coords|
        next unless node_coords[0] >= 0 && node_coords[0] < lines[0].length &&
        node_coords[1] >= 0 && node_coords[1] < lines.length
        node_locations << node_coords unless node_locations.include? node_coords
    end
end

puts "There are #{node_locations.length} unique antinode locations"
