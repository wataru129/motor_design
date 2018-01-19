seikiten_add_temp_so=[];
seikiten_add_temp_so=[];
samp_kazu_add_kyori=[];                                            %疎な領域を判定するための距離の箱
for i=1:samp_kazu_add_so                                           %疎な領域判定のサンプル点
    for k=1:dimension
        seikiten_add_temp_so(i,k)=(-1) + (1-(-1)).*rand();
    end
end
for J=1:samp_kazu_add_so                                                  %既存サンプル点との距離判定
    for i=1:samp_kazu
        kyori=sqrt(sum((seikiten_add_temp_so(J,:)-seikiten(i,:)).*2));
        samp_kyori(J,1)=samp_kyori(J,1)+kyori;
    end

    for i=1:size(seikiten_add_temp,1)

        size(seikiten_add_temp,1);
        kyori=sqrt(sum((seikiten_add_temp_so(J,:)-seikiten_add_temp(i,:)).*2));

        samp_kyori(J,1)=samp_kyori(J,1)+kyori;
    end
end

[samp_kyori_max bango]=max(samp_kyori);
so_ten=seikiten_add_temp_so(bango,:);                                          %疎な領域の一点
seikiten_add_temp(so,:)=so_ten;
so=so+1;