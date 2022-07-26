getwd()
setwd("C:/Users/ag030/OneDrive/Documents")
h=read.csv("HospitalCosts.csv")
head(h)
summary(h)
hist(h$AGE,main="Histogram of age & their visit",xlab="Age group",border="black",col=c("light blue","navy blue"),xlim=c(0,20),ylim=c(0,350)) 
summary(as.factor(h$AGE))
ex.age=aggregate(TOTCHG~AGE,FUN=sum,data=h) 
which.max(tapply(ex.age$TOTCHG,ex.age$TOTCHG,FUN=sum)) 
barplot(tapply(ex.age$TOTCHG,ex.age$AGE,FUN=sum)) 
hist(h$APRDRG,main="Histogram of diagnosis related group",xlab="APRDRG",border="black",col=c("light blue","navy blue"),xlim=c(0,1000),ylim=c(0,300)) 
summary(as.factor(h$APRDRG)) 
diag.cost=aggregate(TOTCHG~APRDRG,FUN=sum,data=h)
diag.cost[which.max(diag.cost$TOTCHG),]
summary(as.factor(h$RACE))
h=na.omit(h) 
summary(as.factor(h$RACE)) 
reg1=lm(TOTCHG~RACE,data=h) 
summary(reg1) 
anova1=aov(TOTCHG~RACE,data=h) 
summary(anova1) 
summary(as.factor(h$AGE))
summary(as.factor(h$FEMALE))
reg2=lm(TOTCHG~AGE+FEMALE,data=h)
summary(reg2)
reg3=lm(LOS~AGE+FEMALE+RACE,data=h) 
summary(reg3) 
model=lm(TOTCHG~.,data=h) 
summary(model) 
hcm=lm(TOTCHG~AGE+FEMALE+LOS+APRDRG,data=h)
summary(hcm)
hcm1=lm(TOTCHG~AGE+LOS+APRDRG,data=h)
summary(hcm1)
hcm2=lm(TOTCHG~AGE+LOS,data=h) 
summary(hcm2)




