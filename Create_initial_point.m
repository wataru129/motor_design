%%%%%% 初期点設定 %%%%%&%%%
seikiten = (-1) + (1 - (-1)) *rand(samp_kazu,dimension);
for i=1:samp_kazu                        %初期サンプル点設定
    for j=1:dimension
        ini_samp_ten(i,j) = ((p_max(j)+p_min(j))./2+((p_max(j)-p_min(j))./2).*(rand*2-1.));
    end
end
if (C1==1) && (C==0)
    for j=1:dimension
        ini_samp_ten(1,j) = samp_x(1,j);
        seikiten(1,j)     = (samp_x(1,j)-(p_max(j)+p_min(j))./2)./((p_max(j)-p_min(j))./2);
    end
end
seikiten1    = seikiten;
samp_ten     = ini_samp_ten;


for i=1:samp_kazu
    if C1==1
        [samp_hyoukati(h),samp_seiyakuti(h)] ...
          = Do_jmag(samp_ten(i,:),f_number,count,samp_su,E,NN)
    elseif C1==2
        samp_hyoukati(h)         = Calculate_value(samp_ten);
        samp_seiyakuti(h) = samp_ten_add(c_index,2);
    end
end

samp_hyoukati2              = samp_hyoukati+ rr*(max((-SEIYAKU-samp_seiyakuti),0)).^2
samp_seiyakuti2             = rr*C*(max((-SEIYAKU-samp_seiyakuti),0)).^2;

[tmp_hyoukati2_best bango] = min(samp_hyoukati2);
for c_index=1:clusta
    seiyakuti_best(c_index)           = samp_seiyakuti(bango);
    hyoukati_best(c_index)            = samp_hyoukati(bango);
    hyoukati2_best(c_index)           = tmp_hyoukati2_best;
    seikiten_best(c_index,:)          = samp_seiyakuti(bango,:);
    samp_ten_best(c_index,:)          = samp_ten(bango,:);
    samp_hyouka_best_suii(C,c_index)  = hyoukati_best(c_index);
    samp_hyouka2_best_suii(C,c_index) = hyoukati2_best(c_index);
    samp_seiyaku_suii(C,c_index)      = seiyakuti_best(c_index);
end