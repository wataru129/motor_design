%%%PSO-parameter%%%%%%%
particle  = 30;   %The number of Particle
Iteration = 200;  % Max of reiteration
%%%%%%%%%%%%%%%%%%%%%%
if samp_kazu == ini_samp_kazu
    x_ini = (1-(-1)).*rand(particle,dimension)+(-1);
    v_ini = (1-(-1)).*rand(particle,dimension)+(-1);
    idx             = kmeans(x,clusta);
end
class =zeros(clusta,1);
x_pso =zeros(clusta,dimension);
for c_index=1:clusta
%%%%%%%%%%%%%%%%%%%%%%Initialization%%%%%%%%%%%%%%%%%%%%%%%%%
    ct             = 1;
    class(c_index) = size(find(idx == c_index),1);
    xs              = zeros(class(c_index),dimension);
    v              = zeros(class(c_index),dimension);
    for i=1:class(c_index)
        if idx(i)==c_index
            x(ct,:)= x(i,:);
            v(ct,:)= v(i,:);
            ct     = ct + 1;
        end
    end
    c1_ex     = 1.4955 * ones(class(c_index),1);
    c2_ex     = 1.4955 * ones(class(c_index),1);
    c1 = repelem(c1_ex,1,dimension) ;
    c2 = repelem(c2_ex,1,dimension) ;
    w_pso     = 0.729 * ones(class(c_index)dimension);
    alpha             = zeros(1,class(c_index));
    flag              = 0;
    update_particle   = zeros(dimension,class(c_index));
    pbest   = x_p;
    fpbest=zeros(1,class(c_index));
    gbest=pbest(:,1);
    fgbest  = Func_response_surface(gbest, cur_sample_num, omega, r, sample_point);
    for i=1:class(c_index)
        fpbest(i)=Func_response_surface(pbest(:,i), cur_sample_num, omega, r, sample_point);
        if fpbest(i)<fgbest
            gbest=pbest(:,i);
            fgbest=fpbest(i);
        end
    end
%%%%%%%%%%%%%%%%%%%%%%Initialization%%%%%%%%%%%%%%%%%%%%%%%%%
    for k=1:Iteration
        temp_fpbest=zeros(1,class(c_index));
        gbest_ex = gbest * ones(1,class(c_index));
        rd1      = repelem(rand(1,class(c_index)),dimension,1);
        rd2      = repelem(rand(1,class(c_index)),dimension,1);
        v_p = w_pso.*v_p + c1.*rd1.*(pbest-x_p) ...
                  + c2.*rd2.*(gbest_ex-x_p);
        x_p = x_p + v_p;
        x_p(x_p > 5)  =5;
        x_p(x_p < -5) = -5;
        v_p(v_p > 5)  = 5;
        v_p(v_p < -5) = -5;
        for i=1:class(c_index)
            temp_fpbest(i)=Func_response_surface(x_p(:,i), cur_sample_num, omega, r, sample_point);
            if(temp_fpbest(i)<fpbest(i))
                pbest(:,i)=x_p(:,i);
                fpbest(i) = temp_fpbest(i);
            end
        end
        [now_best , ig] = min(fpbest);
        if now_best<fgbest
            flag= 1;
            update_particle(ig) = update_particle(ig) +1;
            gbest=pbest(:,ig);
            fgbest=fpbest(ig);
        end
        if flag ==0
            alpha = zeros(1,class(c_index));
        else
            for i=1:class(c_index)
                if update_particle(i) < update_particle(ig)
                  alpha(1,i) = 1/k;
                else
                  alpha(1,i) = 0;
                end
            end
        end
        flag = 0;
        c1_ex = c1_ex + alpha.* (c1_ex(ig)*ones(1,class(c_index)) -c1_ex);
        c2_ex = c2_ex + alpha.* (c1_ex(ig)*ones(1,class(c_index)) -c2_ex);
        c1 = repelem(c1_ex,dimension,1) ;
        c2 = repelem(c2_ex,dimension,1) ;
    end
    x_pso(:,c_index) = gbest;
end
result_pso(:,:,C)    = x_pso;
