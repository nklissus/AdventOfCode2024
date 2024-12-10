lines = File.readlines('input.txt').map(&:strip)
input_str = lines[0]

# Gets file definitions by pairs
file_pairs = []
(input_str.length / 2).times do |i|
    index = i * 2

    file_pairs << [input_str[index], input_str[index + 1]]
end

# Creates file values and adds "empty space" ('.')
file_map = []
file_pairs.length.times do |pair_index|
    file_pairs[pair_index][0].to_i.times do
        file_map << pair_index
    end
    file_pairs[pair_index][1].to_i.times do
        file_map << '.'
    end
end

input_str[-1].to_i.times do
    file_map << file_pairs.length
end

# Identifies the index of all empty spaces
compact_map = file_map.dup
empty_pad = 0
empty_spaces = []
file_map.length.times do |file_index|
    next unless file_map[file_index] == '.'
    empty_spaces << file_index
end 

# Compacts the file according the the problem's rules
file_map.length.times do |file_index|
    last_value = file_map.pop()
    next unless last_value != '.'

    next_empty = empty_spaces[0]
    empty_spaces = empty_spaces[1..-1]
    break unless next_empty
    compact_map[next_empty] = last_value
    empty_pad += 1
end

empty_pad.times do |empty_index|
    compact_map[(empty_index + 1) * -1] = '.'
end

# Calculates the checksum of the compacted file
checksum = 0
compact_map.length.times do |compact_index|
    break unless compact_map[compact_index] != '.'
    checksum += compact_map[compact_index].to_i * compact_index
end

puts "The filesystem checksum is #{checksum}"
