list1 = []
list2 = []
sim_score = 0

File.readlines('input.txt').each do |line|
    split_list = line.split
    list1.append(split_list[0].to_i)
    list2.append(split_list[1].to_i)
end


list1.each do |line|
    count = list2.count(line)
    sim_score += count * line
end

puts "The list's similarity score is: #{sim_score}"
