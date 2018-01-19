for J1=1:iteration
%Add point by 2 method
    soukyori
    %End determination of Sprinkle a point in sparse area
    if sp_count == N_sparse
        break
    end
    soukyori
    %End determination of Sprinkle a point in sparse area
    if sp_count == N_sparse
        break
    end
    konzatukyori
    %End determination of Sprinkle a point in sparse area
    if sp_count == N_sparse
        break
    end
end
%size(add_point)
add_point=[add_point add_point_temp x_pso];