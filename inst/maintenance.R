#========================
#staticdocs dev version
#========================
#packages
# library(devtools); install_github("qdap", "trinker"); install_github("staticdocs", "hadley")
# install_github("acc.roxygen2", "trinker")
library(highlight); library(qdap); library(staticdocs); library(acc.roxygen2)

#STEP 1: create static doc  
#right now examples are FALSE in the future this will be true
#in the future qdap2 will be the go to source
build_site(pkg="C:/Users/trinker/GitHub/qdap")

#STEP 2: reshape index
path <- "inst/web"
path2 <- file.path(path, "/index.html")
rdme <- "C:/Users/trinker/GitHub/qdap/inst/extra_statdoc/readme.R"
extras <- qcv("%ha%", "hash_look", "%l%", "%l+%")

expand_statdoc(path2, to.icon = extras, readme = rdme, 
    combine = qcv(character_table, char_table))

#x <- readLines(path2)
#x[grepl("<h2>Authors</h2>", x)] <- paste(c("<h2>Author</h2>", 
#    rep("<h2>Contributor</h2>", 2)),
#    c("Tyler W. Rinker", "Dason Kurkiewicz", "Bryan Goodrich"))
#
#cat(paste(x, collapse="\n"), file=path2)


#STEP 3: move to trinker.guthub
library(reports)
file <- "C:/Users/trinker/GitHub/trinker.github.com/"
incoming <- file.path(file, "qdapTools_dev")
delete(incoming)
file.copy(path, file, TRUE, TRUE)
file.rename(file.path(file, "web"), incoming)
## delete(path)
#==========================
#staticdocs current version
#==========================
#packages
# library(devtools); install_github("qdap", "trinker"); install_github("staticdocs", "hadley")
# install_github("acc.roxygen2", "trinker")
library(highlight); library(qdap); library(staticdocs); library(acc.roxygen2)

#STEP 1: create static doc  
#right now examples are FALSE in the future this will be true
#in the future qdap2 will be the go to source
build_site(pkg="C:/Users/trinker/GitHub/qdap")

#STEP 2: reshape index
path <- "inst/web"
path2 <- file.path(path, "/index.html")
rdme <- "C:/Users/trinker/GitHub/qdap/inst/extra_statdoc/readme.R"
extras <- qcv("%ha%", "hash_look", "%l%", "%l+%")

expand_statdoc(path2, to.icon = extras, readme = rdme, 
    combine = qcv(character_table, char_table))

#x <- readLines(path2)
#x[grepl("<h2>Authors</h2>", x)] <- paste(c("<h2>Author</h2>", 
#    rep("<h2>Contributor</h2>", 2)),
#    c("Tyler W. Rinker", "Dason Kurkiewicz", "Bryan Goodrich"))
#
#cat(paste(x, collapse="\n"), file=path2)


#STEP 3: move to trinker.guthub
library(reports)
file <- "C:/Users/trinker/GitHub/trinker.github.com/"
incoming <- file.path(file, "qdapTools")
delete(incoming)
file.copy(path, file, TRUE, TRUE)
file.rename(file.path(file, "web"), incoming)
## delete(path)

#==========================
# NEWS new version
#==========================
x <- c("BUG FIXES", "NEW FEATURES", "MINOR FEATURES", "IMPROVEMENTS", "CHANGES")
cat(paste(x, collapse = "\n\n"), file="clipboard")


