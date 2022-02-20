function [N, b] = LTP(d, drc)
    % d is for current subframe
    % drc is for prev 3 subframes
    R = zeros(81, 1);
    N = zeros(1, 4);
    b = zeros(1, 4);
    
    if(size(drc, 1) < 120)
        drc = [zeros(120-size(drc, 1)) drc];
    end
    
    for j=0:3
        for lamda=40:120
            R(lamda-39) = sum(d.*drc(end-lamda+1 : end-lamda+40));
        end
        [~,N(j+1)] = max(R);
        
        
        b(j+1) = R(N(j+1))/sum(drc(end-N(j+1)+1 : end-N(j+1)+40)^2);
        
    end
end