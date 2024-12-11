lines = File.readlines('input.txt').map(&:strip)
stones = lines[0].split().tally

def update_stones(stones)
    new_stones = Hash.new 0
    index = 0
    stones.each_key do |value|
        if value == '0'
            new_stones['1'] += stones[value]
        elsif value.length.even?
            # to_i.to_s gets rid of leading zeros
            first_half = value[0..(value.length/2-1)].to_i.to_s
            second_half = value[(value.length/2)..-1].to_i.to_s

            new_stones[first_half] += stones[value]
            new_stones[second_half] += stones[value]
        else
            new_stones[(value.to_i * 2024).to_s] += stones[value]
        end
    end
    new_stones
end

75.times do
    stones = update_stones(stones)
end

total_stones = stones.each.map{ |j, k| k }.sum

puts "After 75 blinks there are #{total_stones} stones"
