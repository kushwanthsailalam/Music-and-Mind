# Load the data
data <- read.csv("/Users/kushwanthsailalam/data_without_cluster.csv")

# Compute the cosine similarity
m <- as.matrix(scale(t(data)))
cos_dist <- 1 - crossprod(m) / (sqrt(colSums(m^2)) %*% t(sqrt(colSums(m^2))))

# Convert the cosine similarity to a distance matrix
cos_dist <- as.dist(cos_dist)

# Hierarchical clustering using Ward's method
hclust_w <- hclust(cos_dist, method = "ward.D")

# Plot the dendrogram
plot(hclust_w, cex = 0.7, hang = -1, main = "Cosine Similarity Dendrogram")


