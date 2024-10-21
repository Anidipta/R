dbscan_cl<- dbscan(df[2:ncol(df)],minPts = 3, eps=0.45)
pairs(df[2:ncol(df)], col=dbscan_cl$cluster + 1L) 
