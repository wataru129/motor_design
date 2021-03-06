for c_index = 1:clusta
    for h = 1:per_clusta
        if C1==1
            [add_val(h,c_index),add_seiyaku_val(h,c_index)] ...
              = Do_jmag(samp_ten_add(:,:,c_index),dimension,count,samp_su,E,NN);
        elseif C1==2
            add_val(h,c_index)         = Calculate_value(samp_ten_add(h,:,c_index).',ra);
            add_seiyaku_val(h,c_index) = samp_ten_add(h,2);
        end
    end
    if C1==1
        add_val2(:,c_index) = add_val(:,c_index) + ...
                          rr*(max((-SEIYAKU-add_seiyaku_val(:,c_index)),0)).^2;
        [add_val2_min bango] = min(add_val2(:,c_index));
    else
        [add_val2_min bango] = min(add_val(:,c_index));
    end
        if hyoukati2_best(c_index) > add_val2_min
            hyoukati2_best(c_index)  = add_val2_min;
            seiyakuti_best(c_index)  = add_seiyaku_val(bango,c_index);
            hyoukati_best(c_index)   = add_val(bango,c_index);
            seikiten_best(c_index,:) = seikiten_add(bango,:,c_index);
            samp_ten_best(c_index,:) = samp_ten_add(bango,:,c_index);
            update_flag(c_index)     = 1;
            update_flag2(c_index)    = 0;
        else
            update_flag(c_index)  = 0;
            update_flag2(c_index) = update_flag2(c_index) + 1;
        end
        samp_ten                   = [samp_ten ; samp_ten_add(:,:,c_index)];
        seikiten1                  = [seikiten1;seikiten_add(:,:,c_index)];
        seikiten                   = [seikiten;seikiten_add(:,:,c_index)];
        samp_hyoukati              = [samp_hyoukati;add_val(:,c_index)];
        samp_seiyakuti             = [samp_seiyakuti;add_seiyaku_val(:,c_index)];
        update_jyoukyou(C,c_index) = update_flag(c_index); %アップデート状況
end
samp_hyoukati2              = samp_hyoukati+ ...
                                    rr*(max((-SEIYAKU-samp_seiyakuti),0)).^2;
samp_seiyakuti2             = rr*C*(max((-SEIYAKU-samp_seiyakuti),0)).^2;
samp_hyouka_best_suii(C,:)  = hyoukati_best;
samp_hyouka2_best_suii(C,:) = hyoukati2_best;
samp_seiyaku_suii(C,:)      = seiyakuti_best;
samp_kazu                   = samp_kazu + samp_kazu_add; %サンプル点数の追加