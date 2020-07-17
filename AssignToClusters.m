% The function SAssignToClusters Assigns each point (pixel) in an image to
% a cluster, based n which mean that point is closest to.

% Inputs: 1)A is a 3D array with m rows, n columns and 3 layers, containing
%           an RGB image
%         2) seedMeans is a 3D array containing k rows, 1 column and 3
%            layers containing the colour information for each of k means.        
% Outputs: A single output being a 2D array with m rows and n columns, that
%          contains the corresponding cluster number for each pixel in the image.
% Author: Peter Bier


function Clusters = AssignToClusters(A,seedMeans)

%Find the sizes of A and seedMeans.
[rows,cols,~]=size(A);
[rows2,~,~] = size(seedMeans);

%Preinitialse for speed.
Clusters = zeros(rows,cols);

Distance= zeros(1,rows2);

%Loops over all the points and finds the Sqaured distance from every mean point.
for i = 1:rows
    for j =  1:cols
        for k = 1:rows2
            
            
            Distance(1,k) = SquaredDistance(A(i,j,:),seedMeans(k,1,:));
            
        end
        %Get the cluster number of the smallest distance of a point from
        %the mean Point.
        [~,x]= min(Distance);
        
        %store the cluster number that each pixel belongs to in a 2D array.
        Clusters(i,j) = x;
    end
end

end



