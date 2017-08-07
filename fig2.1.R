png("retention.png", width=10, height=8, units="in", res=400)

par(cex=1.7)

a<-read.table("retention.txt",header=F)
barplot(a[,3], main=expression(italic("Arabidopsis thaliana")), ylab="Retention rate for dispersed duplicates (per Mys)")
text(seq(1:8)*1.22-1.5,-25, par("usr")[1], labels=c("After At-Al","At-Al ~ At-Br", "At-Br ~ At-Cp","At-Cp ~ At-Tc","At-Tc ~ At-Pt","At-Pt ~ At-Vv","At-Vv ~ At-St","At-St ~ At-Os"), srt=45, pos=1, xpd=TRUE)
dev.off() 