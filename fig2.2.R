png("retention2.png", width=10, height=8, units="in", res=400)

par(cex=1.7)

a<-read.table("retention2.txt",header=F)
barplot(a[,3], main=expression(italic("Lotus japonicus")), ylab="Retention rate for dispersed duplicates (per Mys)")
text(seq(1:8)*1.22-1.4,-7, par("usr")[1], labels=c("After Lj-Mt","Lj-Mt ~ Lj-Gm", "Lj-Gm ~ Lj-Md","Lj-Md ~ Lj-Pt","Lj-Pt ~ Lj-At","Lj-At ~ Lj-Vv","Lj-Vv ~ Lj-St","Lj-St ~ Lj-Os"), srt=45, pos=1, xpd=TRUE)
dev.off()
