library(rlang)

# find_x
# returns the variable name used to populate the x axis of a ggplot
# compatible with mapping in ggplot() and geom_() layer

find_x <- function(plotname) {
  if("ggplot" %in% class(plotname)) {
    if("x" %in% ls(plotname$mapping)) return(quo_get_expr(plotname$mapping$x)) else
    if("x" %in% ls(plotname$layers[[1]]$mapping)) return(quo_get_expr(plotname$layers[[1]]$mapping$x))
  } else
    return(NULL)
}

# find_y
# returns the variable name used to populate the y axis of a ggplot
# compatible with mapping in ggplot() and geom_() layer
find_y <- function(plotname) {
  if("ggplot" %in% class(plotname)) {
    if("y" %in% ls(plotname$mapping)) return(quo_get_expr(plotname$mapping$y)) else
      if("y" %in% ls(plotname$layers[[1]]$mapping)) return(quo_get_expr(plotname$layers[[1]]$mapping$y))
  } else
    return(NULL)
}

