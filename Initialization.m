%global  cur_sample_num sample_point
%%%%%%%%%%%%%%% Initialization %%%%%%%%%%%%%%%
%////////////// Integration ////////////////
count                  = 0;
ix                     = 1;                    % samp_hyouka_best_suii(1,1)のカウンタ,PSOで更新
C                      = 0;                                                     %サンプル点を追加した回数
hyoukati_best          = 0;
samp_su                = 0;                                               % ???
samp_hyouka_best_suii  = [];                                %best解の推移を計るための箱
samp_hyouka2_best_suii = [];
samp_seiyaku_best_suii = [];                                %best解の推移を計るための箱
samp_ten               = [];
samp_hyoukati          = [];
samp_hyoukati2         = [];
samp_seiyakuti         = [];
samp_seiyakuti2        = [];
samp_ten_add           = [];
samp_add_hyoukati      = [];
samp_add_seiyakuti     = [];
y_rbf                  = []; % RBFNでのオフセット(hyouka-max)
y_rbf2                 = []; % RBFNでのオフセット(hyouka-max)
update_jyoukyou        = [];
p_max                  = []; %サンプル点の範囲（上限）
p_min                  = []; %サンプル点の範囲（下限）
samp_kazu              = samp_syoki;                                    %サンプル点の数
samp_kazu_add          = samp_syoki;                                 %追加サンプル点数
samp_kazu_add_so       = samp_syoki;                             %疎な領域にサンプル点を撒くためのサンプル点10
update_jyoukyou(1,1) = update_flag;
for k=1:NN
            E(k)=-mokusui*sin(pi/2/(NN-1)*(NN-k));
end
%%%%%%%%%%%%%%% Finish initialization %%%%%%%%%%%%%%%