const filename = pwd()*"\\2023\\InputFiles\\Day08.txt"


function number_of_steps()
    f = readlines(filename)
    instructions = f[1];
    current_index = 1;
    count = 0;
    found = false
    current_command = "AAA"
    reference_list = create_reference_dictionary();
    (left_list,right_list) = create_instruction_dictionary();

    while (!found) & (count < 30000)
        count += 1;
        if count > length(instructions)
            instructions = instructions*instructions;
        end
        current_index = findall(x-> occursin(current_command,x),reference_list)[1]+2;

        current_line = f[current_index]
        if instructions[count] == 'L'
            current_command = current_line[8:10]
        elseif instructions[count] == 'R'
            current_command = current_line[13:15]
        end

        if occursin(current_command,"ZZZ")
            found = true;
        end

    end
    println(count)
end

function find_index(instruction)
    f = readlines(filename)
    found = false
    j = 2
    index = 0;
    while !found
        j += 1
        current_line = f[j]
        if occursin(instruction,current_line[1:3]);
            index = j;
            found = true;
        end
    end
    return index
end


# Part 2

function number_of_steps_AtoZ()
    f = readlines(filename)
    instructions = f[1];
    current_index = 1;
    (start_index,start_commands) = find_all_start_index();


    current_commands = start_commands; 
    current_indices = start_index; 

    reference_list = create_reference_dictionary();
    (left_list,right_list) = create_instruction_dictionary();
    periods = [0 0 0 0 0 0];
    count_list = [0 0 0 0 0 0];
    for i in eachindex(current_commands)
        found = false;
        found_period = false;
        count = 0;
        period_count = 0;
        
        while !found_period & (count < 100000)
            count += 1;
            period_count += 1;
            current_command  = current_commands[i];
            if count > length(instructions)
                instructions = instructions*instructions;
            end
            current_index = findall(x-> occursin(current_command,x),reference_list)[1]+2;

            current_line = f[current_index]
            if instructions[count] == 'L'
                current_command = current_line[8:10]
            elseif instructions[count] == 'R'
                current_command = current_line[13:15]
            end
            if (current_command[3] == 'Z')
                if found 
                    found_period = true;
                    periods[i] = period_count;
                else
                    period_count = 0;
                    count_list[i] = count;
                end
                found = true;
                println(count)
            end

            current_commands[i] = current_command;
        end


    end
    println(count_list)
    println(periods)
    return count_list
end

function create_reference_dictionary()
    f = readlines(filename)
    instruction_list = [];
    count = 1;
    for i = 3:length(f);
        current_line = f[i];
        push!(instruction_list,current_line[1:3]);
        count = count+1;
    end
    return instruction_list
end

function create_instruction_dictionary()
    f = readlines(filename)
    left_list = [];
    right_list = [];
    count = 1;
    for i = 3:length(f);
        current_line = f[i];
        push!(left_list,current_line[8:10]);
        push!(right_list,current_line[13:15]);
        count = count+1;
    end
    return left_list,right_list
end


function find_all_start_index()
    f = readlines(filename)
    found = false
    index = 0;
    start_index = [];
    start_commands = [];
    for i = 3:length(f)
        current_line = f[i]
        if 'A' == current_line[3]
            push!(start_index,i);
            push!(start_commands,current_line[1:3])
        end
    end
    return start_index, start_commands
end


function find_all_end_index()
    f = readlines(filename)
    found = false
    index = 0;
    end_index = [];
    end_commands = [];
    for i = 3:length(f)
        current_line = f[i]
        if 'Z' == current_line[3]
            push!(end_index,i);
            push!(end_commands,current_line[1:3])
        end
    end
    return end_index, end_commands
end
