#' 'ggplot2' Based SMATR Plots
#'
#' Create a scatter plot based on the coefficients from (Standardised) Major Axis Estimation fit.
#' @usage ggsmatr(data, groups , xvar , yvar, sma.fit)
#' @param data a dataframe.
#' @param groups group variable.
#' @param xvar x variable for drawing.
#' @param yvar y variable for drawing.
#' @param sma.fit an sma or ma object fitted in SMATR package.
#'
#' @return ggplot based plot of sma.
#' @export
#'
#' @examples
#' #data(iris)
#' #library(smatr)
#' #fit <- sma(Petal.Width ~ Petal.Length+ Species, data=iris)
#' #ggsmatr(data =  iris, groups = "Species", xvar =  "Petal.Length", yvar =
#' #"Petal.Width", sma.fit =  fit)
#'
#' #Do not run, just examples.
#' #ggsmatr(data =  df1, groups = "Site", xvar =  "Point.count", yvar =
#' #"Mist.nets", sma.fit =  fit)
#' #ggsmatr(data =  evdata, groups = "site.method", xvar =  "Species.richness",
#' #yvar ="EvennesObserved", sma.fit =  fit)
#' #Plot is saved as ggp object, and can be edited using ggplot parameters.
#' #ggp + xlab("x axis name") + ylab("y axis name") +theme(legend.position = "right",
#' #legend.title=element_blank())
#' @encoding UTF-8
#' @importFrom graphics plot
#' @importFrom dplyr mutate_if
#' @importFrom dplyr select
#' @importFrom dplyr group_by
#' @importFrom tibble rownames_to_column
#' @importFrom dplyr summarise
#' @importFrom dplyr mutate
#' @importFrom dplyr across
#' @importFrom ggplot2 ggplot
#' @importFrom ggplot2 geom_point
#' @importFrom ggplot2 geom_segment
#' @importFrom stats coef
#' @importFrom stats na.omit
ggsmatr <- function(data, groups, xvar, yvar, sma.fit){


  x.var <- rlang::sym(xvar)
  y.var <- rlang::sym(yvar)
  grp <- rlang::sym(groups)
  ngrps<- length(unique(data[[groups]]))

  # as factors, function from Tlamatini package
  as_factorALL<- function(dataframe){

    df<- dataframe
    df[sapply(df, is.character)] <- lapply(df[sapply(df, is.character)],
                                           as.factor)
    return(df)
  }

  data<- as_factorALL(data)
  # define colors
  grps.df = unique(data[[groups]])
  station_cols = scales::hue_pal()(length(grps.df))
  names(station_cols) <- unique(data[[groups]])

  fitsall <- sma.fit$groupsummary %>% select(group , r2, pval, Slope, Int)
  fitsall <- fitsall %>%  mutate_if(is.numeric, round, digits = 3)
  fitsall


  # extraer coeficientes de SMA, vars:  dataframe  groups   xvar
  bb <- data.frame(coef(sma.fit))

  bb <- bb %>%
    tibble::rownames_to_column(var = "group")

  # calcular minimo y maximo del eje x para cada sitio
  bb2 <- data %>% dplyr::select(groups, xvar) %>%  dplyr::group_by(.data[[groups]]) %>%
    dplyr::summarise(dplyr::across(.cols = xvar,
                                   .fns = list(min = min, max = max),
                                   .names = "{fn}_x"))
  names(bb2)[1] <- 'group'


  #unir dataframe
  bb3 <- base::merge(bb,bb2, by= "group")

  #calcular min y max de y con intercepto y elevacion
  bb4 <- bb3 %>%
    dplyr::mutate(min_y = (slope*min_x) + elevation) %>%
    dplyr::mutate(max_y = (slope*max_x) + elevation)
  data<- stats::na.omit(data)

  df.pl <- cbind(bb4, fitsall[,-1])

  print(df.pl[,c(1,8,9)])

  ggp <-  ggplot2::ggplot(data = data, ggplot2::aes(x = !! x.var,
                                                    y = !! y.var,
                                                    color= !! grp,
                                                    fill= !! grp)) +
    ggplot2::geom_point(size=3) +
    geom_segment(data = df.pl ,ggplot2::aes(x= min_x, xend= max_x, y=min_y, yend=max_y, colour= group),inherit.aes = FALSE)


  .GlobalEnv$ggp <- ggp


  return(ggp)

}

