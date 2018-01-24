%%%PSO-parameter%%%%%%%
particle  = 30;   %The number of Particle
Iteration = 200;  % Max of reiteration
%%%%%%%%%%%%%%%%%%%%%%
if C == 1
    IP=(-1) + (1-(-1))*rand(particle,dimension);
end
x_init          = IP;
v_init          = IP;
k_idx             = kmeans(x_init,clusta);
class =zeros(clusta,1);
x_pso =zeros(clusta,dimension);
for c_index=1:clusta
%%%%%%%%%%%%%%%%%%%%%%Initialization%%%%%%%%%%%%%%%%%%%%%%%%%
    flag            = 0;
    ct              = 1;
    class(c_index)  = size(find(k_idx == c_index),1);
    x_p             = zeros(class(c_index),dimension);
    v_p             = zeros(class(c_index),dimension);
    c1_ex           = 1.4955 * ones(class(c_index),1);
    c2_ex           = 1.4955 * ones(class(c_index),1);
    w_pso           = 0.729 * ones(class(c_index),dimension);
    alpha           = zeros(class(c_index),1);
    update_particle = zeros(class(c_index),dimension);
    c1              = repelem(c1_ex,1,dimension) ;
    c2              = repelem(c2_ex,1,dimension) ;
    for i=1:size(k_idx,1)
        if k_idx(i)==c_index
            x_p(ct,:)= x_init(i,:);
            v_p(ct,:)= v_init(i,:);
            ct     = ct + 1;
        end
    end
    pbest   = x_p;
    fpbest  = zeros(class(c_index),1);
    fpbest  = Func_response_surface(pbest, samp_kazu, omega, r, seikiten);
    if C1 == 1
        gx      = Func_response_surface(pbest, samp_kazu, omega2, r, seikiten);
        fpbest  = fpbest+ rr*(max((-SEIYAKU-gx),0)).^2;
    end
    [fgbest ig] = min(fpbest);
    gbest       = pbest(ig,:);
%%%%%%%%%%%%%%%%%%%%%%Initialization%%%%%%%%%%%%%%%%%%%%%%%%%
    for k=1:Iteration
        tmp_fx   = zeros(class(c_index),1);
        gbest_ex = repelem(gbest,class(c_index),1);
        rd1      = repelem(rand(class(c_index),1),1,dimension);
        rd2      = repelem(rand(class(c_index),1),1,dimension);
        v_p      = w_pso.* v_p + c1.*rd1.*(pbest - x_p) + c2.*rd2.*(gbest_ex - x_p);
        x_p      = x_p + v_p;
        x_p(x_p > 1)  = 1;
        x_p(x_p < -1) = -1;
        v_p(v_p > 1)  = 1;
        v_p(v_p < -1) = -1;
        tmp_fx = Func_response_surface(x_p, samp_kazu, omega, r, seikiten);
        if C1 == 1
            tmp_gx  = Func_response_surface(x_p, samp_kazu, omega2, r, seikiten);
            tmp_fx  = tmp_fx + rr*(max((-SEIYAKU-gx),0)).^2;
        end
        for i=1:class(c_index)
            if(tmp_fx(i) < fpbest(i))
                pbest(i,:) = x_p(i,:);
                fpbest(i)  = tmp_fx(i);
            end
        end
        [now_best , ig] = min(fpbest);
        if now_best < fgbest
            flag= 1;
            update_particle(ig) = update_particle(ig) +1;
            gbest=pbest(ig,:);
            fgbest=fpbest(ig);
        end
        if flag ==0
            alpha = zeros(class(c_index),1);
        else
            for i=1:class(c_index)
                if update_particle(i) < update_particle(ig)
                  alpha(i,1) = 1/k;
                else
                  alpha(i,1) = 0;
                end
            end
        end
        flag = 0;
        c1_ex = c1_ex + alpha.* (c1_ex(ig)*ones(class(c_index),1) -c1_ex);
        c2_ex = c2_ex + alpha.* (c1_ex(ig)*ones(class(c_index),1) -c2_ex);
        c1 = repelem(c1_ex,1,dimension) ;
        c2 = repelem(c2_ex,1,dimension) ;
    end
    x_pso(c_index,:)        = gbest.';
    y_pso(c_index)          = fgbest;
    fgbest_suii(C,c_index)  = fgbest;
    fx(c_index)             = Func_response_surface(x_pso(c_index,:),samp_kazu,omega,r,seikiten);
    gx(c_index)             = Func_response_surface(x_pso(c_index,:),samp_kazu,omega2,r,seikiten);
end
