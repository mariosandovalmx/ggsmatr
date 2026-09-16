# Changelog

## ggsmatr 0.2.0

- Added an optional parametric confidence ribbon in
  [`ggsmatr()`](https://mariosandovalmx.github.io/ggsmatr/reference/ggsmatr.md)
  through the new arguments `ci`, `ci.alpha` and `n`.
- The ribbon uses the slope confidence intervals already stored in the
  [`sma()`](https://traitecoevo.github.io/smatr/reference/sma.html) fit
  (`Slope_lowCI` and `Slope_highCI`) and is pivoted at each group
  centroid. Given that SMA lines pass through the group mean, this
  envelope presents the uncertainty of the slope rather than an OLS
  [`geom_smooth()`](https://ggplot2.tidyverse.org/reference/geom_smooth.html)
  band.
- The printed summary now includes `Slope`, `Slope_lowCI` and
  `Slope_highCI` when `ci = TRUE`.
- Documentation now explains how the ribbon is calculated: the slope
  confidence intervals from smatr are mapped through each group centroid
  as y = ybar + b_CI \* (x - xbar).

## ggsmatr 0.1

- First public version of the package, with grouped scatter plots and
  fitted SMA lines from a `smatr` object.
