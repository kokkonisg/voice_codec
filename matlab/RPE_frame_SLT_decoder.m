function [s0, CurrFrmSTResd] = RPE_frame_SLT_decoder(LARc,Nc,bc,CurrFrmExFull, PrevFrmSTResd)
    % decode N, b values for whole frame
    [N, b] = LTP_dequant(Nc, bc);
    for j=0:3
        % append prediction and pred. error in each subframe iteration
        CurrFrmSTResd(40*j+1:40*j+40) = synthesis(CurrFrmExFull(40*j+1:40*j+40), b(j+1), N(j+1), PrevFrmSTResd);
        
        % update values of synth. past values to contain current subframe
        PrevFrmSTResd = [PrevFrmSTResd(40*j+1:end) CurrFrmSTResd];
    end
    
    % short term analysis for the whole frame
    s0 = RPE_frame_ST_decoder(LARc, CurrFrmSTResd);
    
end