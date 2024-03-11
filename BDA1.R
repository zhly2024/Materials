model <- function() { 
  # Prior 
  p ~ dbeta(1, 1) 
  
  # Likelihood 
  y ~ dbin(p, N) 
}
library(R2OpenBUGS) 
model.file <- file.path(tempdir(), "model.txt") 
write.model(model, model.file)
library(MASS)
tbl <- table(survey$Smoke)
N <- as.numeric(sum(tbl))
N
y <- N - as.numeric(tbl["Never"])
y
params <- c("p")
inits <- function() { list(p=0.5) }
out <- bugs(data, inits, params, model.file, n.iter=10000)
out
out$mean$p
out$mean$deviance
print(out, digits=5)

library(mcmcplots)
mcmcplot(out,parms = params)


out <- bugs(data, inits, params, model.file, codaPkg=TRUE, n.iter=10000) 
out.coda <- read.bugs(out)
library(coda) 
library(lattice)
xyplot(out.coda)
densityplot(out.coda)
acfplot(out.coda)
gelman.diag(out.coda)
gelman.plot(out.coda)
out.summary <- summary(out.coda, q=c(0.025, 0.975))
out.summary
out.summary$quantiles

