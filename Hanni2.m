if C1 ==1
    p_max(1,1)=10.0;  p_min(1,1)=5.0;   p_max(2,1)=48.0;  p_min(2,1)=25.0;
    p_max(3,1)=4.0;   p_min(3,1)=0.01;  p_max(4,1)=1.5;   p_min(4,1)=0.01;
    p_max(5,1)=2.0;   p_min(5,1)=0.05;
    p_max(6,1)=4.0;   p_min(6,1)=0.01;  p_max(7,1)=1.5;   p_min(7,1)=0.01;
    p_max(8,1)=0.9;   p_min(8,1)=0.10;  p_max(9,1)=0.9;   p_min(9,1)=0.1;
    p_max(10,1)=6.0;  p_min(10,1)=3.0;
    p_max(11,1)=0.9;  p_min(11,1)=0.5;  p_max(12,1)=8.0;  p_min(12,1)=4.01;
    p_max(13,1)=0.9;  p_min(13,1)=0.1;  p_max(14,1)=8.0;  p_min(14,1)=4.01;
    if C==0
        samp_x(1,1) = 8.55 ;  samp_x(1,2) = 44.0;
        samp_x(1,3) = 2.83  ;  samp_x(1,4) = 0.916 ;
        samp_x(1,5) = 0.742 ;
        samp_x(1,6) = 1.68  ;  samp_x(1,7) = 0.1 ;
        samp_x(1,8) = 0.61 ;  samp_x(1,9) = 0.52 ;
        samp_x(1,10) =5.70 ;
        samp_x(1,11)= 0.528 ;  samp_x(1,12) =7.77 ;
        samp_x(1,13)= 0.447 ;  samp_x(1,14) =8.0;
    end
elseif C1 == 2
    SEIYAKU = 5;
    ra      = 3; % ra:ベンチマークの問題番号
    for j=1:dimension
        if ra==1
            p_max(j,1)=5; p_min(j,1)=-5;
        elseif ra==2
            p_max(1,1)=2; p_min(1,1)=-2;
        elseif ra==3
            p_max(j,1)=5; p_min(j,1)=-5;
        elseif ra==4
            p_max(j,1)=5; p_min(j,1)=-5;
        elseif ra==5
            p_max(j,1)=100; p_min(j,1)=-100;
        end
    end
end