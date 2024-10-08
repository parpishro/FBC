% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/correlation.R
\name{correlation}
\alias{correlation}
\title{Correlation Between Rows of Two Matrices.}
\usage{
correlation(X, Y = NULL, theta, alpha)
}
\arguments{
\item{X}{matrix with at least two rows}

\item{Y}{matrix with same number of columns as X}

\item{theta}{vector of scale parameters (\eqn{\theta \in (0, \inf)}) with the same
size as number of columns as X}

\item{alpha}{vector of smoothness parameters (\eqn{\alpha \in [1, 2]}) with the same
size as number of columns as X}
}
\value{
\if{html}{\out{<div class="sourceCode">}}\preformatted{ a correlation matrix between the rows of given matrices
}\if{html}{\out{</div>}}
}
\description{
If only one matrix is provided, \code{correlation} would compute the correlation between
the rows of the given matrix. Each entry \eqn{R[i, j]} in the returned correlation matrix is
correlation between row i of X and row j of Y (X if Y is null) using given smoothness
and scale parameters. To compute correlation, separable power exponential correlation
structure is assumed and using Euclidean notion of distance between rows.
}
\examples{
X     <- matrix(c(1, 3, 5,
                  2, 2, 6,
                  1, 4, 1), nrow = 3, byrow = TRUE)

Y     <- matrix(c(7, 3, 0,
                  2, 2, 4), nrow = 2, byrow = TRUE)

sc    <- c(1, 2, 3) # scale parameters of correlation structure
sm    <- c(2, 1, 2) # smoothness parameters of correlation structure

# correlation of a matrix with itself
correlation(X, theta = sc, alpha = sm)

# correlation between two matrices
correlation(X, Y, theta = sc, alpha = sm)

}
