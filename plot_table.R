con = gzcon(url('http://www.systematicportfolio.com/sit.gz', 'rb'))
source(con)
close(con)
m<-array(dim=c(5,5))
colnames(m)=c("0*1-0*0","1*1-0*0","0*1-1*0","1*1-1*0","1*1-0*1")
rownames(m)=c("1*0-0*0","0*1-0*0","1*1-0*0","0*1-1*0","1*1-1*0")
z=read.csv("anova.rma.de.genes.details.csv")
x=z[which(z["ANOVA.q.value"]<0.05),]
n=length(x[,1])
for(i in 1:5)
{
for(j in (i+1):6)
{
m[i,(j-1)]=length(which(x[,6+i]<=0.05 & x[,6+j]<=0.05))
}
}
png("fig5.png",width=8,height=3,units="in",res=300)
plot.table(m,colorbar = TRUE,smain="# of overlaps",highlight=TRUE)
dev.off()