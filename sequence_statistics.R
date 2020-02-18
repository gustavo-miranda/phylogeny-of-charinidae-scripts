
library(ips)

setwd("pat/to/directory")

alig <- read.phy("file_with_sequences.phy")

# number of potentially-informative sites:
# ----------------------------------------
pis(alig, what = "abs")

# proportion of potentially-informative sites:
# --------------------------------------------
pis(alig, what = "frac")

# indices of potentially-informative sites:
# --------------------------------------------
pis(alig, what = "ind")








