results_total = 0
active = true

File.readlines('input.txt').each do |line|
    matches = line.scan(/mul\([0-9]{1,3},[0-9]{1,3}\)|do\(\)|don\'t\(\)/)
    matches.each do |match|
        if match == "do()"
            active = true
            next
        elsif match == "don't()"
            active = false
            next
        end
        if active
            nums = match.split(',')
            num1 = nums[0][4..-1].to_i
            num2 = nums[1][0..-2].to_i
            results_total += num1 * num2
        end
    end
end

puts "The total of all results is: #{results_total}"