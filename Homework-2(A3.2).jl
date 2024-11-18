using LinearAlgebra

const a = [1; 3; 4]
const x1 = [4; 3; 5]
const x2 = [0.4; 10; 50]
const x3 = [1; 4; 10]
const x4 = [30; 40; 50]

function toDegrees(angle)
    return (angle * 180) / pi
end

function computeMinDistance()
    distance1 = norm(x1 - a, 2)
    distance2 = norm(x2 - a, 2)
    distance3 = norm(x3 - a, 2)
    distance4 = norm(x4 - a, 2)

    println("Distance of a to x1: ", distance1)
    println("Distance of a to x2: ", distance2)
    println("Distance of a to x3: ", distance3)
    println("Distance of a to x4: ", distance4)

    return min(distance1, distance2, distance3, distance4)
end

function computeMinAngle()
    normA = norm(a, 2)

    angle1 = acos(x1'a / (norm(x1, 2) * normA))
    angle2 = acos(x2'a / (norm(x2, 2) * normA))
    angle3 = acos(x3'a / (norm(x3, 2) * normA))
    angle4 = acos(x4'a / (norm(x4, 2) * normA))

    println("Angle of a with x1: ", "Radians: ", angle1, " | Degrees: ", toDegrees(angle1))
    println("Angle of a with x2: ", "Radians: ", angle2, " | Degrees: ", toDegrees(angle2))
    println("Angle of a with x3: ", "Radians: ", angle3, " | Degrees: ", toDegrees(angle3))
    println("Angle of a with x4: ", "Radians: ", angle4, " | Degrees: ", toDegrees(angle4))

    return min(angle1, angle2, angle3, angle4)
end

println("MinimumDistance: ", computeMinDistance(), "\n")
println("MinimumAngle: ", computeMinAngle())
