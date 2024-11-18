assignment = randn(500)
assignment[400] = 1

global cluster1Articles = zeros(500)

for i in 1:500
    if(assignment[i] == 1)
        global cluster1Articles += [i]
    end
end