function S = RPE_frame_ST_decoder(LARc, d)
    %Polynommial stuff
    a = rc2poly(LARinv(LARdequant(LARc)));
    
    %Short Time Synthesis
    Sr = filter(1, a, d);
    
    %Postprocessing
    S = zeros(160, 1);
    S(1)=Sr(1);
    for i=2:160
        S(i) = Sr(i) + 28180*2^(-15) * S(i-1);
    end
    
end