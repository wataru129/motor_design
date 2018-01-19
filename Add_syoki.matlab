    %%%%%% 初期点設定 %%%%%&%%%
    seikiten=syokiten(1:dimension,1:samp_kazu,e)';
    for i=1:samp_kazu                        %初期サンプル点設定
        for j=1:dimension
%          samp_ten_add(i,j) = ((p_max(j)+p_min(j))./2+((p_max(j)-p_min(j))./2).*seikiten(i,j));
            samp_ten_add(i,j) = ((p_max(j)+p_min(j))./2+((p_max(j)-p_min(j))./2).*(rand*2-1.));
        end
    end
   if (C1==1) && (C==0)
     for j=1:dimension
        samp_ten_add(1,j) = samp_x(1,j);
        seikiten(1,j) = (samp_x(1,j)-(p_max(j)+p_min(j))./2)./((p_max(j)-p_min(j))./2);
     end
     C=C+1
   end
     seikiten1=seikiten;
     seikiten_add = seikiten;
     samp_ten=samp_ten_add;
