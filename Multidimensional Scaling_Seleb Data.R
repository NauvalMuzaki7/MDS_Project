#((INPUT DATA))
data1<-read.csv(file.choose(),header=TRUE,sep=",",dec=".")
head(data1)
seleb<-data1[1:10,2]
data<-data1[1:10,4:8]
rownames(data)=seleb
head(data)

#METRIK
standardisasi = scale(data)
d <- dist(standardisasi) # jarak euclidean antar baris
d

#MEMBUAT PLOT
fit <- cmdscale(d,eig=TRUE, k=2) # dalam 2 dimensi
fit
x <- fit$points[,1]
y <- fit$points[,2]
plot(x, y, xlab="x", ylab="y",
     main="Classical MDS", type="n")
abline(v=0)
abline(h=0)
#Tidak Mencantumkan Nama Provinsi
text(x, y, cex=.7)
#Mencantumkan Nama Provinsi
text(x, y, labels = row.names(data), cex=.7)