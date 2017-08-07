png("ka_comp.png", width=10, height=8, units="in", res=400)

par(cex=1.5)
par(mar=c(8,5,5,1))
a1<-read.delim("an.wgd.pairs.kaks",header=F)
a2<-read.delim("rel_gamma.pairs.kaks",header=F)
a3<-read.delim("transp.pairs.kaks",header=F)
b1<-a1[which(a1[,3]>0),3]
b2<-a2[which(a2[,3]>0),3]
b3<-a3[which(a3[,3]>0),3]
boxplot(b1,b2,b3, ylab="Ka",outline=FALSE,cex.lab=1.5)
grid(NA)
text(seq(1:3)-0.1,-0.4, cex=1.8, par("usr")[1], labels=c(expression(gamma),expression(paste("Relocated ",gamma)),"Transposed"), srt=45, pos=1, xpd=TRUE)
text(1.4,1.5,expression(paste(italic(P),"=",3.16%*%10^-34)),cex=1.2)
dev.off() 