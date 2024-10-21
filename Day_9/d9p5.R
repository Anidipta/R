kmeans_custom <- function(data, k) {
  set.seed(1)
  centers <- data[sample(1:nrow(data), k),]
  repeat {
    clusters <- apply(data, 1, function(x) {
      which.min(colSums((t(centers) - x)^2))
    })
    new_centers <- t(sapply(1:k, function(i) {
      colMeans(data[clusters == i, , drop=FALSE])
    }))
    if (all(centers == new_centers, na.rm=TRUE)) break
    centers <- new_centers
  }
  list(clusters=clusters, centers=centers)
}

kmeans_res <- kmeans_custom(df[2:ncol(df)], k=3)
print(kmeans_res)


#$clusters
#[1] 1 2 3 1 2 3 1 2 1 2 1 1 2 3 1 2 3 1 3 1 2 1

#$centers
#Fixed_charge      RoR  Cost Demand_growth Fuel_Cost
#[1,]     1.080000 10.53000 164.9      3.350000  1.102300
#[2,]     1.135714 10.27143 213.0      4.042857  1.113429
#[3,]     1.152000 11.80000 112.0      1.900000  1.088600