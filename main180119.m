clear
tic %�^�C�}�[�X�^�[�g
global r R dimension samp_kazu h ra
fprintf('**** �����I�œK��START ******************************************\n')
load syoki_x(1)
syokiten      = P_X;
clear syoki_x(1)
heikin        = 0;
e_samp_ten    = [];
rr            = 5;             % ����W��
NN            = 9;             % �]���_��
X             = zeros(1,14);   % �ϐ�
e             = 1;             % e:�����l�z��̂R������
%%%%%%%%%%%%%%%%%%%%%%�p�����[�^�ݒ�J�n%%%%%%%%%%%%%%%%%%%%%%%
mokusui       = 130.0;
SEIYAKU       = 2000;
clusta        = 5;
dimension     = 14;            %������
samp_syoki    = 10;            %�����T���v���_��30
per_clusta    = 10;
samp_kazu_add = per_clusta * clusta;
samp_kazu_max = 20;            %�ő�T���v���_��600-1200
CL            = 1;             %�W���I�T���̓x��
C1            = 1;             %C1=1;�{��C1= 2; test
update_flag   = [];            %�ŗǉ��X�V�t���O������
update_flag   = ones(clusta,1);
update_flag2  = zeros(clusta,1);
h_houhou      = 3;             %1���P�����v,2���d�݂Â�,3���ڕW�Ȑ�
C_total       = ceil((samp_kazu_max-samp_kazu)/samp_kazu_add); %�T���v���_����ǉ����鑍��

Initialization
%%%%%%%%%%%%%%%%%%%%% �p�����[�^�ݒ�̏I�� %%%%%%%%%%%%%%%%%%%%%%%%%
% ---------------- �T���v���_�̑��ݔ͈͐ݒ� -----------------
if C1 == 1
    Hanni2
elseif C1 == 2
    SEIYAKU = 5;
    ra      = 3; % ra:�x���`�}�[�N�̖��ԍ�
    hanni
end
%------------------------ �T���v���_�̑��ݔ͈͐ݒ�I�� -----------------
Add_syoki
Evaluate
C = C + 1
% ------------ �����T���v���_����+�����]���l�v�Z�I�� -----------------
%%%%%%%%%%%%%%%%%%%%%%%%%%% ���C���v���O�����X�^�[�g %%%%%%%%%%%%%%%%%
while samp_kazu_max > samp_kazu
    RBFN2                    %�����ǖʖ@
    PSO3b                     %PSO�K��+����
    guraph4
    Sample_add4
    Evaluate
    Update
    C = C + 1
end
%%%%%%%%%%%%%%%%%% �ǉ��T���v���_�̕]���l %%%%%%%%%%%%%%%
T = toc;
fprintf('�v�Z���Ԃ�%0.2f���Ԃł�\n',T/3600)
samp_kazu                                           %�U�z������
size(samp_ten)                                       %�U�z�������������Ă��邩�̌���
h_samp_ten_best(e,:)         = samp_ten_best         %�x�X�g���̓_
h_hyoukati_best(e)           = hyoukati_best         %�x�X�g���̕]���l
h_samp_hyouka_best_suii(:,e) = samp_hyouka_best_suii
samp_su
if C1 == 1
    samp_kazu     = 1;
    samp_kazu_add = 1;
    samp_ten_add  = samp_ten_best;
    hyouka150     = Do_jmag(X,f_number,count,samp_su,E,NN)
end
samp_kazu_max     = samp_kazu_max
u                 = 0;
%%%%%%%%%%%%%%%%%% �ǉ��T���v���_�̕]���l�v�Z %%%%%%%%%%%%%%%
save
fprintf('**** �����I�œK��STOP ******************************************\n')