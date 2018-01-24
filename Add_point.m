%------------- �T���v���_�ǉ��t�@�C�� ---------------------------------
seikiten_add = zeros(per_clusta,dimension,clusta);
samp_ten_add = zeros(per_clusta,dimension,clusta);
N_sparse     = floor((1-(C/C_total)).*per_clusta+0.5); %�a�ȗ̈�
if N_sparse == per_clusta
    N_sparse = per_clusta - 1;
elseif  N_sparse < 0
    N_sparse = 0;
end
N_superior = per_clusta-N_sparse-1;                 % �����ӂɔz�u����_��
for c_index = 1:clusta
    add_temp   = [];    %Init temporary adds point
    add_temp_b = [];    %Init temporary add point near best
    add_temp_p = [];    %Init temporary add point near pso
    Arx        = zeros(dimension,1);
    so         = 1;
    for J=1:dimension                                  %Arx�̌v�Z
        Arx(J)=((1-(-1))/2).*(1-(CL(c_index)/(C_total+1)));
    end
    if update_flag(c_index)==1; % �����X�V���ꂽ�ꍇ
    %%%%%%%%%%%%%%%%%%%%%%�ŗǉ����X�V���ꂽ�ꍇ%%%%%%%%%%%%%%%%%%%%
        add_temp_b = Neighborhood(N_superior,seikiten_best(c_index,:),Arx,dimension);
        CL(c_index)       = CL(c_index)+1;
    else
    %%%%%%%%%%%%%%%%%%%%%% �ŗǉ����X�V����Ȃ������ꍇ %%%%%%%%%%%%%%%%%%%%
        kyori_pb = sqrt(sum((x_pso(c_index,:)-seikiten_best(c_index,:)).^2,2)); %x_pso��xbest�̋����v�Z
        Arx_pb   = sum(Arx);                                                    %Arx�̋���
        if Arx_pb>=kyori_pb
            add_temp_b  = Neighborhood(N_superior,seikiten_best(c_index,:),Arx,dimension);
            CL(c_index) = CL(c_index)+1;
        else
            add_temp_b = Neighborhood(floor(N_superior/2),seikiten_best(c_index,:),Arx,dimension);
            add_temp_p = Neighborhood(N_superior-floor(N_superior/2),x_pso(c_index,:),Arx,dimension);
        end
    end
    if N_sparse~=0
    %////////////// �a�ȗ̈�ɎT�� ///////////////////////
        Sparse_area
    end
    seikiten_add(:,:,c_index) = [add_temp_b;add_temp_p;add_temp;x_pso(c_index,:)];
end
seikiten_add(seikiten_add > 1)  = 1;
seikiten_add(seikiten_add < -1) = -1;
for c_index = 1:clusta
    for i = 1:per_clusta
        samp_ten_add(i,:,c_index) = ((p_max+p_min)./2 ...
            +((p_max - p_min)./2)).'.*seikiten_add(i,:,c_index);
    end
end
samp_ten_add(samp_ten_add<0.05 & samp_ten_add>0)  = 0.1;
samp_ten_add(samp_ten_add<0 & samp_ten_add>-0.05) = -0.1;
C=C+1