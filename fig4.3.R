png("ec_comp.png", width=10, height=8, units="in", res=400)

par(cex=1.5)
par(mar=c(8,5,5,1))
a1<-read.delim("an.wgd.pairs.ec",header=F)
a2<-read.delim("rel_gamma.pairs.ec",header=F)
a3<-read.delim("transp.pairs.ec",header=F)
b1<-1-a1[,5]
b2<-1-a2[,5]
b3<-1-a3[,5]
boxplot(b1,b2,b3, ylab="Expression divergence",outline=FALSE,cex.lab=1.5)
grid(NA,ny=NULL)
text(seq(1:3)*0.9-0.02,-0.4, cex=1.8, par("usr")[1], labels=c(expression(gamma),expression(paste("Relocated ",gamma)),"Transposed"), srt=45, pos=1, xpd=TRUE)
#text(1.4,0.8,expression(paste(italic(P),"=",1.81%*%10^-44)),cex=1.2)
dev.off() 