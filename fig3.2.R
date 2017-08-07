

png("g_hist.png", width=8, height=8, units="in", res=400)

library(gplots)


par(family="serif")
par(cex=1.7)
#a<-read.table("select_go.num",header=F) 
a<-read.delim("select_go.num",header=F) 
b=t(as.matrix(a[,3:9]))
a=c()
a[1]=cor(b[7,],b[1,])
a[2]=cor(b[7,],b[2,])
a[3]=cor(b[7,],b[3,])
a[4]=cor(b[7,],b[4,])
a[5]=cor(b[7,],b[5,])
a[6]=cor(b[7,],b[6,])
#index(a)=c(expression(paste(alpha," WGD")),expression(paste(beta," WGD")),expression(paste(gamma," WGD")),"Tandem","Proximal","Transposed")
barplot(a,ylim=range(-0.6,0.4),ylab="Pearson's correlation coefficient",col="blue")
abline(h=0)
box()
axis(1,at=seq(1:5)*1.22, labels = FALSE)
text(seq(1:6)*1.22-1,-0.7, par("usr")[1], labels=c(expression(paste(alpha," WGD")),expression(paste(beta," WGD")),expression(paste(gamma," WGD")),"Tandem","Proximal","Transposed"), srt=45, pos=1, xpd=TRUE)

dev.off()