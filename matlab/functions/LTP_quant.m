function [Nc, bc] = LTP_quant (N, b)
    DLB = [0.2 0.5 0.8];

    Nc = N;
    if b <= DLB(1)
        bc = 0;
    elseif b <= DLB(2)
        bc = 1;
    elseif b <= DLB(3)
        bc = 2;
    else
        bc = 3;
    end
end