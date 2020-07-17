% The function MyImage creates a k-colour image for an image that has had its pixels divided into k clusters.
% All pixels in a given cluster will be recoloured using the mean colour values for that
% cluster.

% Inputs: The inputs are in the following order:
%         1) Clusters is an updated 2D array with m rows and n columns,
%            specifying which cluster each pixel belongs to.
%         2) Means is an updated 3D array containing k rows, 1 column and 3 layers, where each row contains
%         the mean colour values for the cluster corresponding to that row number.
%         E.g. the mean R, G and B values for cluster 1 will be stored in row 1. The
%         mean R, G and B values for cluster 2 will be stored in row 2 and so on.
% Outputs: It returns a single output, A 3D array of unsigned 8 bit integers with m rows, n
%          columns and 3 layers, representing an RGB image. The colour of each pixel in the
%          image is determined by the colour associated with that cluster.
% Author: Peter Bier


function MyImage = CreateKColourImage(Clusters, Means)

[rows,cols] = size(Clusters);

%Preinitialise for speed.
MyImage = zeros(rows,cols,3);

Layer1 = MyImage(:,:,1);
Layer2 = MyImage(:,:,2);
Layer3 = MyImage(:,:,3);

% k is  the number of clusters or colos the user want the picture to be
%displayed in.
k = unique(Clusters);

% Loops the number of clusters present to assign the rounded means values
% to points of respective clusters.
for i = 1:length(k)
    
    Layer1(Clusters==i) = round(Means(i,1,1));
    Layer2(Clusters==i) = round(Means(i,1,2));
    Layer3(Clusters==i) = round(Means(i,1,3));
end


MyImage(:,:,1)= Layer1;
MyImage(:,:,2) = Layer2;
MyImage(:,:,3) = Layer3;

% Converts MyImage into unsgned 8 bit integers to be displayed as an image.
MyImage = uint8(MyImage);
end

