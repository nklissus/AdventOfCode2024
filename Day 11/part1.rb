lines = File.readlines('input.txt').map(&:strip)
stones = lines[0].split()

def update_stones(stones)
    curr_stones = stones.dup
    index = 0
    stones.length.times do |i|
        value = stones[i]
        if value == '0'
            curr_stones[index] = '1'
        elsif value.length.even?
            first_half = value[0..(value.length/2-1)].to_i
            second_half = value[(value.length/2)..-1].to_i

            curr_stones[index] = second_half.to_s
            curr_stones.insert(index, first_half.to_s)

            index += 1
        else
            curr_stones[index] = (value.to_i * 2024).to_s
        end
        index += 1
    end
    curr_stones
end

stones_working = stones
25.times do
    stones = update_stones(stones)
end

puts "After 25 blinks there are #{stones.length} stones"