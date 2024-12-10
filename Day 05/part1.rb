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

correct_updates = []
middle_total = 0

updates_list.each do |update|
    is_correct = true
    (0...update.length - 1).each do |page_index|
        is_correct = false unless rules[update[page_index]].include? update[page_index + 1]
    end
    middle_total += update[update.length/2].to_i unless !is_correct
end

puts "The total of middle numbers for correctly ordered rows is: #{middle_total}"
