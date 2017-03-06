source("http://bioconductor.org/biocLite.R")
biocLite("rhdf5")
library(rhdf5)
created = h5createFile("example.h5")  ##
created
created = h5createGroup("example.h5","A") ##
created = h5createGroup("example.h5","B")
created = h5createGroup("example.h5","A/AB")
h5ls("example.h5")    ##
a = matrix(1:10,5,2)
h5write(a,"example.h5","A/a") ##
b = array(seq(1:20), dim = c(5,2,2))
attr(b,"scale") = "liter"
h5write(b,"example.h5", "B/b")
h5ls("example.h5")

df = data.frame(x=1:5,y= seq(0,1, length.out = 5),z= c("abc","def","ghi","jkl","mno"), stringsAsFactors = FALSE)
h5write(df, "example.h5", "df")


readA = h5read("example.h5", "A")
h5write(c(14,15,16),"example.h5","A/a", index = list(1:3,1))
h5read("example.h5", "A/a")

http://biocondutor.org/packages/release/bioc/vignettes/rhdf5/ins/doc/rhdf5.pdf

