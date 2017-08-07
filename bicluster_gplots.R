a<-read.csv("multi_variable.csv")
id_r<-!is.na(a[,2])
id_c<-!is.na(a[1,])
d=a[id_r,id_c]
cid=d[,1]
sid=d[,1]
m=length(cid)
for(i in 1:m)
{
if(d[i,1]<10)
{
cid[i]=paste("WH0",d[i,1],".CEL",sep="")
sid[i]=paste("WH0",d[i,1],sep="")
}
else
{
cid[i]=paste("WH",d[i,1],".CEL",sep="")
sid[i]=paste("WH",d[i,1],sep="")
}
}

raw_pheno=data.frame(cid,d)
e0<-read.delim("cmb.rma.3.gene.exp",header=T)
pheno_all=raw_pheno[match(colnames(e0)[-(1:2)],raw_pheno$cid),]
pheno1=pheno_all$Weight
pheno2=pheno_all$newRestrained
e=as.matrix(e0[,-(1:2)])
z=read.csv("anova.rma.de.genes.details.csv")
x=z[which(z["ANOVA.q.value"]<0.05),]
n=length(x[,1])

de=e[x[,1],]
for(i in 1:n)
{
ttt=de[i,]
de[i,]=(ttt-mean(ttt))/sd(ttt)
}

s_00=which(pheno1==0 & pheno2==0)
s_01=which(pheno1==0 & pheno2==1)
s_10=which(pheno1==1 & pheno2==0)
s_11=which(pheno1==1 & pheno2==1)
de_00=de[,s_00]
dd_00=dist(t(de_00))
dc_00=hclust(dd_00)
do_00=colnames(de_00)[dc_00$order]
de_10=de[,s_10]
dd_10=dist(t(de_10))
dc_10=hclust(dd_10)
do_10=colnames(de_10)[dc_10$order]
de_01=de[,s_01]
dd_01=dist(t(de_01))
dc_01=hclust(dd_01)
do_01=colnames(de_01)[dc_01$order]
de_11=de[,s_11]
dd_11=dist(t(de_11))
dc_11=hclust(dd_11)
do_11=colnames(de_11)[dc_11$order]

o_col=c(do_00,do_10,do_01,do_11)
o_de=de[,match(o_col,colnames(de))]

colnames(o_de)=sid[match(colnames(o_de),cid)]

dd_wh=dist(o_de)
dc_wh=hclust(dd_wh)
do_wh=dc_wh$order
tree=as.dendrogram(dc_wh)
library("gplots")
png("cluster.png",width=8,height=8,units="in",res=300)

heatmap.2(o_de, dendrogram="none",Rowv=tree, Colv=FALSE,density.info='none',labRow=FALSE,
lmat=rbind(c(0,4), c(2,1),c(0,3)),lhei = c(1,5,0.1),lwid = c(0.5,5), key.title=NA,key.xlab="Normalized expression (Z-score)",
key.par=list(mgp=c(1.5, 0.5, 0),mar=c(4.5,4,1.5,8)),sepwidth=0.001,
trace="none",col=redgreen(75),colsep=c(length(s_00),(length(s_00)+length(s_10)),(length(s_00)+length(s_10)+length(s_01))))

dev.off()



