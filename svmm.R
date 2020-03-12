install.packages("e1071")
library(e1071)
svm()
machine <- svm(Species~.,data = iris)
qplot(iris$Sepal.Length,iris$Sepal.Width,col = iris$Species)
qplot(iris$Petal.Length,iris$Petal.Width,col = iris$Species)
machine
plot(machine,data = iris,Petal.Width~Petal.Length,slice = list(Sepal.Width = 3,Sepal.Length = 4))
pree <- predict(machine,iris)
tab <- table(predicted = pree,actual = iris$Species)
tab
sum(diag(tab))/sum(tab)
1-sum(diag(tab))/sum(tab)
machinel <- svm(Species~.,data = iris,kernel = "linear")
machinel
machinel <- svm(Species~.,data = iris,kernel = "sigmoid")
machinel
machinel <- svm(Species~.,data = iris,kernel = "polynomial")
plot(machinel,data = iris,Petal.Width~Petal.Length,slice = list(Sepal.Width = 3,Sepal.Length = 4))
set.seed(123)
trai <- tune(svm,Species~.,data = iris,ranges = list(epsilon  = seq(0,1,0.1),cost = 2^(2:9)))
trai
plot(trai)
machines <- trai$best.model
summary(machines)
pree <- predict(machines,iris)
tab <- table(predicted = pree,actual = iris$Species)
tab
sum(diag(tab))/sum(tab)
1-sum(diag(tab))/sum(tab)
plot(machines,data = iris,Petal.Width~Petal.Length,slice = list(Sepal.Width = 3,Sepal.Length = 4))
