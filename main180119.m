clear
tic %タイマースタート
fprintf('**** 統合的最適化START ******************************************\n')
rr = 5;                                            % 制約係数
NN = 9;                                            % 評価点数
e  = 1;                                            % e:初期値配列の３次元目
%%%%%%%%%%%%%%%%%%%%%%パラメータ設定開始%%%%%%%%%%%%%%%%%%%%%%%
mokusui       = 130.0;
SEIYAKU       = 2000;
clusta        = 5;
dimension     = 14;                                %次元数
samp_syoki    = 10;                                %初期サンプル点数30
per_clusta    = 10;                                %1クラスタあたりの追加サンプル点数
samp_kazu_add = per_clusta * clusta;               %追加サンプル点数
samp_kazu_max = 20;                                %最大サンプル点数600-1200
CL            = 1;                                 %集中的探索の度合
C1            = 1;                                 %C1=1;本番C1= 2; test
update_flag   = ones(c_index,1);                   %最良解更新フラグ初期化
update_flag2  = zeros(c_index,1);
C_total       = ceil((samp_kazu_max-samp_kazu) ...
                                  /samp_kazu_add); %サンプル点数を追加する総回数
%%%%%%%%%%%%%%%%%%%%% パラメータ設定の終了 %%%%%%%%%%%%%%%%%%%%%%%%%
Initialization
Hanni2               % サンプル点の存在範囲設定
Create_initial_point % 初期サンプル点生成+初期評価値計算終了
%%%%%%%%%%%%%%%%%%%%%%%%%%% メインプログラムスタート %%%%%%%%%%%%%%%%%
while samp_kazu_max > samp_kazu
    RBFN2                    %応答局面法
    APSO_kmeans_xclusta      %PSO適応+制約
%    guraph4
    Add_point
    Evaluate
end
%%%%%%%%%%%%%%%%%% 追加サンプル点の評価値 %%%%%%%%%%%%%%%
T=toc;
fprintf('計算時間は%0.2f時間です\n',T/3600)
%{
h_samp_ten_best(e,:)        = samp_ten_best                 %ベスト解の点
h_hyoukati_best(e)          = hyoukati_best                   %ベスト解の評価値
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
%%%%%%%%%%%%%%%%%% 追加サンプル点の評価値計算 %%%%%%%%%%%%%%%
save
fprintf('**** 統合的最適化STOP ******************************************\n')