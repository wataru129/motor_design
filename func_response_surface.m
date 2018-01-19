function  value  = func_response_surface(x, samp_kazu, omega, r, seikiten)
    value=zeros(size(x,1),1);
    for i=1:size(x,1)
        x_ex = repelem(x(i),samp_kazu,1) ;
        value(i,1) = omega.' * exp(-sum((x_ex - seikiten).^2,2) / (r^2)) ;
    end
end
