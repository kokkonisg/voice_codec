function [N, b] = LTPparams(d, drc)
    R = zeros(80, 1);
    N = zeros(1, 4);
    b = zeros(1, 4);
    
    for j=1:4
        for lamda=40:120
            for i=1:40
                if 40*j+i-lamda>0
                    R(lamda) = R(i) + d(40*j+i)*drc(40*j+i-lamda);
                end
            end
        end
        [~,N(j)] = max(R);
        
        S = 0;
        for i=1:40
            if 40*j+i-N(j)>0
                S = S + drc(40*j+i-N(j))^2;
            end
        end
        b(j) = R(N(j))/S;
        
    end
end