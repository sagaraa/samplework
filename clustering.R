#collaborative Filtering
#content Filtering
# Hierarchial 
# K-means 
movie = read.table("movielens.txt", header = FALSE, sep = "|", quote = "\"")
str(movie)
colnames(movie) = c("ID", "Title","Releasedate", "VideoReleaseDate","IMDB", "Unknown","Action","Adventure","Animation","Children","Comedy","Crime","Documentry","Drama","Fantasy","FilmNoir","Horror","Musical","Mystery","Romance","SciFi","Thriller","War","Western")
movie$ID = NULL
movie$Releasedate = NULL
movie$VideoReleaseDate = NULL
movie$IMDB = NULL
movie = unique(movie)
distance = dist(movie[2:20], method = "euclidean")
moviecluster = hclust(distance, method = "ward")
plot(moviecluster)
clusterGroup = cutree(moviecluster, k = 10)
tapply(movie$Action, clusterGroup,mean)
tapply(movie$Romance, clusterGroup,mean)
subset(movie, Title == "Men in Black (1997)")
clusterGroup[257]
cluster2 = subset(movie, clusterGroup == 2)
cluster2$Title[1:10]

#action = tapply(movie$Action, clusterGroup,mean)
#romance = tapply(movie$Romance, clusterGroup,mean)
#c = rbind(action,romance)

#require(reshape2)
#b$id <- rownames(b) 
#melt(b)
# b = subset(movie, clusterGroup == 1)
# write.csv(b,"b.csv")