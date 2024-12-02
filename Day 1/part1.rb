list1 = []
list2 = []
total_dist = 0

File.readlines('input.txt').each do |line|
    split_list = line.split
    list1.append(split_list[0].to_i)
    list2.append(split_list[1].to_i)
end

# This sorts the lists in descending order
list1 = list1.sort
list2 = list2.sort

list1.each_index do |i|
    line_dist = list2[i] - list1[i]
    total_dist += line_dist.abs()
end

puts "The total distance between the lists is: #{total_dist}"
