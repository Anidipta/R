df<- read_excel("UtilitiesLab.xlsx")
df
dendo<-function(linkage){
  plot(as.dendrogram((agnes(df,stand=TRUE,diss=FALSE,method=linkage))))
}
dendo("single")
dendo("complete")
dendo("average")
