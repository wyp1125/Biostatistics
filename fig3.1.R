png("paper1/heat_g2.png", width=8, height=8, units="in", res=400)
# gplots contains the heatmap.2 function
library(gplots)
 
# create 50x10 matrix of random values from [-1, +1]
a<-read.delim("paper1/select_go.num",header=F) 
b=as.matrix(a[,3:9])
 rownames(b)=a[,2]
colnames(b)=c("Alpha WGD","Beta WGD","Gamma WGD","Tandem","Proximal","Transposed","Relocated gamma")
# following code limits the lowest and highest color to 5%, and 95% of your range, respectively
quantile.range <- quantile(random.matrix, probs = seq(0, 1, 0.01))
palette.breaks <- seq(quantile.range["5%"], quantile.range["95%"], 0.1)
 
# use http://colorbrewer2.org/ to find optimal divergent color palette (or set own)
color.palette  <- colorRampPalette(c("#91CF60", "#FFFFBF", "#FC8D59"))(length(palette.breaks) - 1)
 dist.pear <- function(b) as.dist(1-cor(t(b)))
hclust.ave <- function(b) hclust(b, method="average")
heatmap.2(
     b, distfun=dist.pear, hclustfun=hclust.ave,
trace="none",
cexCol=1.2,cexRow=0.99,
#lhei=c(1,9),lwid=c(2,9),
lhei=c(1,5),lwid=c(1,5),
density.info="none",
margins = c(10,20),
    col    = color.palette,
    breaks = palette.breaks
)
dev.off() 

