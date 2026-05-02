# 📊 ggsmatr

> An elegant extension of the [`smatr`](https://cran.r-project.org/web/packages/smatr/index.html) R package that leverages the **`ggplot2`** interface to create beautiful, publication-ready plots.

![R](https://img.shields.io/badge/R-package-276DC3?style=flat&logo=r&logoColor=white)
![ggplot2](https://img.shields.io/badge/built%20with-ggplot2-1f77b4?style=flat)
![License](https://img.shields.io/badge/license-MIT-green.svg)

---

## ✨ Overview

`ggsmatr` brings together the power of **standardized major axis (SMA) regression** from the `smatr` package and the rich, customizable visualization capabilities of **`ggplot2`**. With just a few lines of code, you can generate clean, grouped scatter plots with fitted SMA lines — perfect for exploratory analysis and scientific publications.

---

## 📦 Installation

Make sure you have the required dependencies installed:

```r
install.packages(c("ggplot2", "smatr"))
# Then install ggsmatr (e.g., from GitHub)
# devtools::install_github("user/ggsmatr")
```

---

## 🚀 Quick Start

Here's a complete example using the classic **Iris** dataset:

### 1️⃣ Load the data

```r
datafile <- system.file("iris.csv", package = "ggsmatr")
df.iris  <- read.csv(datafile, encoding = "UTF-8")
```

### 2️⃣ Load the libraries and fit the SMA model

```r
library(ggsmatr)
library(ggplot2)
library(smatr)

fit <- sma(
  Sepal.Length ~ Sepal.Width + Species,
  data      = df.iris,
  shift     = TRUE,
  elev.test = TRUE
)
```

### 3️⃣ Build the plot

```r
ggsmatr(
  data    = df.iris,
  groups  = "Species",
  xvar    = "Sepal.Width",
  yvar    = "Sepal.Length",
  sma.fit = fit
) +
  theme(
    legend.position = "top",
    legend.title    = element_blank()
  ) +
  ylab("Sepal.Length") +
  xlab("Sepal.Width") +
  theme(legend.position = "top")
```

---

## 🎨 Features

- 🔗 **Seamless integration** with `ggplot2` — chain any layer or theme you like.
- 📈 **SMA regression lines** drawn automatically from a `smatr::sma()` fit.
- 🎯 **Group-aware plotting** with consistent color mappings across points and lines.
- 🛠️ **Fully customizable** — labels, themes, legends, and more.

---

## 📚 Related Packages

| Package   | Purpose                                  |
|-----------|------------------------------------------|
| `smatr`   | Standardized Major Axis regression       |
| `ggplot2` | Grammar-of-graphics plotting             |
| `ggsmatr` | The bridge between the two ✨            |

---

## 📄 License

Released under the MIT License.
