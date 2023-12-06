const filename = pwd()*"\\2023\\InputFiles\\Day02.txt"

function possibleGames(red_limit, blue_limit, green_limit)
    f = readlines(filename)
    sum_of_IDs = 0;
    for i = 1:length(f)
        current_line = split(f[i],":")
        ID = parse(Int,filter(isdigit,current_line[1]))
        revealed_sets = current_line[2];
        revealed_sets = split(revealed_sets,';')
        possible = true
        for j in eachindex(revealed_sets)
            cubes_count = readSet(revealed_sets[j]);
            if possible
                possible = (red_limit >= cubes_count[1]) & (blue_limit >= cubes_count[2]) & (green_limit >= cubes_count[3]) 
            end
        end
        if possible
            sum_of_IDs += ID;
        end   
    end
    println(sum_of_IDs)
    
end

function readSet(pulled_bags)
    colors = ["red" "blue" "green"]
    cubes_count = [0 0 0]
    for i = 1:3
        is_color_present = occursin(colors[i],pulled_bags);
        if is_color_present
            start_index_value = findfirst(colors[i], pulled_bags)
            if ~isempty(start_index_value)
                cubes_count[i] = parse(Int,filter(isdigit,pulled_bags[start_index_value[1]-3:start_index_value[1]-2]))
            end
        end
    end
    #println(cubes_count)
    return cubes_count
end

# Problem 2

function poweroftheCUBES()
    f = readlines(filename)
    sum_of_sets = 0;
    for i = 1:length(f)
        current_line = split(f[i],":")
        revealed_sets = current_line[2];
        revealed_sets = split(revealed_sets,';')
        max_set = [0 0 0];
        cubes_count = [0 0 0];
        for k in eachindex(revealed_sets)
            cubes_count = readSet(revealed_sets[k]);
            for j = 1:3
                if max_set[j] < cubes_count[j]
                    max_set[j] = cubes_count[j];
                end
            end
        end
        sum_of_sets += max_set[1]*max_set[2]*max_set[3]
    end
    return sum_of_sets
end







