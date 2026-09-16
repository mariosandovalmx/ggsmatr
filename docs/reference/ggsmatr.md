# ggsmatr 'ggplot2' based SMATR plots

Create a scatter plot based on the coefficients from (Standardised)
Major Axis Estimation fit.

## Usage

``` r
ggsmatr(data, groups, xvar, yvar, sma.fit, ci = FALSE, ci.alpha = 0.2, n = 100)
```

## Arguments

- data:

  a dataframe.

- groups:

  group variable.

- xvar:

  x variable for drawing.

- yvar:

  y variable for drawing.

- sma.fit:

  an sma or ma object fitted in SMATR package.

- ci:

  logical. If TRUE, add a parametric confidence ribbon for the SMA
  slope. Default is FALSE.

- ci.alpha:

  Alpha transparency passed to
  [`ggplot2::geom_ribbon()`](https://ggplot2.tidyverse.org/reference/geom_ribbon.html).
  Default is 0.2.

- n:

  Number of x values at which the confidence ribbon is evaluated in each
  group. Default is 100.

## Value

ggplot based plot of sma.

## Details

Fitted SMA/MA lines are drawn from the slope and elevation stored in
`sma.fit`. When `ci = TRUE`, a ribbon is added from the slope confidence
intervals already computed by
[`smatr::sma()`](https://traitecoevo.github.io/smatr/reference/sma.html)
(`Slope_lowCI` and `Slope_highCI` in `sma.fit$groupsummary`). The
confidence level is the one used in `sma(..., alpha = )`.

Given that SMA lines pass through the group centroid \\(\bar{x},
\bar{y})\\, slope and intercept are not independent. The ribbon is
therefore a family of lines through that centroid: \$\$y = \bar{y} +
b\_{\mathrm{CI}}(x - \bar{x}).\$\$ `ymin` and `ymax` are obtained with
[`pmin()`](https://rdrr.io/r/base/Extremes.html)/[`pmax()`](https://rdrr.io/r/base/Extremes.html),
because the lower slope produces the higher line when \\x \< \bar{x}\\.
The envelope pinches at the group mean and is not related with the OLS
band of
[`geom_smooth()`](https://ggplot2.tidyverse.org/reference/geom_smooth.html).
It does not combine intercept CIs with slope CIs independently, and it
is not a bootstrap prediction interval.

## References

Warton, D. I., Wright, I. J., Falster, D. S. and Westoby, M. (2006).
Bivariate line-fitting methods for allometry. *Biological Reviews* 81,
259–291.

Warton, D. I., Duursma, R. A., Falster, D. S. and Taskinen, S. (2012).
smatr 3 – an R package for estimation and inference about allometric
lines. *Methods in Ecology and Evolution* 3, 257–259.

## Examples

``` r
datafile <- system.file("iris.csv", package = "ggsmatr")
df.iris <- read.csv(datafile, encoding = "UTF-8")

library(ggsmatr)
library(ggplot2)
library(smatr)
fit <- sma(Sepal.Length ~ Sepal.Width + Species,
           data = df.iris, shift = TRUE, elev.test = TRUE, alpha = 0.05)

ggsmatr(data = df.iris, groups = "Species",
        xvar = "Sepal.Width", yvar = "Sepal.Length",
        sma.fit = fit) +
  theme(legend.position = "top", legend.title = element_blank()) +
  ylab("Sepal.Length") +
  xlab("Sepal.Width")

# parametric slope-CI ribbon, using the intervals already stored in the sma fit
ggsmatr(data = df.iris, groups = "Species",
        xvar = "Sepal.Width", yvar = "Sepal.Length",
        sma.fit = fit, ci = TRUE) +
  theme(legend.position = "top", legend.title = element_blank()) +
  ylab("Sepal.Length") +
  xlab("Sepal.Width")
```
