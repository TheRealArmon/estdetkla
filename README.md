
# Classification project in TTT4275

## Iris task

The Iris folder contains function for classifying iris flower. The file IrisTask.m works as a main, and by removing numbers in the features array at the beginning of the script the classifier is trained and tested without the corresponding features that are romoved.


## Handwritten numbers (MNIST)

This conatins an implementation of different versions of NN classifiers both with and without clustering. Since a few of these take a while to run the results are stored in separate files load by the corresponding programs. 

NNConfMat_task1 is what plot the confusion matrix of the NN classifier that uses tho whole set, this is separate from the classifier itself since the classifier takes about 50 min to run.

ClusteringNN and ClusteringKNN are the two classifiers that run on the clustered dataset genrated by the clusterData function. These two can be run to get result from NN and KNN classifiers with clustering respectively.

Lastly to plot some of the classified images from the full data set NN classifier, the file plotImages_Task1 does this. The numbers in the index arrays in the code can also be swapped out to plot different images.
