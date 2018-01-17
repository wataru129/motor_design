%global  cur_sample_num sample_point
%%%%%%%%%%%%%%% Initialization %%%%%%%%%%%%%%%
%////////////// Integration ////////////////
sample_point   = []; % This is vector of sample point
sample_val     = []; % The value of sample point
add_point      = []; % This is vector of sample point
add_val        = []; % The value of sample point
best_val       = []; % Best value in all sample point
best_num       = []; % The index of best
C              = 1;  % The count of additional sample point
up_status      = ones(clusta,1); % Which case of Update or NOT Update
cur_sample_num = ini_sample_num; %The number of current sample point
C_total        = ceil((max_sample_num-ini_sample_num) ...
                                /add_sample_num);
case_box       = zeros(C_total,1); % Which case of additional point
result_pso     = zeros(dimension,clusta,C_total); % The value of APSO
Cr             = ones(clusta)*1;   %Concentrated Search parameter
%%%%%%%%%%%%%%% Finish initialization %%%%%%%%%%%%%%%