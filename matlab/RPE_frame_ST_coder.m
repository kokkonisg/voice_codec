function [LARc, d] = RPE_frame_ST_coder(S)
    S = preprocessing(S);

    %%Short Term
    %reflection coefficients
    r = ComputeRC(S);
    
    %Log.-Area Ratios transformation
    LAR = LARtrans(r);
    
    %Log.-Area Ratios quantization
    LARc = LARquant(LAR);
    
    %Polynommial stuff
    a = rc2poly(LARinv(LARdequant(LARc)));
    
    
    %Residual
    d = Residual(S, a);
end