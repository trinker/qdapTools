#========
# BUILD
#========
source("inst/build.R")

#==========================
# Run unit tests
#==========================
devtools::test()

#========================
#staticdocs dev version
#========================
#packages
pacman::p_load_gh("hadley/staticdocs")
pacman::p_load(highlight)


#STEP 1: create static doc  
#right now examples are FALSE in the future this will be true
#in the future qdap2 will be the go to source
R_USER <-  switch(Sys.info()[["user"]],
    Tyler = "C:/Users/Tyler",
    trinker = "C:/Users/trinker",
    message("Computer name not found")
)

build_site(pkg=file.path(R_USER, "GitHub/qdapTools"), launch = FALSE)

#STEP 2: reshape index
path <- "inst/web"
path2 <- file.path(path, "/index.html")
rdme <- file.path(R_USER, "GitHub/qdapTools/inst/extra_statdoc/readme.R")

extras <- qdap::qcv("hash_look", "%l%", "%l+%", "sec2hms", "%hl%", 
	"%hl+%",  "%lc%", "%lc+%", "shift_left", "shift_right")

drops <- qdap::qcv(lookup.character, lookup.data.frame, lookup.list, lookup.matrix, 
	hash_e, lookup.factor, lookup.numeric,v_outer.data.frame, v_outer.list, 
    v_outer.matrix, loc_split.character, loc_split.data.frame, loc_split.default, 
    loc_split.numeric, loc_split.factor, loc_split.list, loc_split.matrix)


acc.roxygen2::expand_statdoc(path2, to.icon = extras, readme = rdme, drop=drops)

x <- readLines(path2)
x[grepl("<h2>Authors</h2>", x)] <- paste(c("<h2>Author</h2>", 
    rep("<h2>Contributor</h2>", 3)),
    c("Tyler W. Rinker", "Dason Kurkiewicz", "Bryan Goodrich", "Kirill M&uuml;ller"))

cat(paste(x, collapse="\n"), file=path2)


#STEP 3: move to trinker.guthub
file <- file.path(R_USER, "GitHub/trinker.github.com/")
incoming <- file.path(file, "qdapTools_dev")
reports::delete(incoming)
file.copy(path, file, TRUE, TRUE)
file.rename(file.path(file, "web"), incoming)
## delete(path)
#==========================
#staticdocs current version
#==========================
#packages
# library(devtools); install_github("staticdocs", "hadley")
# install_github("acc.roxygen2", "trinker"); install.packages("rstudioapi")
library(highlight);library(staticdocs); 

#STEP 1: create static doc  
#right now examples are FALSE in the future this will be true
#in the future qdap2 will be the go to source
R_USER <-  switch(Sys.info()[["user"]],
    Tyler = "C:/Users/Tyler",
    trinker = "C:/Users/trinker",
    message("Computer name not found")
)

build_site(pkg=file.path(R_USER, "GitHub/qdapTools"))

#STEP 2: reshape index
path <- "inst/web"
path2 <- file.path(path, "/index.html")
rdme <- "inst/extra_statdoc/readme.R"
library(acc.roxygen2); #library(qdap);
extras <- qcv("hash_look", "%l%", "%l+%", "sec2hms", "%hl%", 
	"%hl+%",  "%lc%", "%lc+%", "shift_left", "shift_right")

drops <- qcv(lookup.character, lookup.data.frame, lookup.list, lookup.matrix, 
    hash_e, lookup.factor, lookup.numeric,v_outer.data.frame, v_outer.list, 
    v_outer.matrix, loc_split.character, loc_split.data.frame, loc_split.default, 
    loc_split.numeric, loc_split.factor, loc_split.list, loc_split.matrix)

expand_statdoc(path2, to.icon = extras, readme = rdme, drop=drops)

x <- readLines(path2)
x[grepl("<h2>Authors</h2>", x)] <- paste(c("<h2>Author</h2>", 
    rep("<h2>Contributor</h2>", 3)),
    c("Tyler W. Rinker", "Dason Kurkiewicz", "Bryan Goodrich", "Kirill M&uuml;ller"))

cat(paste(x, collapse="\n"), file=path2)


#STEP 3: move to trinker.guthub
file <- file.path(R_USER, "GitHub/trinker.github.com/")
# incoming <- file.path(file, "qdapTools")
reports::delete(incoming)
file.copy(path, file, TRUE, TRUE)
file.rename(file.path(file, "web"), incoming)
## delete(path)

#==========================
# knit README.md
#==========================
knitr::knit2html("README.Rmd", output ='README.md'); reports::delete("README.html")


#==========================
# NEWS new version
#==========================
x <- c("BUG FIXES", "NEW FEATURES", "MINOR FEATURES", "IMPROVEMENTS", "CHANGES")
cat(paste(x, collapse = "\n\n"), file="clipboard")




