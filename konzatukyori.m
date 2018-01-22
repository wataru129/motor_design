seikiten_add_temp_c=[];
seikiten_add_temp_so=[];
samp_kazu_add_kyori=[];                      %‘a‚È—Ìˆæ‚ð”»’è‚·‚é‚½‚ß‚Ì‹——£‚Ì” 
seikiten_ex=seikiten;
seikiten_ex=[seikiten_ex;seikiten_add_temp];
sort_seikiten=sort(seikiten_ex,1);
for J2=1:size(seikiten_ex,1)-1
    for J3=1:dimension
        seikiten_add_temp_c(J2,J3)=abs(sort_seikiten(J2+1,J3)-sort_seikiten(J2,J3));
    end
end
[samp_kyori_max bango] = max(seikiten_add_temp_c);
for J3=1:dimension
    so_ten(1,J3)=sort_seikiten(bango(1,J3),J3)+samp_kyori_max(1,J3)./2;  %‘a‚È—Ìˆæ‚Ìˆê“_
end
seikiten_add_temp(so,:)=so_ten;
so=so+1;