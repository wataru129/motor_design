function [tmp] = Neighborhood(Times,good,Area_x,dimension,c_index)
%%%%%%%%%%%%%%%%%Sprinkle a point near goood solution %%%%%%%%%%%%%%%%%
    tmp=[];
    for J=1:Times
        for i=1:dimension
            tmp(J,i)=(good(c_index,i)+2.*rand*Area_x(i,1))-Area_x(i,1);
        end
    end
end