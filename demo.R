
## Following is a demo to run the following code:

## All the necessary numerical computations were run on an Intel Core i3-7020U CPU (2.30GHz, 2.30 GHz) with 2 cores and 4GB RAM.

## Instructions to run DP-MoM, our proposed method, on any computer with R:
# - Open the `DP-MoM-R-Codes.Rproj` file, preferably in RStudio.
# - Open the file `demo.py`.
# - Open `methods.R`, and install the required packages if not already installed.
# - Call `DP.MoM.optimized(data)` where data is character string containing the name of the dataset (Please refer to the datasets folder within the R Project).


DP.MoM.optimised <- function(dataset.name){
   source(paste0(getwd(),"/methods.R"))
   
   dataset <- read.csv(paste0(getwd(),'/datasets/',dataset.name,'.csv'))
   
   data <- as.matrix(dataset[,-1])
   ground <- as.numeric(dataset[,1])
   
   ## When the initial permutation/indexing is NOT mentioned:
   ## parameter.optimise(X, n.0, ground, eta = distances(data)) 
   ## parameter.optimise(X, n.0, ground, eta = 10 * distances(data))
   
   ## When the initial permutation/indexing is mentioned:
   ## parameter.optimise(X, n.0, ground, eta = distances(data), index)
   ## parameter.optimise(X, n.0, ground, eta = 10 * distances(data), index)
   
   ## X       =  data matrix with n (no. of data points) rows and p (no. of features) columns
   ## n.0     =  number of noisy data points added to the dataset (default is 0)
   ## ground  =  the ground truth corresponding to the dataset 'data' excluding the 'outliers'
   ## index   =  the random permutation of the data points
   
   optimise.data <- parameter.optimise(X = data, 
                                       n.0 = 0, 
                                       ground = ground, 
                                       eta = distances(data))
   
   return(optimise.data)
}

## Feed the name of the dataset as mentioned in the paper, in lower case.
## For example, in order to implement DP-MoM on the dataset 'glass', 
## try DP.MoM.optimized("glass"). This step may take some time.

# results.glass <- DP.MoM.optimised("glass")
# results.west_2001 <- DP.MoM.optimised("west_2001")







