const filename = pwd()*"\\2023\\InputFiles\\Day03.txt"

# Probably want to see if each number has a symbol instead
function check_string_for_symbol(a)
    is_number = !isdigit(a);
    is_dot = ('.' == a);
    return (is_number & !is_dot)
end

# This probably isn't the way to do it
function findsymbols()
    f = readlines(filename)
    #part_row = Array{Float64}();
    part_count = 0;
    current_line = string();
    for i = 1:length(f)
        current_line = f[i];
        for j = 1:length(current_line)
            if check_string_for_symbol(current_line[j])
                part_numbers = check_for_numbers(i,j);
            end
            println(current_line[j])
        end
    end
    println(part_count)
end


function scan_numbers_for_symbols()
    f = readlines(filename)
    total_sum = 0;
    for i in eachindex(f)
        current_line = f[i];
        j = 1;
        while j <= length(current_line)
            if isdigit(current_line[j]);
                part_number = find_number(i,j)
                println(part_number)
                is_symbol = false;
                for k = 0:length(part_number)-1
                    if !is_symbol
                        is_symbol = check_for_symbols(i,j+k);
                    end
                end

                if is_symbol
                    total_sum += parse(Int,part_number);
                end
                j += length(part_number)
            else
                j += 1;
            end
         end
         
    end
    println(total_sum)
end





function check_for_symbols(row,column)
    f = readlines(filename)
    max_rows = length(f);
    max_columns = length(f[1])
    total_sum = 0;
    is_symbol = false
    for row_scan = -1:1
        current_row = row+row_scan;
        if (current_row > 0) & (current_row < max_rows+1)
            current_line = f[current_row]
            for column_scan = -1:1
                current_column = column+column_scan;
                if (current_column > 0) & (current_column < max_columns+1)
                    if !is_symbol
                        is_symbol = check_string_for_symbol(current_line[current_column])
                    end
                end
            end
        end
    end
    return is_symbol
end


function find_number(row,column)
    f = readlines(filename);
    line = f[row];
    max_columns = length(f[1])
    new_column = column;
    if new_column < 1
        is_number = false
    else
        is_number = isdigit(line[new_column]);
    end
    part_number = "";

    while is_number 
        part_number = line[new_column]*part_number; 
        new_column -=1;    
        if new_column < 1
            is_number = false
        else
            is_number = isdigit(line[new_column]);
        end
    end

    new_column = column+1
    if new_column > max_columns
        is_number = false
    else
        is_number = isdigit(line[new_column]);
    end

    while is_number 
        part_number = part_number*line[new_column]; 
        new_column +=1;    
        if new_column > max_columns
            is_number = false
        else
            is_number = isdigit(line[new_column]);
        end
    end
    return(part_number)
end





# Part 2

function scan_numbers_for_gears()
    f = readlines(filename)
    total_sum = 0;
    for i in eachindex(f)
        current_line = f[i];
        j = 1;
        while j <= length(current_line)
            if isdigit(current_line[j]);
                part_number = find_number(i,j)
                println(part_number)
                is_gear = false;
                for k = 0:length(part_number)-1
                    if !is_gear
                        is_gear = check_for_gears(i,j+k);
                    end
                end

                if is_gear
                    total_sum += parse(Int,part_number);
                end
                j += length(part_number)
            else
                j += 1;
            end
         end
         
    end
    println(total_sum)
end

function check_for_gears(row,column)
    f = readlines(filename)
    max_rows = length(f);
    max_columns = length(f[1])
    total_sum = 0;
    is_symbol = false
    for row_scan = -1:1
        current_row = row+row_scan;
        if (current_row > 0) & (current_row < max_rows+1)
            current_line = f[current_row]
            for column_scan = -1:1
                current_column = column+column_scan;
                if (current_column > 0) & (current_column < max_columns+1)
                    if !is_symbol
                        is_symbol = check_string_for_symbol(current_line[current_column])
                    end
                end
            end
        end
    end
    return is_symbol
end