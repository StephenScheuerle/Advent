const filename = pwd()*"\\2023\\InputFiles\\Day04.txt"


function PointsWon(your_numbers, winning_numbers)
    points = 0;
    for i = 1:length(your_numbers)
        if any(your_numbers[i] .== winning_numbers)
            if points == 0
                points = 1;
            else
                points = points * 2;
            end
        end
    end
    return points
end



function Total_Points()
    f = readlines(filename)
    total_points = 0;
    for i = 1:length(f)
        current_line = split(f[i],":")[2];
        (your_numbers, winning_numbers) = split(current_line,"|");
        your_numbers = [parse(Int, ss) for ss in split(your_numbers)];
        winning_numbers = [parse(Int, ss) for ss in split(winning_numbers)];
        points = PointsWon(your_numbers,winning_numbers);
        total_points += points;
    end
    println(total_points)

end


# Part 2

function Copies_Won(your_numbers, winning_numbers)
    Copies = 0;
    for i = 1:length(your_numbers)
        if any(your_numbers[i] .== winning_numbers)
            Copies += 1
        end
    end
    return Copies
end



function Total_Points_Updated()
    f = readlines(filename)
    Copies = ones(1,length(f))
    Copies[1] = 1;
    for i = 1:length(f)
        current_line = split(f[i],":")[2];
        (your_numbers, winning_numbers) = split(current_line,"|");
        your_numbers = [parse(Int, ss) for ss in split(your_numbers)];
        winning_numbers = [parse(Int, ss) for ss in split(winning_numbers)];
        points = Copies_Won(your_numbers,winning_numbers);
        println(points)
        for j = 1:points
            Copies[i+j] += Copies[i]
        end

    end
    #println(Copies)
    println(sum(Copies))

end



