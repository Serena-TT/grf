% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tune_local_linear_forest.R
\name{tune_ll_regression_forest}
\alias{tune_ll_regression_forest}
\title{Local linear forest tuning}
\usage{
tune_ll_regression_forest(
  forest,
  linear.correction.variables = NULL,
  ll.weight.penalty = FALSE,
  num.threads = NULL,
  lambda.path = NULL
)
}
\arguments{
\item{forest}{The forest used for prediction.}

\item{linear.correction.variables}{Variables to use for local linear prediction. If left null,
all variables are used. Default is NULL.}

\item{ll.weight.penalty}{Option to standardize ridge penalty by covariance (TRUE),
or penalize all covariates equally (FALSE). Defaults to FALSE.}

\item{num.threads}{Number of threads used in training. If set to NULL, the software
automatically selects an appropriate amount.}

\item{lambda.path}{Optional list of lambdas to use for cross-validation.}
}
\value{
A list of lambdas tried, corresponding errors, and optimal ridge penalty lambda.
}
\description{
Finds the optimal ridge penalty for local linear prediction.
}
\examples{
\donttest{
# Find the optimal tuning parameters.
n <- 500
p <- 10
X <- matrix(rnorm(n * p), n, p)
Y <- X[, 1] * rnorm(n)
forest <- regression_forest(X, Y)
tuned.lambda <- tune_ll_regression_forest(forest)

# Use this parameter to predict from a local linear forest.
predictions <- predict(forest, linear.correction.variables = 1:p,
                       ll.lambda = tuned.lambda$lambda.min)
}

}
\keyword{internal}
