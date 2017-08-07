png("Downloads/sl.png", width=8, height=8, units="in", res=400)

par(cex=1.7)
#par(cex.lab=2)
a<-read.delim("paper1/all_ks_dstn.txt",header=F)
i=which(a[,1]=="sl")
id="Solanum lycopersicum "
m=as.numeric(c(a[i[1],3:32],a[i[2],3:32],a[i[3],3:32]))
n=max(m)
x=seq(0,2.9,by=0.1)+0.05
plot(0,0,xlab="Ks",ylab="Frequency",xlim=range(0,3),ylim=range(0,n),main=italic(id),type="l",col="red")
cars.spl <- smooth.spline(x,a[i[1],3:32],df=20)
lines(cars.spl,col="red",,lwd=3)
cars.spl <- smooth.spline(x,a[i[2],3:32],df=20)
lines(cars.spl,col="green",lwd=3)
cars.spl <- smooth.spline(x,a[i[3],3:32],df=20)
lines(cars.spl,col="blue",lwd=3)
legend("topright",c("WGD/segmental","Local","Dispersed"),lty=c(1,1,1),lwd=c(3,3,3),col=c("red","green","blue"))

dev.off() 