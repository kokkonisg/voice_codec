function [N, b] = LTP(d, drc)
    % d is for current subframe
    % drc is for prev 4 subframes
    R = zeros(1,120);   
        
    for lamda=40:120
        R(lamda) = sum(d.*drc(end-lamda+1 : end-lamda+40));
    end
    
    [~,N] = max(R(40:120));
    N=N+39;
    b = R(N)/sum(drc(end-N+1 : end-N+40).^2);
end