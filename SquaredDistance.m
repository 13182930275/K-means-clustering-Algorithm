% The function SquaredDistance Calculates the square of the distance between two points in 3D space.
% Inputs: 1) P is an array containing three elements representing a point in 3D space.
%         2) Q is an array containing three elements representing a second point in 3D space.
% Ourputs: A single output, the square of the distance between the two points in 3D space.
% Author: Peter Bier


function D = SquaredDistance(P,Q)

%calculating the squared Distance between two points.
D = (P(1)-Q(1))^2 +(P(2)-Q(2))^2 +(P(3)-Q(3))^2;

end

