%^------------- �T���v���_�ǉ��t�@�C�� ---------------------------------
seikiten_add=[];                                    %�ǉ��T���v���_�̏�����
seikiten_add_temp=[];                               %��Ɨp�T���v���_�̏�����
%%%%%%%%%%%%%%%%%%%%�T���v���_�ǉ��J�n%%%%%%%%%%%%%%%%%%%%%%
N_sparse=floor((1-(C/C_total)).*samp_kazu_add+0.5); %�a�ȗ̈�ɒǉ�����T���v���_��
if N_sparse==10
    N_sparse=9;
end
if  N_sparse < 0
    N_sparse = 0;
end
N_superior=samp_kazu_add-N_sparse-1;                 % �����ӂɔz�u����_��

for c_index = 1:clusta
    if update_flag(c_index)==1;                               % �����X�V���ꂽ�ꍇ
%%%%%%%%%%%%%%%%%%%%%%�ŗǉ����X�V���ꂽ�ꍇ%%%%%%%%%%%%%%%%%%%%
        for J=1:dimension                                  %Arx�̌v�Z
            Arx(J,c_index)=((1-(-1))/2).*(1-(CL/(C_total+1)));
        end
        seikiten_add_temp = [];
        seikiten_add_temp = Neighborhood(N_superior,seikiten_best,Area_x,dimension,c_index);
        seikiten_add      = [seikiten_add;seikiten_add_temp];
        seikiten_add_temp = [];
        %    ////////////// �a�ȗ̈�ɎT�� ///////////////////////
        samp_kyori        = zeros(samp_kazu_add_so,1);
        so=1;
        if N_sparse~=0
            Sparse_area
        end
        %    ////////////// �a�ȗ̈�ɎT�� ///////////////////////
        seikiten_add      = [seikiten_add;seikiten_add_temp;x_pso];
        seikiten_add_temp = [];
        CL(c_index)       = CL(c_index)+1;
    else
%%%%%%%%%%%%%%%%%%%%%% �ŗǉ����X�V����Ȃ������ꍇ�J�n %%%%%%%%%%%%%%%%%%%%
        for J=1:dimension
            Arx(J,c_index)=((1-(-1))/2)*(1-(CL/(C_total+1)));  %Arx�����߂�
        end
        kyori_pb = sqrt(sum((x_pso(c_index,:)-seikiten_best).^2,2));    %x_pso��xbest�̋����v�Z
        Arx_pb   = sum(Arx(:,c_index));                                 %Arx�̋���
        if Arx_pb>=kyori_pb
            seikiten_add_temp = [];
            seikiten_add_temp = Neighborhood(N_superior,seikiten_best,Area_x,dimension,c_index);
            seikiten_add      = [seikiten_add;seikiten_add_temp];
            seikiten_add_temp = [];
            %  ////////////// �a�ȗ̈�ɎT�� ///////////////////////
            samp_kyori=zeros(samp_kazu_add_so,1);
            so=1;
            if N_sparse~=0
                Sparse_area
                seikiten_add      = [seikiten_add;seikiten_add_temp];
                seikiten_add_temp = [];
            end
            %  ////////////// �a�ȗ̈�ɎT�� ///////////////////////
            seikiten_add      = [seikiten_add;x_pso];
            CL(c_index)       = CL(c_index)+1;
        else      %%%%%%%%%%%%  Arx_pb < kyori_pb %%%%%%
            seikiten_add_temp     = [];
            seikiten_add_temp     = Neighborhood(floor(N_superior/2),seikiten_best,Area_x,dimension,c_index);
            seikiten_add          = [seikiten_add;seikiten_add_temp];
            seikiten_add_temp_pso = [];
            seikiten_add_temp_pso = Neighborhood(N_superior-floor(N_superior/2),x_pso,Area_x,dimension,c_index);
            seikiten_add          = [seikiten_add;seikiten_add_temp_pso];
            seikiten_add_temp_pso = [];
            samp_kyori            = zeros(samp_kazu_add_so,1);
            so                    = 1;
         %  ////////////// �a�ȗ̈�ɎT�� ///////////////////////
            if N_sparse~=0
                seikiten_add_temp = [];
                Sparse_area
                seikiten_add      = [seikiten_add;seikiten_add_temp];
                seikiten_add_temp = [];
            end
        %  ////////////// �a�ȗ̈�ɎT�� ///////////////////////
            seikiten_add          = [seikiten_add;x_pso];
        end
        %%%%%%%%%%%%%%%%%%%%%% �ŗǉ����X�V����Ȃ������ꍇ�I�� %%%%%%%%%%%%%%%%%%%%
    end
%%%%%%%%%%%% �ǉ��T���v���_���� �͈͊O�Ȃ�[�_�ɖ߂� %%%%%%%%%%%%%%%%%%%
    seikiten_add(seikiten_add > 1)  = 1;
    seikiten_add(seikiten_add < -1) = -1;
    seikiten1                       = [seikiten1;seikiten_add];
    seikiten                        = [seikiten;seikiten_add];
    for i=1:samp_kazu_add                  %�ǉ��T���v���_�ݒ�
        for j=1:dimension
            samp_ten_add(i,j) = (p_max(j)+p_min(j))./2+((p_max(j)-p_min(j))./2).*seikiten_add(i,j);
        end
    end
    samp_ten_add(samp_ten_add<0.05 & samp_ten_add>0)  = 0.1;
    samp_ten_add(samp_ten_add<0 & samp_ten_add>-0.05) = -0.1;
    samp_ten                                          = [samp_ten;samp_ten_add];      %�T���v���_�̒ǉ�
    %%%%%%%%%%%% �ǉ��T���v���_���� �͈͊O�Ȃ�[�_�ɖ߂� %%%%%%%%%%%%%%%%%%%
end