A = ones(2000, 2000) + rand(2000, 2000)
b = ones(2000)
@time A\b;

L = ones(2000, 2000) + rand(2000, 2000)
for i = 1:2000
    for j = i+1:2000
        L[i, j] = 0
    end
end
b = ones(2000)
@time L \ b;
