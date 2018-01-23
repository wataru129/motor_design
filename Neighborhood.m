function [tmp] = Neighborhood(Times,good,Arx,dimension)
%%%%%%%%%%%%%%%%%Sprinkle a point near goood solution %%%%%%%%%%%%%%%%%
    tmp=[];
    for J=1:Times
        for i=1:dimension
            tmp(J,i)=(good(1,i)+2*rand*Arx(i))-Arx(i);
        end
    end
end