
%    ---------- �p�����[�^�ݒ�J�n --------------   %
samp_hyoukati_max=max(samp_hyoukati);
samp_seiyakuti_max=max(samp_seiyakuti);      %%%

for h=1:samp_kazu
    y_rbf(h,1)  = samp_hyoukati(h,1)-samp_hyoukati_max;
    y_rbf2(h,1) = samp_seiyakuti(h,1)-samp_seiyakuti_max;  %%%

end
%   ----------- �p�����[�^�ݒ�̏I�� ---------------   %
H=zeros(samp_kazu,samp_kazu);                     % H�s��̏�����

%fprintf('******* RBFN�J�n *******************\n')
%  ---------------�T���v���_�ԍő勗���̌v�Z�J�n-------------- %
d_max=0;                                                        %�T���v���_�Ԃ̍ő勗���̏�����
samp_kyori=0;                                                 %�T���v���_�Ԃ̊e�����̍s��̏�����
d_max2=0;
samp_kyori2=0;

for j=1:samp_kazu-1
    for j1=j+1:samp_kazu
        samp_kyori(j1-1,j)=sum((seikiten(j,:)-seikiten(j1,:)).^2);
    end
end
samp_kyori;                                                      %�T���v���_���m�̋����̏W��
d_max=sqrt(max(max((samp_kyori))));                %�T���v���_�Ԃ̍ő勗��

%  ------------- �T���v���_�ԍő勗���̌v�Z�I��----------- %

%  ------------- ���֐����a���̌v�Z�J�n          ----------- %
if dimension==2
    r=d_max/(sqrt(samp_kazu*dimension)^(1/dimension));
else
    r=d_max/(sqrt(dimension)*(sqrt(samp_kazu)^(1/dimension)));
end
if r==0
    r=0.5;
end
% ---------------- ���֐����a���̌v�Z�I�� ---------------  %

% ---------------- ���֐��v�Z�J�n          ----------------  %
for j=1:samp_kazu
    for j1=1:samp_kazu
        H(j,j1)=sum((seikiten(j,:)-seikiten(j1,:)).^2);
        H(j,j1)=exp(-H(j,j1)/(r.^2));
    end
end
%   ----------------- ���֐��v�Z�I�� ------------------  %

%  ---------------- �ւ̌v�Z�J�n  -----------------  %
ramuda=10.^(-2);                                               %�����_�̐ݒ�
G_ramuda=ramuda.*eye(samp_kazu,samp_kazu);                     %�����_�̍s��
A=H'*H+G_ramuda;
omega=inv(A)*H'*y_rbf;                                            %�d�ݒl�ւ̐ݒ�
omega2=inv(A)*H'*y_rbf2;
%  ---------------- �ւ̌v�Z�I�� -------------------  %

%  ---------------- �o�͊֐�O(x)  -----------------  %

%fprintf('******* RBFN�I�� *******************\n')