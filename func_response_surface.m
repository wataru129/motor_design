function  value  = func_response_surface(x, samp_kazu, omega, r, seikiten)
    value=0;
    x_ex = repelem(x,samp_kazu,1) ;
    value = exp(-sum((x_ex - seikiten).^2,2) / (r^2)) * omega;
end
