safe_reports = 0

def check_report(report_array)
    bad_report = false
    ascend = report_array[0] < report_array[1]
    prev_val = report_array[0]
    report_array.drop(1).each do |value|
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

    return !bad_report
end

line_num = 1
File.readlines('input.txt').each do |line|
    values = line.split.map(&:to_i)
    if check_report(values)
        safe_reports += 1
    else
        values.length.times do |index|
            # .dup is super important here so we don't modify the original array
            temp_values = values.dup
            temp_values.delete_at(index)
            if check_report(temp_values)
                safe_reports += 1
                break
            end
        end
    end
    line_num += 1
end

puts "Total safe reports: #{safe_reports}"