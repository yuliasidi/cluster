#!/home/statsadmin/R/bin/Rscript


# Prepare: collect command line arguments,
# set iteration number and a unique seed
#args <- commandArgs()
args <- c('10000000','condor/data/pihat-1.rds')
set.seed(Sys.time())
n <- as.numeric(args[length(args)-1])

# Collect n samples
x <- runif(n)
y <- runif(n)

# Compute and output the value of pi
pihat <- sum(x * x + y * y < 1) / n * 4

path <- dirname(args[length(args)])

if(!dir.exists(path))
  dir.create(path,recursive = TRUE)

saveRDS(pihat,file = args[length(args)])

proc.time()
