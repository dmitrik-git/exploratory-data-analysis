# Clustering
dist(dataFrame)
hc <- hclust (dist(dataFrame))
plot(hc)
plot (as.dendrogram(hc))
abline(h=0.05, col="green")

# Heatmaps
http://sebastianraschka.com/Articles/heatmaps_in_r.html#clustering

heatmap(dataMatrix, col = cm.colors(25))

# K-means

As we said, k-means is a partioning approach which requires that you first
guess how many clusters you have (or want). Once you fix this number, you
randomly create a "centroid" (a phantom point) for each cluster and assign
each point or observation in your dataset to the centroid to which it is
closest. Once each point is assigned a centroid, you readjust the centroid's
position by making it the average of the points assigned to it.

Once you have repositioned the centroids, you must recalculate the distance
of the observations to the centroids and reassign any, if necessary, to the
centroid closest to them. Again, once the reassignments are done, readjust
the positions of the centroids based on the new cluster membership. The
process stops once you reach an iteration in which no adjustments are made or
when you've reached some predetermined maximum number of iterations.

So k-means clustering requires some distance metric (say Euclidean), a
hypothesized fixed number of clusters, and an initial guess as to cluster
centroids.

kmeans(dataFrame, 3)

Now we'll talk a little about PCA, Principal Component Analysis, "a simple,
non-parametric method for extracting relevant information from confusing data
sets." We're quoting here from a very nice concise paper on this subject
which can be found at http://arxiv.org/pdf/1404.1100.pdf. The paper by
Jonathon Shlens of Google Research is called, A Tutorial on Principal
Component Analysis.
