% The SelectKRandomPoints function generates a list of k randomly selected pixels from an
% image.
% Input:1) A is a 3D image array from which to select points from
%       2) k is the number of points to randomly select
% Output:It returns a single output, a 2D array, containing k rows and 2 columns, representing k
%        randomly selected points (pixels).
% Author: Peter Bier

function Points = SelectKRandomPoints(A,k)


[rows,cols,~]=size(A);
Rr=randi(rows,k,1);
Rc=randi(cols,k,1);
Points(:,1) =Rr;
Points(:,2)=Rc;


%Loops over the randomly generated points to check and replace any of the
%alike points.
%This loop runs untill no more points are similar.
count=1;
while count>0
    count=0;
    for i= 1:k
        for j=(i+1):k
            if Points(i,:)==Points(j,:) % If any points are equal and its not the same point being compared, new points will be generated replacing the old ones.
                Points(j,1)=randi(rows,1,1);
                Points(j,2)=randi(cols,1,1);
                count=count+1;
            end
        end
    end
end

end







