function [Nc, bc] = LTPparams_quant (N, b)
    DLB = [0.2 0.5 0.8];
    bc = zeros(1, 4);

    Nc = N;
    for j=1:4
        if b(j) <= DLB(1)
            bc(j) = 0;
        elseif b(j) <= DLB(2)
            bc(j) = 1;
        elseif b(j) <= DLB(3)
            bc(j) = 2;
        else
            bc(j) = 3;
        end
    end
end