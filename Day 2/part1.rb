safe_reports = 0
bad_report = false

File.readlines('input.txt').each do |line|
    values = line.split.map(&:to_i)
    ascend = values[0] < values[1]
    prev_val = values[0]
    values.drop(1).each do |value|
        break if bad_report
        if ascend
            if value < prev_val
                bad_report = true
                break
            end
        elsif !ascend
            if value > prev_val
                bad_report = true
                break
            end
        end

        if (prev_val - value).abs > 3 || (prev_val - value) == 0
            bad_report = true
        end

        prev_val = value
    end

    if !bad_report
        safe_reports += 1
    end

    bad_report = false
end

puts "Total safe reports: #{safe_reports}"