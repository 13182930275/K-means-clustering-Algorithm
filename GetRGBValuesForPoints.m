%The function GetRGBValuesForPoints Returns the RGB colour values for a list of specified points from an image.
% inputs: 1) A is a 3D image array from which to fetch RGB values from
%         2) Points is a 2D array of k rows and 2 columns identifying which points (i.e. pixels) to
%         extract colour values for.
% Outputs: It returns a single output, a 3D array, containing k rows, 1 column and 3 layers,
%          representing a list of k points from the image (each row corresponds to the colour
%          information for a particular pixel from the image).
% Author: Peter Bier


function Colors = GetRGBValuesForPoints(A,Points)

[rows,~] = size(Points);

%Preinitialise Colors for speed
Colors=zeros(rows,1,3);

%Loop over entire rows and layers of the points to get RGB values for the
%points and store them in Colors.
for i = 1:rows
    for k=1:3
        Colors(i,1,k) = A(Points(i,1),Points(i,2),k);
    end
end
end
