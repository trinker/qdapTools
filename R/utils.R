## List/Matrix/Vector to Dataframe
## 
## \code{list2df} - Convert a named list of vectors to a dataframe.
list2df <- function(list.object, col1 = "X1", col2 = "X2") {

    ## Make sure the vectors have names; if not use numbers
    if (is.null(names(list.object))){
        names(list.object) <- seq_along(list.object)
    }

    dat <- data.frame(x = unlist(list.object, ,FALSE), 
        y = rep(names(list.object), sapply(list.object, length)), 
        stringsAsFactors = FALSE, check.names=FALSE)
    colnames(dat) <- c(col1, col2)
    dat
}

## Paste an Unspecified Number Of Text Columns
## 
## \code{paste2} - Paste unspecified columns or a list of vectors together.
paste2 <-
function(multi.columns, sep=".", handle.na=TRUE, trim=TRUE){
    if (is.matrix(multi.columns)) {
        multi.columns <- data.frame(multi.columns)
    }
    if (trim) multi.columns <- lapply(multi.columns, function(x) {
            gsub("^\\s+|\\s+$", "", x)
        }
    )
    if (!is.data.frame(multi.columns) & is.list(multi.columns)) {
        multi.columns <- do.call('cbind', multi.columns)
    } 
    m <- if (handle.na){
                 apply(multi.columns, 1, function(x){
                     if (any(is.na(x))){
                         NA
                     } else {
                         paste(x, collapse = sep)
                     }
                 }
             )   
         } else {
             apply(multi.columns, 1, paste, collapse = sep)
    }
    names(m) <- NULL
    return(m)
}