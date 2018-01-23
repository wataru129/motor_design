for c_index = 1:clusta
    for h = 1:per_clusta
        if C1==1
            [add_val(h,c_index),add_seiyaku_val(h,c_index)] ...
<<<<<<< HEAD
              = Do_jmag(samp_ten_add(:,:,c_index),f_number,count,samp_su,E,NN)
=======
              = Do_jmag(samp_ten_add(h,:,c_index),f_number,count,samp_su,E,NN)
>>>>>>> cc3f02acce0dae00a7ec668c0b42203c5ef6a61e
        elseif C1==2
            add_val(h,c_index)         = Calculate_value(samp_ten);
            add_seiyaku_val(h,c_index) = samp_ten_add(c_index,2);
        end
    end
<<<<<<< HEAD
    add_val2(:,c_index)             = add_val(:,c_index)+ rr*(max((-SEIYAKU-add_seiyakuti_val(:,c_index)),0)).^2
    [add_val2_min bango] = min(add_val2(:,c_index));
    if hyoukati2_best(c_index) > add_val2_min
        seiyakuti_best(c_index)  = add_seiyakuti(bango,c_index);
        hyoukati_best(c_index)   = add_val(bango,c_index);
        seikiten_best(c_index,:) = seikiten_add(bango,:,c_index);
        samp_ten_best(c_index,:) = samp_ten_add(bango,:,c_index);
        update_flag(c_index)  = 1;
        update_flag2(c_index) = 0;
    else
        update_flag(c_index)  = 0;
        update_flag2(c_index) = update_flag2(c_index) + 1;
    end
    samp_hyoukati               = [samp_hyoukati;add_val(:,c_index)]
    samp_seiyakuti              = [samp_seiyakuti;add_seiyaku_val(:,c_index)];
end
samp_hyoukati2              = samp_hyoukati+ rr*(max((-SEIYAKU-samp_seiyakuti),0)).^2
samp_seiyakuti2             = rr*C*(max((-SEIYAKU-samp_seiyakuti),0)).^2;
[hyoukati2_best bango]      = min(samp_hyoukati2);  %追加サンプル点内でもっとも良い点探索
samp_hyouka_best_suii(C,1)  = hyoukati_best;
samp_hyouka2_best_suii(C,1) = hyoukati2_best;
samp_seiyaku_suii(C,1)      = seiyakuti_best;
=======
    add_val2                    = add_val+ rr*(max((-SEIYAKU-add_seiyaku_val),0)).^2;
    add_seiyaku_val2            = rr*C*(max((-SEIYAKU-add_seiyaku_val),0)).^2;
    [add_val2_best bango]       = min(add_val2(:,c_index));  %追加サンプル点内でもっとも良い点探索

    if add_val2_best < hyoukati_best(c_index)
        seiyakuti_best(c_index) = add_seiyaku_val(bango,c_index);
        hyoukati_best(c_index)  = add_val(bango,c_index);
        seikiten_best(c_index)  = seikiten_add(bango,:,c_index);
        samp_ten_best(c_index)  = samp_ten_add(bango,:,c_index);
    end
    samp_hyoukati   = [samp_hyoukati;samp_add_hyoukati(:,c_index)];
    samp_seiyakuti  = [samp_seiyakuti;samp_add_seiyakuti(:,c_index)];
    samp_hyouka_best_suii(1,c_index)  = hyoukati_best;
    samp_hyouka2_best_suii(1,c_index) = hyoukati2_best;
    samp_seiyaku_suii(1,c_index)      = seiyakuti_best;
end
samp_hyoukati2  = samp_hyoukati+ rr*(max((-SEIYAKU-samp_seiyakuti),0)).^2;
samp_seiyakuti2 = rr*C*(max((-SEIYAKU-samp_seiyakuti),0)).^2;
>>>>>>> cc3f02acce0dae00a7ec668c0b42203c5ef6a61e
