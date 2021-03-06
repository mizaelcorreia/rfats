#Chapter - 8

library(PerformanceAnalytics)
data(edhec)  
head(edhec)
data = edhec["1999", 3:5]
head(data)

colnames(data) = c("DS","EM","EMN")
data

library(xts)
wts = xts(matrix(c(.3,.3,.4),nrow=1,ncol=3), as.Date("1998-12-31"))
colnames(wts) = colnames(data)
wts

Return.portfolio(data,weights =wts, rebalance_on="months",verbose=TRUE)

##Grid Testing
library(randomForest)
library(mlbench)
library(caret)
data(Shuttle)
Analysis_Data = head(Shuttle,10000)
X = Analysis_Data[,1:9]
Y = Analysis_Data[,10]
head(X)
head(Y)
control = trainControl(method="repeatedcv", number=5, repeats=3)
seed = 4
metric = "Accuracy"
set.seed(seed)
Count_var = sqrt(ncol(X))
(tunegrid = expand.grid(.mtry=Count_var))

rf_baseline <- train(Class~., data=Analysis_Data, method="rf", metric=metric, tuneGrid=tunegrid, trControl=control)

print(rf_baseline)

control = trainControl(method="repeatedcv", number=5, repeats=3, search="grid")

set.seed(seed)
tunegrid = expand.grid(.mtry=c(1:8))

rf_gridsearch_method = train(Class~., data=Analysis_Data, method="rf", metric=metric, tuneGrid=tunegrid, trControl=control)

print(rf_gridsearch_method)

##GA
#install.packages("genalg")
library(genalg) 
library(ggplot2)
InputDataset = data.frame(Stocks = c("Stock1", "Stock2", "Stock3", "Stock4", "Stock5", "Stock6"), returns = c(10, 11, 15, 20, 12, 13), weight = c(.1, .2, .1, .2, .2, .3))
WTlimit = 1
InputDataset
evaluationFunc = function(x) {
  current_solution_returns = x %*% InputDataset$returns
  current_solution_weight = x %*% InputDataset$weight
  
  if (current_solution_weight > WTlimit) 
    return(0) else return(-current_solution_returns)
}
GAmodel = rbga.bin(size = 6, popSize = 100, iters = 50, mutationChance = 0.01, elitism = T, evalFunc = evaluationFunc)
cat(summary(GAmodel))

library(GA)
data(economics)
Data_Analysis = data.frame(economics[,2:4])
head(Data_Analysis)

OLS_GA = function(Data_Analysis, a0, a1, a2){
  attach(Data_Analysis, warn.conflicts=F)
  Y_hat = a0  + a1*pop + a2*psavert  
  SSE = t(pce-Y_hat) %*% (pce-Y_hat) 
  detach(Data_Analysis)
  return(SSE)
}

ga.OLS_GA = ga(type='real-valued', min=c(-100,-100,-100),  max=c(100, 100, 100), popSize=500, maxiter=500, names=c('intercept', 'pop', 'psavert'), keepBest=T, fitness = function(a) -OLS_GA(Data_Analysis, a[1],a[2], a[3]))
summary(ga.OLS_GA)
