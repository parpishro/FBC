% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/predict.fbc.R
\name{predict.fbc}
\alias{predict.fbc}
\title{Predict based on Calibrated Model}
\usage{
\method{predict}{fbc}(object, newdata, method = "Bayesian", ...)
}
\arguments{
\item{object}{class fbc (output of \code{calibrate()} function)}

\item{newdata}{matrix of new field input configuration (\eqn{\bf{X}_f^*}), where each
row represents a vector of field input configuration (\eqn{\bf{x}_f^*})
and columns represent experimental inputs}

\item{method}{character string from "MAP" or "Bayesian" (default) as method of prediction}

\item{...}{other arguments}
}
\value{
list containing two vectors:
- \code{pred} representing the estimate (\eqn{\bf{y}_f^*})
- \code{se} represents the uncertainty about estimates (\eqn{\bf{\sigma^2_y}})
}
\description{
It uses MCMC samples of calibration parameters and predicts the response for new input
configurations. For every vector of joint parameter draw, a prediction is made to get a
vector of prediction for each new input configuration (and a matrix of predictions for
all new input configurations). This vector represents the estimated distribution of
response conditioned on parameter samples. Full Bayesian framework of this package
enables also uncertainty quantification.
}
\examples{
# build a simple calibration model
cal1    <- calibrate(sim = analytic11S, field = analytic11F,
                     nMCMC = 5, nBurn = 0, thinning = 1,
                     kappaDist = "normalTr", kappaP1 = 0.5, kappaP2 = 0.25)
# predict the fitted values (Bayesian method)
preds <- predict(cal1, newdata = matrix(analytic11F[,2], ncol = 1))

# view the fitted value and their MCMC-based standard error
preds$pred
preds$se

# build a more complex calibration model and predict the fitted values
cal2   <- calibrate(sim = Ds2, field = Df2, nMCMC = 10, nBurn = 0, thinning = 1)
predsB <- predict(cal2, newdata = Df2[, 2:3], method = "Bayesian")
predsB$pred
predsB$se

# and predict using MAP method (much faster)
predsM <- predict(cal2, newdata = Df2[, 2:3], method = "MAP")
predsM$pred
predsM$se
}
