healthy = read.csv("healthy.csv", header = FALSE)
healthyMatrix = as.matrix(healthy)
healthyVector = as.vector(healthyMatrix)
image(healthyMatrix, axes = FALSE, col = grey(seq(0,1,length = 256)))
#distance = dist(healthyVector, method = "euclidean")  to check hierarchial working or not
k = 5
set.seed(1)
KMC = kmeans(healthyVector, centers = k, iter.max = 1000)
str(KMC)
healthyClusters = KMC$cluster
KMC$centers[2]
dim(healthyClusters) = c(nrow(healthyMatrix),ncol(healthyMatrix))
image(healthyClusters, axes = FALSE, col = rainbow(k))
## now work on tumour file

tumor = read.csv("tumor.csv", header = FALSE)
tumorMatrix = as.matrix(tumor)
tumorVector = as.vector(tumorMatrix)
#distance = dist(tumorVector,method = "euclidean")
#k = 5
#set.seed(1)
#KMCtumor = kmeans(tumorVector, centers = k, iter.max = 1000)
#str(KMCtumor)
#tumorCluster = KMCtumor$cluster
#dim(tumorCluster) = c(nrow(tumorMatrix), ncol(tumorMatrix))
#image(tumorCluster,axes = FALSE, col = rainbow(k))

install.packages("flexclust")
library(flexclust)
KMC.kcca = as.kcca(KMC, healthyVector)
tumorCluster = predict(KMC.kcca, newdata = tumorVector)
dim(tumorCluster) = c(nrow(tumorMatrix), ncol(tumorMatrix))
image(tumorCluster, axes = FALSE, col = rainbow(k))
