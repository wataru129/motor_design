clear
tic %�^�C�}�[�X�^�[�g
fprintf('**** �����I�œK��START ******************************************\n')
rr = 5;                                            % ����W��
NN = 9;                                            % �]���_��
e  = 1;                                            % e:�����l�z��̂R������
%%%%%%%%%%%%%%%%%%%%%%�p�����[�^�ݒ�J�n%%%%%%%%%%%%%%%%%%%%%%%
mokusui       = 130.0;
SEIYAKU       = 2000;
clusta        = 5;
dimension     = 14;                                %������
samp_syoki    = 10;                                %�����T���v���_��30
per_clusta    = 10;                                %1�N���X�^������̒ǉ��T���v���_��
samp_kazu_add = per_clusta * clusta;               %�ǉ��T���v���_��
samp_kazu_max = 20;                                %�ő�T���v���_��600-1200
CL            = 1;                                 %�W���I�T���̓x��
C1            = 1;                                 %C1=1;�{��C1= 2; test
update_flag   = ones(c_index,1);                   %�ŗǉ��X�V�t���O������
update_flag2  = zeros(c_index,1);
C_total       = ceil((samp_kazu_max-samp_kazu) ...
                                  /samp_kazu_add); %�T���v���_����ǉ����鑍��
%%%%%%%%%%%%%%%%%%%%% �p�����[�^�ݒ�̏I�� %%%%%%%%%%%%%%%%%%%%%%%%%
Initialization
Hanni2               % �T���v���_�̑��ݔ͈͐ݒ�
Create_initial_point % �����T���v���_����+�����]���l�v�Z�I��
%%%%%%%%%%%%%%%%%%%%%%%%%%% ���C���v���O�����X�^�[�g %%%%%%%%%%%%%%%%%
while samp_kazu_max > samp_kazu
    RBFN2                    %�����ǖʖ@
    APSO_kmeans_xclusta      %PSO�K��+����
%    guraph4
    Add_point
    Evaluate
end
%%%%%%%%%%%%%%%%%% �ǉ��T���v���_�̕]���l %%%%%%%%%%%%%%%
T=toc;
fprintf('�v�Z���Ԃ�%0.2f���Ԃł�\n',T/3600)
%{
h_samp_ten_best(e,:)        = samp_ten_best                 %�x�X�g���̓_
h_hyoukati_best(e)          = hyoukati_best                   %�x�X�g���̕]���l
h_samp_hyouka_best_suii(:,e)= samp_hyouka_best_suii
samp_su
if C1==1
    samp_kazu=1;
    samp_kazu_add = 1;
    samp_ten_add =samp_ten_best;
    hyouka150105e
end
samp_kazu_max = samp_kazu_max
u=0;
%}
%%%%%%%%%%%%%%%%%% �ǉ��T���v���_�̕]���l�v�Z %%%%%%%%%%%%%%%
save
fprintf('**** �����I�œK��STOP ******************************************\n')