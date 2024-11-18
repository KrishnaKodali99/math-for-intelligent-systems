function answer1(x)
	a = zeros(10)
	a[5] = 1
	return a'x
end

function answer2(x)
    a = [0.3; 0.4; 0.3]
    return a'x
end

function answer3(x)
    a = zeros(22)

    for i in 1:22
        if (i % 4 == 0) 
            a[i] = 1
        end
        if (i % 7 == 0)
            a[i] = -1
        end
    end
    
    return a'x
end

function answer4(x)
    a = [zeros(3); ones(5) / 5; zeros(3)]
    return a'x
end
