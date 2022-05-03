# ggsmatr
R package. Create a scatter plot based on the coefficients from (Standardised) Major Axis Estimation fit.

***ggsmatr***. This package allows generating ggplot-based scatter plots using the coefficients of the Major Axes Estimation (Standardized) fitted with the smatr package in R.

To install a development version of the package from GitHub:

<!-- ## Install package -->

<!-- To install a released version of the package from *CRAN*: -->

<!-- ```{r, eval=FALSE} -->

<!-- install.packages("tlamatini") -->

<!-- ``` -->



``` r
Sys.setenv(R_REMOTES_NO_ERRORS_FROM_WARNINGS = "true")
if (!require("remotes")) install.packages("remotes")
remotes::install_github("mariosandovalmx/ggsmatr")
```

<!-- *** -->
Usage example:
``` r
library(ggsmatr)
library(ggplot2)
library(smatr)
fit = sma(Yaxis ~ Xaxis + Sex, data = df,shift=T, elev.test=T)
summary(fit)
#
ggsmatr(data =  df, groups = "Sex", xvar =  "Xaxis", yvar = "Yaxis", sma.fit =  fit) + 
theme(legend.position = "top", legend.title=element_blank())+ 
ylab("Y axis")+ 
xlab("X axis")+ 
theme(legend.position = "top")
```
<br />
<p align="center">
  <a href="">
    <img src="https://github.com/mariosandovalmx/ecology/blob/main/images/ggsmatr.jpeg?raw=true" alt="ggsmatr" width="400" height="400">
  </a>
</p>



<!-- CONTACT -->
## Contact

If you have any questions, or would like to report a problem with the package you can contact me at:
Mario Sandoval - [@mariosandovalmo](https://twitter.com/mariosandovalmo) - sandoval.m@hotmail.com

More about me: [https://mariosandovalmx.github.io/ecology/](https://mariosandovalmx.github.io/ecology/)
