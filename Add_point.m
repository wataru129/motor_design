%^------------- �T���v���_�ǉ��t�@�C�� ---------------------------------
seikiten_add = zeros(sanp_kazu_add,dimension,clusta);
samp_ten_add = zeros(sanp_kazu_add,dimension,clusta);
%%%%%%%%%%%%%%%%%%%%�T���v���_�ǉ��J�n%%%%%%%%%%%%%%%%%%%%%%
N_sparse=floor((1-(C/C_total)).*per_clusta+0.5); %�a�ȗ̈�ɒǉ�����T���v���_��
if N_sparse == per_clusta
    N_sparse = per_clusta - 1;
end
if  N_sparse < 0
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
    if update_flag(c_index)==1;                               % �����X�V���ꂽ�ꍇ
%%%%%%%%%%%%%%%%%%%%%%�ŗǉ����X�V���ꂽ�ꍇ%%%%%%%%%%%%%%%%%%%%
        add_temp_b = Neighborhood(N_superior,seikiten_best(c_index,:),Arx,dimension);
        CL(c_index)       = CL(c_index)+1;
    else
%%%%%%%%%%%%%%%%%%%%%% �ŗǉ����X�V����Ȃ������ꍇ�J�n %%%%%%%%%%%%%%%%%%%%
        kyori_pb = sqrt(sum((x_pso(c_index,:)-seikiten_best(c_index,:)).^2,2));    %x_pso��xbest�̋����v�Z
        Arx_pb   = sum(Arx);                                 %Arx�̋���
        if Arx_pb>=kyori_pb
            add_temp_b  = Neighborhood(N_superior,seikiten_best(c_index),Arx,dimension);
            CL(c_index) = CL(c_index)+1;
        else      %%%%%%%%%%%%  Arx_pb < kyori_pb %%%%%%
            add_temp_b = Neighborhood(floor(N_superior/2),seikiten_best(c_index,:),Arx,dimension);
            add_temp_p = Neighborhood(N_superior-floor(N_superior/2),x_pso(c_index,:),Arx,dimension);
        end
        %%%%%%%%%%%%%%%%%%%%%% �ŗǉ����X�V����Ȃ������ꍇ�I�� %%%%%%%%%%%%%%%%%%%%
    end
    %    ////////////// �a�ȗ̈�ɎT�� ///////////////////////
    if N_sparse~=0
        Sparse_area
    end
    %    ////////////// �a�ȗ̈�ɎT�� ///////////////////////
    seikiten_add(:,:,c_index) = [add_temp_b;add_temp_p;add_temp];
end
%%%%%%%%%%%% �ǉ��T���v���_���� �͈͊O�Ȃ�[�_�ɖ߂� %%%%%%%%%%%%%%%%%%%
seikiten_add(seikiten_add > 1)  = 1;
seikiten_add(seikiten_add < -1) = -1;
for c_index = 1:clusta
    for i=1:samp_kazu_add                  %�ǉ��T���v���_�ݒ�
        for j=1:dimension
            samp_ten_add(i,j,c_index) = (p_max(j)+p_min(j))./2+((p_max(j)-p_min(j))./2).*seikiten_add(i,j);
        end
    end
end
samp_ten_add(samp_ten_add<0.05 & samp_ten_add>0)  = 0.1;
samp_ten_add(samp_ten_add<0 & samp_ten_add>-0.05) = -0.1;
C=C+1
%samp_ten                                          = [samp_ten;samp_ten_add];      %�T���v���_�̒ǉ�
%seikiten1                       = [seikiten1;seikiten_add];
%seikiten                        = [seikiten;seikiten_add];
%%%%%%%%%%%% �ǉ��T���v���_���� �͈͊O�Ȃ�[�_�ɖ߂� %%%%%%%%%%%%%%%%%%%