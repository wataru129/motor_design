seikiten_add_temp_so=[];
seikiten_add_temp_so=[];
samp_kazu_add_kyori=[];                                            %�a�ȗ̈�𔻒肷�邽�߂̋����̔�
for i=1:samp_kazu_add_so                                           %�a�ȗ̈攻��̃T���v���_
    for k=1:dimension
        seikiten_add_temp_so(i,k)=(-1) + (1-(-1)).*rand();
    end
end
for J=1:samp_kazu_add_so                                                  %�����T���v���_�Ƃ̋�������
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
so_ten=seikiten_add_temp_so(bango,:);                                          %�a�ȗ̈�̈�_
seikiten_add_temp(so,:)=so_ten;
so=so+1;