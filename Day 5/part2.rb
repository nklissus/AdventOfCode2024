rules_list = []
updates_list = []

File.readlines('input.txt').each do |line|
    rules_list << line.strip if line.include? '|'
    updates_list << line.strip.split(',') if line.include? ","
end

rules = Hash.new { |h, k| h[k] = [] }
rules_list.each do |rule|
    rule_split = rule.split('|')
    rules[rule_split[0]] << rule_split[1]
end

incorrect_updates = []
middle_total = 0

def is_correct(update_list, rules)
    (0...update_list.length - 1).each do |page_index|
        return false unless rules[update_list[page_index]].include? update_list[page_index + 1]
    end
    true
end


updates_list.each do |update|
    incorrect_updates << update unless is_correct(update, rules)
end

incorrect_updates.each do |update|
    num_false = []
    update.length.times do |page_index|
        check_arr = []
        update.each do |check_val|
            next unless update[page_index] != check_val
            check_true = rules[update[page_index]].include? check_val
            check_arr << check_true
        end
        num_false << check_arr.count(false)
    end
    middle_total += update[num_false.index(num_false.length/2)].to_i
end

puts "The total of middle numbers for incorrectly ordered rows is: #{middle_total}"
