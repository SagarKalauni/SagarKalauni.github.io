##QN-a#######################
set.seed(123321)
library(ISLR2)
Boston
mean50=vector(length=5000)
for(i in 1:5000){
  samp = sample(Boston$medv, size = 50)
  mean50[i] = mean(samp)
}
mean50
mu_hat=mean(mean50)
mu_hat
# my output is 22.52386
mean(Boston$medv)
# Actual value was 22.53281

###QN-b########################################################

#Estimation for the standard deviation
est_stand_error= sd(Boston$medv)/sqrt(50)
est_stand_error

###QN--c######################################################

boot_mean50=vector(length=5000)
for(i in 1:5000){
  samp = sample(Boston$medv, size = 50, replace = TRUE)
  boot_mean50[i] = mean(samp)
}
boot_mean50
boot_mu_hat=mean(boot_mean50)
boot_mu_hat

# my boot sample is 22.53439
# They both are close together


t.test(Boston$medv)


quantile <- qnorm(1-0.05/2)
upper_bound <- boot_mu_hat + quantile*sd(Boston$medv)/sqrt(50)
lower_bound <- boot_mu_hat - quantile*sd(Boston$medv)/sqrt(50)
c(lower_bound, upper_bound)






