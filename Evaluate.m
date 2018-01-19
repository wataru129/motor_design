for c_index = 1:clusta
    for h = 1:per_clusta
        if C1==1
            [add_val(h,c_index),add_seiyaku_val(h,c_index)] ...
              = Calculate_value(X,f_number,count,samp_su,E,NN)
        elseif C1==2
                add_val(h,c_index)=func(samp_ten);
                add_seiyaku_val(h,c_index)=samp_ten_add(c_index,2);
        end
    samp_hyoukati=[samp_hyoukati;samp_add_hyoukati(:,c_index)]
    samp_seiyakuti = [samp_seiyakuti;samp_add_seiyakuti(:,c_index)];
    samp_hyoukati2 = samp_hyoukati+ rr*(max((-SEIYAKU-samp_seiyakuti),0)).^2
    samp_seiyakuti2= rr*C*(max((-SEIYAKU-samp_seiyakuti),0)).^2;
    [hyoukati2_best bango] = min(samp_hyoukati2);  %追加サンプル点内でもっとも良い点探索
    seiyakuti_best= samp_seiyakuti(bango);
    hyoukati_best=samp_hyoukati(bango);
    seikiten_best=seikiten(bango,:);
    samp_ten_best=samp_ten(bango,:);
    samp_hyouka_best_suii(1,1)=hyoukati_best;
    samp_hyouka2_best_suii(1,1)=hyoukati2_best;
    samp_seiyaku_suii(1,1)= seiyakuti_best;
end