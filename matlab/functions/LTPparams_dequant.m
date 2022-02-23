function [N, b] = LTPparams_dequant(Nc, bc)
    QLB = [0.1 0.35 0.65 1];
    
    N = Nc;
    b = QLB(bc);
end