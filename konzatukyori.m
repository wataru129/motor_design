seikiten_ex          = [];
sort_seikiten        = [];
seikiten_ex          = [seikiten ; add_temp];
sort_seikiten        = sort(seikiten_ex,1);
seikiten_add_temp_c  = zeros(size(seikiten_ex,1),dimension);
for J2=1:size(seikiten_ex,1)-1
    for J3=1:dimension
        seikiten_add_temp_c(J2,J3)=abs(sort_seikiten(J2+1,J3)-sort_seikiten(J2,J3));
    end
end
[samp_kyori_max bango] = max(seikiten_add_temp_c);
for J3=1:dimension
    so_ten(1,J3) = sort_seikiten(bango(1,J3),J3)+samp_kyori_max(1,J3)./2;  %‘a‚È—Ìˆæ‚Ìˆê“_
end
add_temp(so,:) = so_ten;
so                      = so+1;