a<-read.csv("multi_variable.csv")
id_r<-!is.na(a[,2])
id_c<-!is.na(a[1,])
d=a[id_r,id_c]
cid=d[,1]
m=length(cid)
for(i in 1:m)
{
if(d[i,1]<10)
{
cid[i]=paste("WH0",d[i,1],".CEL",sep="")
}
else
{
cid[i]=paste("WH",d[i,1],".CEL",sep="")
}
}
raw_pheno=data.frame(cid,d)
e0<-read.delim("cmb.rma.3.gene.exp",header=T)
pheno_all=raw_pheno[match(colnames(e0)[-(1:2)],raw_pheno$cid),]
pheno1=pheno_all$Weight
pheno2=pheno_all$newRestrained
e=as.matrix(e0[,-(1:2)])
n=length(e[,1])
r=array(dim=c(n,9))
for(i in 1:n)
{
print(i)
v=aov(e[i,]~as.factor(pheno1)*as.factor(pheno2))
s=summary(v)
r[i,1]=s[[1]][["Pr(>F)"]][3]
t=TukeyHSD(v)
r[i,2]=t[[1]][4]
r[i,3]=t[[2]][4]
x=data.frame(t[[3]])
r[i,4:9]=x["p.adj"][,1]
}
library("qvalue")
q=qvalue(r[,1])
z=data.frame(paste(" ",e0[,1],sep=""),e0[,2],r,q$qvalue)
colnames(z)=c("Gene","Probeset","ANOVA P","Weight only","Restrained only","1*0-0*0","0*1-0*0","1*1-0*0","0*1-1*0","1*1-1*0","1*1-0*1","ANOVA q-value")
write.csv(z[order(z[,12]),],file="anova.rma.de.genes.details.csv")
q2=qvalue(r[,2])
q3=qvalue(r[,3])
png("fig1.png",width=8,height=3,units="in",res=300)
par(mfrow=c(1,3))
hist(q2$pvalue,freq=FALSE,xlab="P-value",breaks=20,main="Weight status",yaxs="i",ylim=range(0,5))
box()
mtext("A",side=3,line=1.2,adj=-0.3,cex=1.6)
hist(q3$pvalue,freq=FALSE,xlab="P-value",breaks=20,main="Eating behavior",yaxs="i",ylim=range(0,5))
box()
mtext("B",side=3,line=1.2,adj=-0.3,cex=1.6)
hist(q$pvalue,freq=FALSE,xlab="P-value",breaks=20,main="Eating behavior*Weight status",yaxs="i",ylim=range(0,5))
box()
mtext("C",side=3,line=1.2,adj=-0.3,cex=1.6)
dev.off()
length(which(z[,12]<0.05 & z[,6]<0.05))
length(which(z[,12]<0.05 & z[,7]<0.05))
length(which(z[,12]<0.05 & z[,8]<0.05))
length(which(z[,12]<0.05 & z[,9]<0.05))
length(which(z[,12]<0.05 & z[,10]<0.05))
length(which(z[,12]<0.05 & z[,11]<0.05))
