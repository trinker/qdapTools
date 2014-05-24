context("Checking lookup")

test_that("lookup is producing vectors with NA for missing",{
    expect_true(length(lookup(1:5, data.frame(1:4, 11:14))) == 5)
    expect_true(is.na(lookup(1:5, data.frame(1:4, 11:14))[5]))
})

test_that("lookup is producing vectors with original for missing = NULL",{
    expect_true(lookup(1:5, data.frame(1:4, 11:14), missing=NULL)[5]==5)
})

test_that("lookup is producing vectors with factors",{
	key <- data.frame(a=1:3, b=factor(paste0("l", 1:3)))
    expect_true(is.factor(1:3 %l% key) )
})

test_that("lookup gives a character when column 2 is character",{
    expect_true(is.character(lookup(mtcars$carb, sort(unique(mtcars$carb)),
        c("one", "two", "three", "four", "six", "eight"))))
})

test_that("lookup works with lists",{
    codes <- list(
        A = c(1, 2, 4),
        B = c(3, 5),
        C = 7,
        D = c(6, 8:10)
    )
    
    expect_true(identical(lookup(1:10, codes), 
    	c("A", "A", "B", "A", "B", "D", "C", "D", "D", "D")))

})

test_that("lookup is speedy; less than 1.5 sec on 10 mill",{
    recode_me <- sample(1:(length(LETTERS)*10), 10000000, TRUE)
    tic <- Sys.time()
    output <- recode_me %l% split(1:(length(LETTERS)*10), LETTERS)

    OS <- Sys.info()["sysname"]
    if (OS %in% c("Darwin", "Windows", "Linux")) {
        expect_true(as.numeric(difftime(Sys.time(), tic)) < 5)
    }	

})



