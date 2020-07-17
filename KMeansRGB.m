% The function KmeansRGB Partitions the points in an image into k clusters, using the k-means algorithm to do so.
% Inputs: The inputs are in the following order.
%        1) A is a 3D array with m rows, n columns and 3 layers, containing an RGB image.
%        2) seedMeans is a 3D array containing k rows, 1 column and 3 layers, containing the seed
%        mean values which will be used to initialise the k-means algorithm.
%        3) The maximum number of iterations to perform.
% Outputs:The outputs are in the following order.
%         1) Clusters is an updated 2D array with m rows and n columns specifying which cluster each pixel
%         belongs to
%         2) Means is an updated 3D array containing k rows, 1 column and 3 layers, where each row contains
%         the mean colour values for the cluster corresponding to that row number.
%         E.g. the mean R, G and B values for cluster 1 will be stored in row 1. The
%         mean R, G and B values for cluster 2 will be stored in row 2 and so on.
% Author: Peter Bier


function [Clusters,Means] = KMeansRGB(A,seedmeans,maxIterations)

[rows,~,~] = size(seedmeans);



Means = seedmeans;

u=1;
i=0;

%Using a boolean variable to control the loop.
%While the boolean variable remains true the clusters and the means are
%constantly updated.
while u==1
    
    X = Means;
    
    Clusters = AssignToClusters(A,Means);
    
    
    Means = UpdateMeans(A,rows,Clusters);
    % i is incremented each time the loop runs and if it becomes equal maxiterations before the convergence is achieved the loop exits,
    % and some text is displayed.
    i = i+1;
    
    if i== maxIterations
        disp('Maximum number of iterations reached before convergence was achieved')
        X=Means;
    end
    %Loop exits if the old means are equal to new means.
    if X==Means
        u=0;
    end
    
    
end

end

