        if bango > samp_kazu_add*(C-1)
            update_flag=1
            bango = bango
            samp_kazu_add*(C-1);
            update_flag2=0;
        else
            update_flag = 0;
            update_flag2= update_flag2+1;
        end
        samp_ten_hyoukati_add=samp_add_hyoukati;                %追加サンプル点の評価値
        samp_kazu=samp_kazu+samp_kazu_add;                      %サンプル点数の追加
        update_jyoukyou(C,1)=update_flag;