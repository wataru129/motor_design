%�T���v���_�̕]���l�v�Z for 14�ϐ� M,G,X3,X4
% hyouka9b mokusui=130�|180

for i=1:samp_kazu_add

%'''�X�e�[�^�̕ϐ�'''
  X(1)=8.8;    %'�M���b�v�� 
  X(2)=40.0;   %'�i�v���Ή��̒���
  X(3)=2.5;    %'1�_��X
  X(4)=1.25;   %'1�_��y
  X(5)=1.0;    %'2�_��Y
  X(6)=2.5;    %'3�_��x
  X(7)=1.25;   %'3�_��y
  X(8)=0.5;    %'4�_��x����
  X(9)=0.5;    %'4�_��y����

 %'''���[�o'''
  X(10)=2.0;   %'���Β[�̌���;
  X(11)=0.5;  %'���ʂ̈ʒu�̊���
  X(12)=7.0;  %'���ʂ̌���
  X(13)=0.5;  %'���ʂ̈ʒu�̊���
  X(14)=0.5;  %'���ʂ̌�������

%''' �ڕW�l
   NN=9;
 for k=1:NN
    E(k)=-mokusui*sin(pi/2/(NN-1)*(NN-k));
%     E(k)=-mokusui;
 end
%   E(NN)=-mokusui*.8;

   X(1)=samp_ten_add(i,1);
   X(2)=samp_ten_add(i,2);
   X(3)=samp_ten_add(i,3);
   X(4)=samp_ten_add(i,4);
   X(5)=samp_ten_add(i,5);
   X(6)=samp_ten_add(i,6);
   X(7)=samp_ten_add(i,7);
   X(8)=samp_ten_add(i,8);
   X(9)=samp_ten_add(i,9);
   X(10)=samp_ten_add(i,10);
   X(11)=samp_ten_add(i,11);
   X(12)=samp_ten_add(i,12);
   X(13)=samp_ten_add(i,13);
   X(14)=samp_ten_add(i,14);

% samp_ten_add

    var=fopen('C:\k2\variable.var','wt');     %Jmag�̕ϐ��t�@�C���쐬
    for n=1:dimension
       st=sprintf('X%d %d\n',n,X(n));
       % st=sprintf('X%d %d\n',n,samp_ten_add(i,n));
        fwrite(var,st);
    end
    fclose(var);
    !JMAG C:\k2\14�ϐ�20150105a.jsc
    %��Jmag���N�������A���ʂ�ۑ�������
    [num,text,all]=xlsread('C:\k2\����14a.xls');   %���ʂ�ۑ������G�N�Z�����J��
    for k=1:NN
        F(k)=num(6+k);
    end
    [num,text,all]=xlsread('C:\k2\�z����14a.xls');
    for k=1:NN
        G(k)=num(6+k);
    end


    if h_houhou==1
       FF=0; GF=0;
      for k=1:NN
     %     FF = FF + F(k);
     %     GF = GF + G(k);
      end
    elseif h_houhou==2

    elseif h_houhou==3
       FF=0;
      for k=1:NN
          FF = FF + ((E(k)-F(k))^2);
      end
          GF = max(G);
    end
    samp_su=samp_su+1;
    samp_add_hyoukati(i,1) = FF
    samp_add_seiyakuti(i,1) = GF
 %   samp_add_seiyakuti(i,1) = rr*(max(-900-GF,0))^2
 %   if samp_add_seiyakuti(i,1)>0
 %       rr =rr*2
 %   end
    count=count+1
end