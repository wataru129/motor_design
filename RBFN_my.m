%%%%%%%%%%%%%%%%%%%%%% Initial setting  %%%%%%%%%%%%%%%%%%%%%%%
A           = [];
omega       = [];
omega2      = [];
d_max       = [];
ramuda      = [];
samp_kyori  = zeros(samp_kazu,1);
H           = zeros(samp_kazu,samp_kazu);
seikiten_ex = zeros(samp_kazu,dimension,samp_kazu);
ramuda      = 10.^(-2)*eye(samp_kazu,samp_kazu);
%%%%%%%%%%%%%%%%%%%%%% RBFN main program  %%%%%%%%%%%%%%%%%%%%%%%
samp_hyoukati_max=max(samp_hyoukati);
samp_seiyakuti_max=max(samp_seiyakuti);
samp_hyoukati_max_ex=samp_hyoukati_max*ones(samp_kazu,1);
samp_seiyakuti_max_ex=samp_seiyakuti_max*ones(samp_kazu,1);
y_rbf  = samp_hyoukati - samp_hyoukati_max_ex;
y_rbf2 = samp_seiyakuti - samp_seiyakuti_max_ex;
%//////////////////// caluculate_dmax ////////////////////%
for j=1:samp_kazu
    seikiten_ex(:,:,j) = repelem(seikiten(j,:),samp_kazu,1);
    samp_kyori(j) = max(sum((seikiten - seikiten_ex(:,:,j)).^2,2));
end
d_max =sqrt(max(samp_kyori));
%//////////////////// caluculate r ////////////////////%
if dimension == 2
    r=d_max/(sqrt(samp_kazu*dimension)^(1/dimension));
else
    r=d_max/(sqrt(dimension)*(sqrt(samp_kazu).^(1/dimension)));
end
if r==0
    r=0.5;
end
r2 = r.^2;
%////////////////////caluculate H ////////////////////%
for j=1:samp_kazu
    H(:,j) = exp(-sum((seikiten - seikiten_ex(:,:,j)).^2,2)/r2);
end
%////////////////////caluculate w ////////////////////%
A=H'*H+ramuda;
omega=inv(A)*H'*y_rbf;
omega2=inv(A)*H'*y_rbf2