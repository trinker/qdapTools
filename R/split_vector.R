#' Split a Vector By Split Points
#' 
#' Splits a \code{vector} into a list of vectors based on split points.
#' 
#' @param x A vector with split points.
#' @param split A vector of places (elements) to split on.
#' @param include An integer of \code{1} (\code{split} character(s) are not 
#' included in the output), \code{2} (\code{split} character(s) are included at 
#' the beginning of the output), or \code{3} (\code{split} character(s) are 
#' included at the end of the output). 
#' @return Returns a list of vectors. 
#' @author Matthew Flickinger and Tyler Rinker <tyler.rinker@@gmail.com>.
#' @references \url{http://stackoverflow.com/a/24319217/1000343} 
#' @export
#' @examples
#' set.seed(15)
#' x <- sample(c("", LETTERS[1:10]), 25, TRUE, prob=c(.2, rep(.08, 10)))
#' 
#' split_vector(x)
#' split_vector(x, "C")
#' split_vector(x, c("", "C"))
#' 
#' split_vector(x, include = 0)
#' split_vector(x, include = 1)
#' split_vector(x, include = 2)
#' 
#' set.seed(15)
#' x <- sample(1:11, 25, TRUE, prob=c(.2, rep(.08, 10)))
#' split_vector(x, 1)
split_vector <- function(x, split = "", include = FALSE) {

    include <- as.numeric(include)

    if (length(include) != 1 || !include %in% 0:2) {
        stop("Supply 0, 1, or 2 to `include`")
    }

    if (include %in% 0:1){
        breaks <- x %in% split
    
        if(include == 1) {
            inds <- rep(TRUE, length(breaks))
        } else {
            inds <- !breaks
        }
        out <- split(x[inds], cumsum(breaks)[inds])
        names(out) <- seq_along(out)
        out

    } else {
        locs <- which(x %in% split)
        start <- c(1, locs + 1)
        end <- c(locs, length(x))
    
        lapply(Map(":", start, end), function(ind){
            x[ind]
        })
    }
}




