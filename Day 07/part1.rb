lines = []

lines = File.readlines('input.txt').map(&:strip)

def is_possible(line)
    split_line = line.split(': ')
    total = split_line[0]
    values = split_line[1].strip.split

    perm_arr = ['+', 'x']

    perms = perm_arr.repeated_permutation(values.length - 1)

    perms.each do |perm|
        temp_tot = values[0].to_i
        (values.length - 1).times do |i|
            if perm[i] == '+'
                temp_tot = (temp_tot + values[i + 1].to_i)
            else
                temp_tot = (temp_tot * values[i + 1].to_i)
            end
        end
        return true if temp_tot == total.to_i
    end
    false
end

total_result = 0
lines.each do |line|
    total_result += line.split(':')[0].to_i if is_possible(line)
end

puts "The total calibration result is #{total_result}"
