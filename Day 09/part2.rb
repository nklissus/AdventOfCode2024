lines = File.readlines('test.txt').map(&:strip)
input_str = lines[0].split('').map(&:to_i)
total_length = input_str.sum



# Gets file definitions
file_defs = []
(input_str.length / 2).times do |i|
    index = i * 2
    file_defs << [i, input_str[index]]
    file_defs << ['spc', input_str[index + 1]]
end
file_defs << [file_defs[-2][0] + 1, input_str[-1]]

empty_spaces = file_defs.select{ |x| x[0] == 'spc' }.map{ |x| x[1]}

rev_file_defs = file_defs.dup.reverse
rev_file_defs.each do |file_def|
    next if file_def[0] == 'spc'
    empty_spaces.length.times do |space_length_index|
        space_length = empty_spaces[space_length_index]
        next unless file_def[1] <= space_length
        empty_spaces[space_length_index] = space_length - file_def[1]
        space_index = file_defs.index(['spc', space_length]).to_i
        break if space_index > file_defs.index(file_def)
        file_defs[file_defs.index(file_def)] = ['space', file_def[1]]
        file_defs.delete(file_def)
        file_defs[space_index] = ['spc', space_length - file_def[1]]
        file_defs.insert(space_index, file_def)
        break
    end
end

def_plan = []
file_defs.each do |final_def|
    final_def[1].times do
        if ['spc', 'space'].include? final_def[0]
            def_plan << '.'
        else
            def_plan << final_def[0]
        end
    end
end

checksum = 0
def_plan.length.times do |plan_index|
    next if def_plan[plan_index] == '.'
    checksum += def_plan[plan_index] * plan_index
end

puts "The filesystem checksum is #{checksum}"