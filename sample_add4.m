%^------------- サンプル点追加ファイル ---------------------------------
seikiten_add=[];                                    %追加サンプル点の初期化
seikiten_add_temp=[];                               %作業用サンプル点の初期化
%%%%%%%%%%%%%%%%%%%%サンプル点追加開始%%%%%%%%%%%%%%%%%%%%%%
N_sparse=floor((1-(C/C_total)).*samp_kazu_add+0.5); %疎な領域に追加するサンプル点数
if N_sparse==10
    N_sparse=9;
end
if  N_sparse < 0
    N_sparse = 0;
end
N_superior=samp_kazu_add-N_sparse-1;                 % 解周辺に配置する点数

for c_index = 1:clusta
    if update_flag(c_index)==1;                               % 解が更新された場合
%%%%%%%%%%%%%%%%%%%%%%最良解が更新された場合%%%%%%%%%%%%%%%%%%%%
        for J=1:dimension                                  %Arxの計算
            Arx(J,c_index)=((1-(-1))/2).*(1-(CL/(C_total+1)));
        end
        seikiten_add_temp = [];
        seikiten_add_temp = Neighborhood(N_superior,seikiten_best,Area_x,dimension,c_index);
        seikiten_add      = [seikiten_add;seikiten_add_temp];
        seikiten_add_temp = [];
        %    ////////////// 疎な領域に撒く ///////////////////////
        samp_kyori        = zeros(samp_kazu_add_so,1);
        so=1;
        if N_sparse~=0
            Sparse_area
        end
        %    ////////////// 疎な領域に撒く ///////////////////////
        seikiten_add      = [seikiten_add;seikiten_add_temp;x_pso];
        seikiten_add_temp = [];
        CL(c_index)       = CL(c_index)+1;
    else
%%%%%%%%%%%%%%%%%%%%%% 最良解が更新されなかった場合開始 %%%%%%%%%%%%%%%%%%%%
        for J=1:dimension
            Arx(J,c_index)=((1-(-1))/2)*(1-(CL/(C_total+1)));  %Arxを求める
        end
        kyori_pb = sqrt(sum((x_pso(c_index,:)-seikiten_best).^2,2));    %x_psoとxbestの距離計算
        Arx_pb   = sum(Arx(:,c_index));                                 %Arxの距離
        if Arx_pb>=kyori_pb
            seikiten_add_temp = [];
            seikiten_add_temp = Neighborhood(N_superior,seikiten_best,Area_x,dimension,c_index);
            seikiten_add      = [seikiten_add;seikiten_add_temp];
            seikiten_add_temp = [];
            %  ////////////// 疎な領域に撒く ///////////////////////
            samp_kyori=zeros(samp_kazu_add_so,1);
            so=1;
            if N_sparse~=0
                Sparse_area
                seikiten_add      = [seikiten_add;seikiten_add_temp];
                seikiten_add_temp = [];
            end
            %  ////////////// 疎な領域に撒く ///////////////////////
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
         %  ////////////// 疎な領域に撒く ///////////////////////
            if N_sparse~=0
                seikiten_add_temp = [];
                Sparse_area
                seikiten_add      = [seikiten_add;seikiten_add_temp];
                seikiten_add_temp = [];
            end
        %  ////////////// 疎な領域に撒く ///////////////////////
            seikiten_add          = [seikiten_add;x_pso];
        end
        %%%%%%%%%%%%%%%%%%%%%% 最良解が更新されなかった場合終了 %%%%%%%%%%%%%%%%%%%%
    end
%%%%%%%%%%%% 追加サンプル点判定 範囲外なら端点に戻す %%%%%%%%%%%%%%%%%%%
    seikiten_add(seikiten_add > 1)  = 1;
    seikiten_add(seikiten_add < -1) = -1;
    seikiten1                       = [seikiten1;seikiten_add];
    seikiten                        = [seikiten;seikiten_add];
    for i=1:samp_kazu_add                  %追加サンプル点設定
        for j=1:dimension
            samp_ten_add(i,j) = (p_max(j)+p_min(j))./2+((p_max(j)-p_min(j))./2).*seikiten_add(i,j);
        end
    end
    samp_ten_add(samp_ten_add<0.05 & samp_ten_add>0)  = 0.1;
    samp_ten_add(samp_ten_add<0 & samp_ten_add>-0.05) = -0.1;
    samp_ten                                          = [samp_ten;samp_ten_add];      %サンプル点の追加
    %%%%%%%%%%%% 追加サンプル点判定 範囲外なら端点に戻す %%%%%%%%%%%%%%%%%%%
end