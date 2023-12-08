
function QuadraticEquation(a,b,c)
    root1 = (-b - sqrt(b^2 - 4*a*c))/(2*a)
    root2 = (-b + sqrt(b^2 - 4*a*c))/(2*a)
    return root1,root2
end

race1_roots = QuadraticEquation(1,-40,219);
race2_roots = QuadraticEquation(1,-81,1012);
race3_roots = QuadraticEquation(1,-77,1365);
race4_roots = QuadraticEquation(1,-72,1089);

game1_margin = 1 + floor(race1_roots[2])- ceil(race1_roots[1]);
game2_margin = 1 + floor(race2_roots[2])- ceil(race2_roots[1]);
game3_margin = 1 + floor(race3_roots[2])- ceil(race3_roots[1]);
game4_margin = 1 + floor(race4_roots[2])- ceil(race4_roots[1]);

total_product = game1_margin*game2_margin*game3_margin*game4_margin
println(total_product)

fullrace_roots = QuadraticEquation(1,-40817772,219101213651089);
fullrace_margin = 1 + floor(fullrace_roots[2])- ceil(fullrace_roots[1]);

