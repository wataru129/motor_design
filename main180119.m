clear
tic %タイマースタート
global r R dimension samp_kazu h ra
fprintf('**** 統合的最適化START ******************************************\n')
load syoki_x(1)
syokiten      = P_X;
clear syoki_x(1)
heikin        = 0;
e_samp_ten    = [];
rr            = 5;             % 制約係数
NN            = 9;             % 評価点数
X             = zeros(1,14);   % 変数
e             = 1;             % e:初期値配列の３次元目
%%%%%%%%%%%%%%%%%%%%%%パラメータ設定開始%%%%%%%%%%%%%%%%%%%%%%%
mokusui       = 130.0;
SEIYAKU       = 2000;
clusta        = 5;
dimension     = 14;            %次元数
samp_syoki    = 10;            %初期サンプル点数30
per_clusta    = 10;
samp_kazu_add = per_clusta * clusta;
samp_kazu_max = 20;            %最大サンプル点数600-1200
CL            = 1;             %集中的探索の度合
C1            = 1;             %C1=1;本番C1= 2; test
update_flag   = [];            %最良解更新フラグ初期化
update_flag   = ones(clusta,1);
update_flag2  = zeros(clusta,1);
h_houhou      = 3;             %1＝単純合計,2＝重みづけ,3＝目標曲線
C_total       = ceil((samp_kazu_max-samp_kazu)/samp_kazu_add); %サンプル点数を追加する総回数

Initialization
%%%%%%%%%%%%%%%%%%%%% パラメータ設定の終了 %%%%%%%%%%%%%%%%%%%%%%%%%
% ---------------- サンプル点の存在範囲設定 -----------------
if C1 == 1
    Hanni2
elseif C1 == 2
    SEIYAKU = 5;
    ra      = 3; % ra:ベンチマークの問題番号
    hanni
end
%------------------------ サンプル点の存在範囲設定終了 -----------------
Add_syoki
Evaluate
C = C + 1
% ------------ 初期サンプル点生成+初期評価値計算終了 -----------------
%%%%%%%%%%%%%%%%%%%%%%%%%%% メインプログラムスタート %%%%%%%%%%%%%%%%%
while samp_kazu_max > samp_kazu
    RBFN2                    %応答局面法
    PSO3b                     %PSO適応+制約
    guraph4
    Sample_add4
    Evaluate
    Update
    C = C + 1
end
%%%%%%%%%%%%%%%%%% 追加サンプル点の評価値 %%%%%%%%%%%%%%%
T = toc;
fprintf('計算時間は%0.2f時間です\n',T/3600)
samp_kazu                                           %散布した数
size(samp_ten)                                       %散布した数が合っているかの検証
h_samp_ten_best(e,:)         = samp_ten_best         %ベスト解の点
h_hyoukati_best(e)           = hyoukati_best         %ベスト解の評価値
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
%%%%%%%%%%%%%%%%%% 追加サンプル点の評価値計算 %%%%%%%%%%%%%%%
save
fprintf('**** 統合的最適化STOP ******************************************\n')