function [hyoukati,seiyakuti,count,samp_su] = Do_jmag(X,f_number,count,samp_su,E,NN)
    FF=0;
    F = zeros(1,NN);
    G = zeros(1,NN);
    var=fopen('C:\k2\variable.var','wt');     %Jmagの変数ファイル作成
    for n=1:dimension
        st=sprintf('X%d %d\n',n,X(n));
        fwrite(var,st);
    end
    fclose(var);
    !JMAG C:\k2\14変数20150105a.jsc
     %↑Jmagを起動させ、結果を保存させるスクリプト
    [num,text,all]=xlsread('C:\k2\推力14a.xls');   %結果を保存したエクセルを開く
    for k=1:NN
        F(k)=num(6+k);
    end
    [num,text,all]=xlsread('C:\k2\吸引力14a.xls');
    for k=1:NN
        G(k)=num(6+k);
        FF = FF + ((E(k)-F(k))^2);
    end
    GF        = max(G);
    hyoukati  = FF
    seiyakuti = GF
    samp_su   = samp_su+1;
    count     =count+1
end
