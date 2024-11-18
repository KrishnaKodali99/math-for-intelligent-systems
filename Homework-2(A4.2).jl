using VMLS
using LinearAlgebra

const k = 5

# Question-(a)
articles, dictionary, titles = wikipedia_data();
assignment, reps = kmeans(articles, k)

n = length(articles)

# Question-(b)
distance = zeros(n)
for i in 1:n
    representative = reps[assignment[i]]
    distance[i] = norm(articles[i] - representative)
end

# Question-(c, d, e)
println("")
for ci in 1:k
    clusterArticles = zeros(length(reps[ci]))
    for i in 1:n
        if (assignment[i] == ci)
            clusterArticles += articles[i]
        end
    end

    top5WordsIndices = sortperm(clusterArticles, rev=true)[1:5]
    println("Top 5 words in cluster-$ci: ", dictionary[top5WordsIndices])

    articlesDistanceFromRep = zeros(n)
    for i in 1:n
        articlesDistanceFromRep[i] = norm(reps[ci] - articles[i])
    end

    top5AritclesIndices = sortperm(articlesDistanceFromRep)[1:5]
    println("First 5 Articles closer to representative-$ci: ", titles[top5AritclesIndices], "\n")
end
