### simulated data ###################
x = matrix(rnorm(40), 20, 2)
y = rep(c(-1, 1), c(10, 10))
x[y == 1,] = x[y == 1,] + 2
plot(x, col = y + 3, pch = 19)
dat = data.frame(x, y = as.factor(y))


library(e1071)
svmfit = svm(y ~ ., data = dat, kernel = "linear", cost = 10, scale = FALSE)
#scale=FALSE tells the svm() function not to scale each feature to have mean zero or standard deviation one 
plot(svmfit, dat)
svmfit$index

# perform cross-validation
tune.out=tune(svm,y~.,data=dat,kernel="linear",ranges=list(cost=c(0.001, 0.01, 0.1, 1,5,10,100)))
summary(tune.out) 
summary(tune.out$best.model)

# prediction on test data
x = matrix(rnorm(40), 20, 2)
y = rep(c(-1, 1), c(10, 10))
x[y == 1,] = x[y == 1,] + 1
testdat = data.frame(x, y = as.factor(y))
best.mod=svm(y ~ ., data = dat, kernel = "linear", cost = 5, scale = FALSE)
ypred=predict(best.mod ,testdat)
table(predict=ypred, truth=testdat$y) 

### Better plot ########################

make.grid = function(x, n = 75) {
	grange = apply(x, 2, range)
	x1 = seq(from = grange[1,1], to = grange[2,1], length = n)
	x2 = seq(from = grange[1,2], to = grange[2,2], length = n)
	expand.grid(X1 = x1, X2 = x2)
 }
xgrid = make.grid(dat[,1:2])
ygrid = predict(svmfit, xgrid)

plot(xgrid, col = c("red","blue")[as.numeric(ygrid)], pch = 20, cex = .2)
points(dat[,1:2], col = as.numeric(dat[,3]) + 1, pch = 19)
points(dat[svmfit$index,1:2], pch = 5, cex = 2)

### Add the margins
## you have to do some work to get back the linear coefficients
beta = t(svmfit$coefs)%*%as.matrix(dat[svmfit$index,1:2])
beta0 = svmfit$rho

abline(beta0 / beta[2], -beta[1] / beta[2])
abline((beta0 - 1) / beta[2], -beta[1] / beta[2], lty = 2)
abline((beta0 + 1) / beta[2], -beta[1] / beta[2], lty = 2)



######### Non-linear SVM ###############
#simulated data
x = matrix(rnorm(400), 200, 2)
y = rep(c(1, -1), c(150, 50))
x[1:100,] = x[1:100,] + 2
x[101:150,] = x[101:150,] - 2
dat = data.frame(x=x, y = as.factor(y))
plot(dat$x.2,dat$x.1, col = y + 3, pch = 19)

svmfit = svm(y ~ ., data = dat, kernel = "radial",gamma=1, cost = 10, scale = FALSE)
plot(svmfit, dat)
tune.out=tune(svm,y~.,data=dat,kernel="radial",ranges=list(cost=c(0.001, 0.01, 0.1, 1,5,10,100),gamma=c(0.5,1,2,3,4)))
summary(tune.out) 
summary(tune.out$best.model)


########## ROC curve #################
library(ROCR) 
rocplot=function(pred, truth){
predob = prediction (pred, truth)
perf = performance (predob,"tpr","fpr") 
plot(perf)} 
svmfit = svm(y ~ ., data = dat, kernel = "radial",gamma=0.5, cost = 5, decision.values=T)
fitted=attributes(predict(svmfit,dat,decision.values=T))$decision.values
rocplot(fitted,dat[,"y"])


########## Gene Expression (multi-class) #################
library(ISLR2)
?Khan
dat=data.frame(x=Khan$xtrain , y=as.factor(Khan$ytrain )) 
svm.l = svm(y~., data = dat, kernel = "linear", cost = 1)
#svm() function will perform multi-class classification using the one-versus-one approach by default. 
				
summary(svm.l)
table(svm.l$fitted,dat$y) #training errors 

pred=predict(svm.l, newdata=Khan$xtest)
table(pred,Khan$ytest) #testing errors

 
########## Iris Data (multi-class) ###############
train=sample(1:150,120)
iris.train=iris[train,]
iris.test=iris[-train,]
plot(iris.train[,1:2], col=c("red","green","blue")[unclass(iris.train$Species)], pch = 19)
plot(iris.train[,3:4], col=c("red","green","blue")[unclass(iris.train$Species)], pch = 19)

svm.l = svm(Species~., data =iris.train, kernel = "radial", gamma=0.5,cost = 5,scale =T)
summary(svm.l)
table(svm.l$fitted,iris.train$Species)
plot(svm.l, data=iris.train, Petal.Width ~ Petal.Length,slice = list(Sepal.Width = 3, Sepal.Length = 6))
pred=predict(svm.l,newdata=iris.test)
table(pred,iris.test$Species)

tune.out=tune(svm,Species~.,data=iris.train,kernel="radial",ranges=list(cost=c(0.001, 0.01, 0.1, 1,5,10,100),gamma=c(0.5,1,2,3,4)))


#######SVM regression
 
# Regression example
indexes = sample(1:506,350)
train = Boston[indexes, ]
test = Boston[-indexes, ]
 
model_reg = svm(medv~., data=train,kernel="radial", scale =T)
print(model_reg)
 
pred = predict(model_reg, test)
 
x=1:length(test$medv)
plot(x, test$medv, pch=18, col="red")
lines(x, pred, lwd="1", col="blue")
mse=mean((test$medv-pred)^2)
mse

