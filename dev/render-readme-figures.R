# Generate README figures for the iris SMA example.
# Run from the package root: Rscript dev/render-readme-figures.R

pkgload::load_all(".", export_all = FALSE)

datafile <- system.file("iris.csv", package = "ggsmatr")
df.iris <- read.csv(datafile, encoding = "UTF-8")

library(ggplot2)
library(smatr)

fit <- sma(
  Sepal.Length ~ Sepal.Width + Species,
  data = df.iris,
  shift = TRUE,
  elev.test = TRUE,
  alpha = 0.05
)

fig_dir <- "man/figures"
dir.create(fig_dir, recursive = TRUE, showWarnings = FALSE)

p_sma <- ggsmatr(
  data = df.iris,
  groups = "Species",
  xvar = "Sepal.Width",
  yvar = "Sepal.Length",
  sma.fit = fit
) +
  theme(
    legend.position = "top",
    legend.title = element_blank()
  ) +
  ylab("Sepal.Length") +
  xlab("Sepal.Width")

p_ci <- ggsmatr(
  data = df.iris,
  groups = "Species",
  xvar = "Sepal.Width",
  yvar = "Sepal.Length",
  sma.fit = fit,
  ci = TRUE
) +
  theme(
    legend.position = "top",
    legend.title = element_blank()
  ) +
  ylab("Sepal.Length") +
  xlab("Sepal.Width")

ggplot2::ggsave(
  filename = "iris-sma.png",
  plot = p_sma,
  path = fig_dir,
  width = 7,
  height = 5,
  dpi = 150,
  bg = "white"
)

ggplot2::ggsave(
  filename = "iris-sma-ci.png",
  plot = p_ci,
  path = fig_dir,
  width = 7,
  height = 5,
  dpi = 150,
  bg = "white"
)

cat("Wrote figures to", fig_dir, "\n")
