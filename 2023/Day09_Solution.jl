const filename = pwd()*"\\2023\\InputFiles\\Day09.txt"

using DelimitedFiles

function extrapolate(vector_set)
    difference = 1;
    end_value =[];
    current_set = vector_set;
    count = 0
    zero_count = 0;
    while !(zero_count == length(difference)) & (count < 100)
        len = length(current_set);
        zero_count = 0;
        difference = [];
        for i = 2:len
            push!(difference,current_set[i]-current_set[i-1])   
            if i == len
               push!(end_value,current_set[i]) 
            end
            if difference[i-1] == 0
                zero_count += 1
            end
        end
        count += 1;
        current_set = difference;
    end
    new_value = sum(end_value);
    return new_value
end


function extrapolate_back(vector_set)
    difference = 1;
    end_value =[];
    current_set = vector_set;
    count = 0
    zero_count = 0;
    while !(zero_count == length(difference)) & (count < 100)
        len = length(current_set);
        zero_count = 0;
        difference = [];
        for i = 2:len
            push!(difference,current_set[i]-current_set[i-1])   
            if i == len
               push!(end_value,current_set[i]) 
            end
            if difference[i-1] == 0
                zero_count += 1
            end
        end
        count += 1;
        current_set = difference;
    end
    new_value = sum(end_value);
    return new_value
end


function get_predicted_values()
    f = readdlm(filename)
    (rows,columns) = size(f);
    total_sum = 0;
    for i = 1:rows
        new_value = extrapolate(f[i,:]);
        total_sum = total_sum + new_value;
    end
    println(total_sum)
    return total_sum
end



# Part 2
function extrapolate_back(vector_set)
    difference = 1;
    start_value = [];
    current_set = vector_set;
    count = 0
    zero_count = 0;
    while !(zero_count == length(difference)) & (count < 100)
        len = length(current_set);
        zero_count = 0;
        difference = [];
        for i = 2:len
            push!(difference,current_set[i]-current_set[i-1])   
            if i == 2
               push!(start_value,current_set[i-1]) 
            end
            if difference[i-1] == 0
                zero_count += 1
            end
        end
        count += 1;
        current_set = difference;
    end
    update = start_value[end];
    for i = 1:length(start_value)-1
        update = start_value[end-i]-update;
    end
    new_value = update;
    return new_value
end


function get_predicted_values_back()
    f = readdlm(filename)
    (rows,columns) = size(f);
    total_sum = 0;
    for i = 1:rows
        new_value = extrapolate_back(f[i,:]);
        total_sum = total_sum + new_value;
    end
    println(total_sum)
    return total_sum
end
