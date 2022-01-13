function [LARc, d] = RPE_frame_ST_coder(S)
    %%Short Term
    %reflection coefficients
    r = ACF(S);
    
    %Log.-Area Ratios transformation
    LAR = LARtrans(r);
    
    %Log.-Area Ratios quantization
    LARc = LARquant(LAR);
    
    %Polynommial stuff
    a = rc2poly(LARinv(LARdequant(LARc)));
    disp(a);
    
    %Residual 
    d = Residual(S, a);
end