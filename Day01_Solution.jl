

const filename = "C:\\Users\\Steph\\OneDrive\\Documents\\AdventofCode\\2023\\Day01.txt"

# Part One (Only Integers)
function getCalibrationValue_Part1()
    f = readlines(filename)
    calibration_sum = 0
    for i = 1:length(f)
        current_line = split(f[i])
        integers_in_line = filter(isdigit,current_line[1])
        number_of_integers_in_line = length(string(integers_in_line))
        calibration_value = integers_in_line[1] * integers_in_line[number_of_integers_in_line]
        calibration_sum += parse(Int,calibration_value);
    end
    println(calibration_sum)
end


# Part Two
function getCalibrationValue_Part2()
    f = readlines(filename)
    lookup = ["1" "2" "3" "4" "5" "6" "7" "8" "9" "one" "two" "three" "four" "five" "six" "seven" "eight" "nine"]
    calibration_sum = 0;
    for i = 1:length(f)
        current_line = split(f[i])
        starting_index = 100;
        starting_value = 1; 
        final_index = 0;
        final_value = 1; 
        for j = 1:18
            is_value_present = false;
            is_value_present = occursin(lookup[j],current_line[1]);
            if is_value_present
                num = j;
                if num > 9
                    num -= 9
                end
                start_index_value = findfirst(lookup[j], current_line[1])
                if starting_index > start_index_value[1]
                    starting_value = num;
                    starting_index = start_index_value[1]
                end
                final_index_value = findlast(lookup[j], current_line[1])
                if final_index < final_index_value[1]
                    final_value = num;
                    final_index = final_index_value[1]
                end
            end
        end
        calibration_value = string(starting_value) * string(final_value)    
        calibration_sum += parse(Int,calibration_value);
    end
    println(calibration_sum)
end




