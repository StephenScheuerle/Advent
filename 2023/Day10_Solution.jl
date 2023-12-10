const filename = pwd()*"\\2023\\InputFiles\\Day10.txt"


function update_position(pipe_char,incoming_direction)
    row_update = 0;
    column_update = 0;
    for i = 1:8
        if pipe_char == '|'
            if incoming_direction == 'N'
                row_update = 1;
            else
                row_update = -1;
            end
        end
        if pipe_char == '-'
            if incoming_direction == 'W'
                column_update = 1;
            else
                column_update = -1;
            end
        end
        if pipe_char == 'L'
            if incoming_direction == 'N'
                column_update = 1;
            else
                row_update = -1;
            end
        end
        if pipe_char == 'J'
            if incoming_direction == 'N'
                column_update = -1;
            else
                row_update = -1;
            end
        end
        if pipe_char == '7'
            if incoming_direction == 'S'
                column_update = -1;
            else
                row_update = 1;
            end
        end
        if pipe_char == 'F'
            if incoming_direction == 'S'
                column_update = 1;
            else
                row_update = 1;
            end
        end
    end
    return row_update, column_update
end


function find_furthest_distance_in_pipe()
    f = readlines(filename)
    start_row = 0;
    start_column = 0;
    for i = 1:length(f)
        current_line = f[i];
        if occursin("S",current_line)
            start_row = i;
        end
    end
    start_column = findfirst("S",f[start_row]);

    direction = 'W'
    count = 1;
    current_row = start_row;
    current_column = start_column[1] + 1;
    pipe_char = '-';
    while !(pipe_char == 'S') & (count < 100000)
        pipe_char = f[current_row]
        pipe_char = pipe_char[current_column]
        (row_update,column_update) = update_position(pipe_char,direction)

        current_row += row_update
        current_column += column_update

        if row_update == 1
            direction = 'N';
        elseif row_update == -1
            direction = 'S';
        end
        if column_update == 1
            direction = 'W';
        elseif column_update == -1
            direction = 'E';
        end

        println(pipe_char)
        count += 1;
    end

    
    println(count/2);



    return direction

end


# Part 2

using DelimitedFiles

function find_path_of_pipe()
    f = readlines(filename)
    start_row = 0;
    start_column = 0;
    pipe_path = zeros(length(f),length(f[1]))
    for i = 1:length(f)
        current_line = f[i];
        if occursin("S",current_line)
            start_row = i;
        end
    end
    start_column = findfirst("S",f[start_row]);

    direction = 'W'
    count = 0;
    current_row = start_row;
    current_column = start_column[1] + 1;
    pipe_char = '-';
    while !(pipe_char == 'S') & (count < 100000)
        pipe_char = f[current_row]
        pipe_char = pipe_char[current_column]
        (row_update,column_update) = update_position(pipe_char,direction)

        if (pipe_char == '|') || (pipe_char == 'F') || (pipe_char == '7')  || (pipe_char == 'S') 
            pipe_path[current_row,current_column] = 2;
        else
            pipe_path[current_row,current_column] = 1;
        end
        current_row += row_update
        current_column += column_update
  

        if row_update == 1
            direction = 'N';
        elseif row_update == -1
            direction = 'S';
        end
        if column_update == 1
            direction = 'W';
        elseif column_update == -1
            direction = 'E';
        end



        count += 1;
    end
    println(count);
    return pipe_path


end


function check_for_area()
    pipe_path = find_path_of_pipe();
    (rows,columns) = size(pipe_path);
    total_count = 0
    switch_count = 0;
    for i = 1:rows
        counting = false
        for j = 1:columns
            if pipe_path[i,j] == 2
                counting = !counting
                switch_count += 1;
            end


            if counting 
                if pipe_path[i,j] == 0
                    total_count += 1
                end
            end


        end
        println(counting)
    end
    println(total_count)
    println(rows*columns)
end




