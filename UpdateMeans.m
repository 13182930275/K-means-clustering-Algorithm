% The fucnction UpdateMeans Calculates and updates the mean values for each cluster.
% Inputs:1) A is a 3D array with m row, n columns and 3 layers, containing an RGB image
%        2) A single value, k, specifying how many clusters there are.
%        3) Clusters is a 2D array with m rows and n columns specifying which cluster each pixel
%        belongs to.
% Outputs:A single output, a 3D array containing k rows, 1 column and 3 layers, containing the
%         mean values for each cluster. E.g. the mean R, G and B values for cluster 1 will be
%         stored in row 1. The mean R, G and B values for cluster 2 will be stored in row 2 and
%         so on.
% Author: Peter Bier


function means = UpdateMeans(A,k,Clusters)

Layer1=A(:,:,1);
Layer2=A(:,:,2);
Layer3=A(:,:,3);

%Preinitialise means for speed.
means=zeros(k,1,3);

%Loops over each point and calculates the mean based on the cluster it
%belongs to.
for i= 1:k
    means(i,1,1) = mean(Layer1(Clusters==i));
    means(i,1,2) = mean(Layer2(Clusters==i));
    means(i,1,3) = mean(Layer3(Clusters==i));
    
end
end