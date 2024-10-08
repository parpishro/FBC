# set hyperparameter priors by provide argument. All prior setting has reasonable default values

pr1   <- set_hyperPriors(muBDist = "normal", muBP1 = 0, muBP2 = 1)
cal1  <- calibrate(sim = analytic11S, field = analytic11F,
                   nMCMC = 5, nBurn = 0, thinning = 1,
                   hypers = pr1)
pr2   <- set_hyperPriors(alphaSDist = c("betashift", "betashift"),
                         alphaSP1 = c(1, 2),
                         alphaSP2 = c(2, 4))
cal2  <- calibrate(sim = analytic11S, field = analytic11F,
                   nMCMC = 5, nBurn = 0, thinning = 1,
                   hypers = pr2)
