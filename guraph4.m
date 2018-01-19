
XX=-1:0.05:1; YY=-1:0.05:1;                                %ベンチマーク範囲設定
[x y]=meshgrid(XX,YY);                                   %同じ行または列の正方行列の作成
z=zeros(length(x),length(y));                            %zの初期化
for i=1:length(x)
    for j=1:length(y)
        for k=1:samp_kazu
            z(i,j)=z(i,j)+omega(k,1)*exp(-((x(i,j)-seikiten(k,1))^2+(y(i,j)-seikiten(k,2))^2)/(r^2));
        end
        z(i,j)=z(i,j)+samp_hyoukati_max;
    end
end
% subplot(2,2,1); mesh(x,y,z);
hidden off
x=seikiten(:,1);
y=seikiten(:,2);
z=samp_hyoukati;
hold on
%plot3(x,y,z,'.','MarkerSize',10)
view(125, 50)
xlabel('x1');ylabel('x2');zlabel('f(x)');
hold off

XX=-1:0.05:1; YY=-1:0.05:1;                                %ベンチマーク範囲設定
[x y]=meshgrid(XX,YY);                                   %同じ行または列の正方行列の作成
z=zeros(length(x),length(y));                            %zの初期化
for i=1:length(x)
    for j=1:length(y)
        for k=1:samp_kazu
            z(i,j)=z(i,j)+omega2(k,1)*exp(-((x(i,j)-seikiten(k,1))^2+(y(i,j)-seikiten(k,2))^2)/(r^2));
        end
        z(i,j)=z(i,j)+samp_seiyakuti_max;
    end
end
subplot(2,2,1); mesh(x,y,z);
hidden off
x=seikiten_add(:,1);
y=seikiten_add(:,2);
z=samp_add_seiyakuti;
hold on
plot3(x,y,z,'.','MarkerSize',10)
view(125, 50)
xlabel('x1');ylabel('x2');zlabel('g(x)');
hold off

XX=-1:0.05:1; YY=-1:0.05:1;                                %ベンチマーク範囲設定
[x y]=meshgrid(XX,YY);                                   %同じ行または列の正方行列の作成
z2=zeros(length(x),length(y));                            %zの初期化
for i=1:length(x)
    for j=1:length(y)
        for k=1:samp_kazu
            z2(i,j)=z2(i,j)+omega2(k,1)*exp(-((x(i,j)-seikiten(k,1))^2+(y(i,j)-seikiten(k,2))^2)/(r^2));
        end
        z2(i,j)=z2(i,j)+samp_seiyakuti_max;
    end
end
z=zeros(length(x),length(y)); 
for i=1:length(x)
    for j=1:length(y)
        for k=1:samp_kazu
            z(i,j)=0; %z(i,j)+omega(k,1)*exp(-((x(i,j)-seikiten(k,1))^2+(y(i,j)-seikiten(k,2))^2)/(r^2));
        end
  %      z(i,j)=z(i,j)+samp_hyoukati_max+rr*(max((-SEIYAKU-z2(i,j)),0)).^2;
        z(i,j)=z(i,j)+20*(max((-SEIYAKU-z2(i,j)),0)).^2;
 %       z(i,j)=z2(i,j);
    end
end
subplot(2,2,2); mesh(x,y,z);
hidden off
x=seikiten_add(:,1);
y=seikiten_add(:,2);
z=samp_add_hyoukati;
hold on
%plot3(x,y,z,'.','MarkerSize',10)
view(125, 35)
xlabel('x1');ylabel('x2');zlabel('f(x)');
hold off


XX=-1:0.05:1; YY=-1:0.05:1;                                %ベンチマーク範囲設定
[x y]=meshgrid(XX,YY);                                   %同じ行または列の正方行列の作成
z2=zeros(length(x),length(y));                            %zの初期化
for i=1:length(x)
    for j=1:length(y)
        for k=1:samp_kazu
            z2(i,j)=z2(i,j)+omega2(k,1)*exp(-((x(i,j)-seikiten(k,1))^2+(y(i,j)-seikiten(k,2))^2)/(r^2));
        end
        z2(i,j)=z2(i,j)+samp_seiyakuti_max;
    end
end
z=zeros(length(x),length(y)); 
for i=1:length(x)
    for j=1:length(y)
        for k=1:samp_kazu
            z(i,j)=z(i,j)+omega(k,1)*exp(-((x(i,j)-seikiten(k,1))^2+(y(i,j)-seikiten(k,2))^2)/(r^2));
        end
 %       z(i,j)=z(i,j)+samp_hyoukati_max;
        z(i,j)=z(i,j)+samp_hyoukati_max+20*(max((-SEIYAKU-z2(i,j)),0)).^2;
 %      z(i,j)=z(i,j)+(max((-SEIYAKU-z2(i,j)),0)).^2;
 %       z(i,j)=z2(i,j);
    end
end
subplot(2,2,3); mesh(x,y,z);
hidden off
% x=seikiten_add(:,1);
% y=seikiten_add(:,2);
% z=samp_add_hyoukati;

hidden off
x=seikiten(:,1);
y=seikiten(:,2);
z=samp_hyoukati;
hold on
plot3(x,y,z,'.','MarkerSize',10)
view(125, 35)
xlabel('x1');ylabel('x2');zlabel('f(x)');
hold off

subplot(2,2,4); semilogy(samp_hyouka2_best_suii,'DisplayName','samp_hyouka2_best_suii','YDataSource','samp_hyouka2_best_suii');figure(gcf)
