function [N, b] = LTP(d, drc)
    % d is for current subframe
    % drc is for prev 4 subframes
    R = zeros(1,81);    
        
    for lamda=40:120
        R(lamda-39) = sum(d.*drc(end-lamda+1 : end-lamda+40));
    end
    
    [~,N] = max(R);
    N=N+39;
    if R(N-39) <= 0
        b=0;
    else
        b = R(N-39)/sum(drc(end-N+1 : end-N+40).^2);
    end
    
end