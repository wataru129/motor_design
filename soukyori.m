candidate           = [];
sample_distance_max = [];
total_point         = [];
sample_distance     = zeros(sparse_rand_num,1);
total_point         = [sample_pointl;add_temp];

candidate = -1 + (1 - (-1))*rand(samp_kazu_add_so,dimension);

for J=1:samp_kazu_add_so
    candidate_ex    = repelem(candidate(J,:) ,samp_kazu+size(add_temp,2),1);
    sample_distance(J) = sum(sqrt(sum((candidate_ex-total_point).*2,2)));
end

[sample_distance_max bango] = max(sample_distance);
add_temp(so,:)              = candidate(bango,:);
so                          = so+1;