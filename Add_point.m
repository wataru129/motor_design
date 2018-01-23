%^------------- サンプル点追加ファイル ---------------------------------
seikiten_add = zeros(sanp_kazu_add,dimension,clusta);
samp_ten_add = zeros(sanp_kazu_add,dimension,clusta);
%%%%%%%%%%%%%%%%%%%%サンプル点追加開始%%%%%%%%%%%%%%%%%%%%%%
N_sparse=floor((1-(C/C_total)).*per_clusta+0.5); %疎な領域に追加するサンプル点数
if N_sparse == per_clusta
    N_sparse = per_clusta - 1;
end
if  N_sparse < 0
    N_sparse = 0;
end
N_superior = per_clusta-N_sparse-1;                 % 解周辺に配置する点数
for c_index = 1:clusta
    add_temp   = [];    %Init temporary adds point
    add_temp_b = [];    %Init temporary add point near best
    add_temp_p = [];    %Init temporary add point near pso
    Arx        = zeros(dimension,1);
    so         = 1;
    for J=1:dimension                                  %Arxの計算
        Arx(J)=((1-(-1))/2).*(1-(CL(c_index)/(C_total+1)));
    end
    if update_flag(c_index)==1;                               % 解が更新された場合
%%%%%%%%%%%%%%%%%%%%%%最良解が更新された場合%%%%%%%%%%%%%%%%%%%%
        add_temp_b = Neighborhood(N_superior,seikiten_best(c_index,:),Arx,dimension);
        CL(c_index)       = CL(c_index)+1;
    else
%%%%%%%%%%%%%%%%%%%%%% 最良解が更新されなかった場合開始 %%%%%%%%%%%%%%%%%%%%
        kyori_pb = sqrt(sum((x_pso(c_index,:)-seikiten_best(c_index,:)).^2,2));    %x_psoとxbestの距離計算
        Arx_pb   = sum(Arx);                                 %Arxの距離
        if Arx_pb>=kyori_pb
            add_temp_b  = Neighborhood(N_superior,seikiten_best(c_index),Arx,dimension);
            CL(c_index) = CL(c_index)+1;
        else      %%%%%%%%%%%%  Arx_pb < kyori_pb %%%%%%
            add_temp_b = Neighborhood(floor(N_superior/2),seikiten_best(c_index,:),Arx,dimension);
            add_temp_p = Neighborhood(N_superior-floor(N_superior/2),x_pso(c_index,:),Arx,dimension);
        end
        %%%%%%%%%%%%%%%%%%%%%% 最良解が更新されなかった場合終了 %%%%%%%%%%%%%%%%%%%%
    end
    %    ////////////// 疎な領域に撒く ///////////////////////
    if N_sparse~=0
        Sparse_area
    end
    %    ////////////// 疎な領域に撒く ///////////////////////
    seikiten_add(:,:,c_index) = [add_temp_b;add_temp_p;add_temp];
end
%%%%%%%%%%%% 追加サンプル点判定 範囲外なら端点に戻す %%%%%%%%%%%%%%%%%%%
seikiten_add(seikiten_add > 1)  = 1;
seikiten_add(seikiten_add < -1) = -1;
for c_index = 1:clusta
    for i=1:samp_kazu_add                  %追加サンプル点設定
        for j=1:dimension
            samp_ten_add(i,j,c_index) = (p_max(j)+p_min(j))./2+((p_max(j)-p_min(j))./2).*seikiten_add(i,j);
        end
    end
end
samp_ten_add(samp_ten_add<0.05 & samp_ten_add>0)  = 0.1;
samp_ten_add(samp_ten_add<0 & samp_ten_add>-0.05) = -0.1;
C=C+1
%samp_ten                                          = [samp_ten;samp_ten_add];      %サンプル点の追加
%seikiten1                       = [seikiten1;seikiten_add];
%seikiten                        = [seikiten;seikiten_add];
%%%%%%%%%%%% 追加サンプル点判定 範囲外なら端点に戻す %%%%%%%%%%%%%%%%%%%