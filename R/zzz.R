.onAttach <- function(libname, pkgname) {
  # to show a startup message
  inicio<- c("

##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##                            ggsmatr - R package                         ----
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ \n\n")

  insight::print_color(inicio, "cyan")
  #insight::print_color("  ", "cyan")


  texto<- paste("El paquete ggsmatr se ha cargado con \u00e9xito. \u00a1Espero que lo disfrutes!\n", "Email de contacto: sandoval.m@hotmail.com \n", sep=" ")
  insight::print_color(texto, "cyan")

  texto2<- paste("Para citar este paquete: Mario A. Sandoval-Molina (2023). ggsmatr: a simple and efficient way to visualize the coefficients of the (Standardized) Major Axis Estimation fit. R package version 0.1.", sep=" ")
  insight::print_color(texto2, "green")


}

.onLoad <- function(libname, pkgname) {
  # something to run
}
