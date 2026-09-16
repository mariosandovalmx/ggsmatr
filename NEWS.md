# ggsmatr 0.2.0

* Added an optional parametric confidence ribbon in `ggsmatr()` through the new
  arguments `ci`, `ci.alpha` and `n`.
* The ribbon uses the slope confidence intervals already stored in the `sma()`
  fit (`Slope_lowCI` and `Slope_highCI`) and is pivoted at each group centroid.
  Given that SMA lines pass through the group mean, this envelope presents the
  uncertainty of the slope rather than an OLS `geom_smooth()` band.
* The printed summary now includes `Slope`, `Slope_lowCI` and `Slope_highCI`
  when `ci = TRUE`.
* Documentation, vignette and examples were updated to show the presence of
  confidence ribbons in grouped SMA plots.

# ggsmatr 0.1

* First public version of the package, with grouped scatter plots and fitted
  SMA lines from a `smatr` object.
