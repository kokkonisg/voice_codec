function [LARc,Nc,bc,CurrFrmExFull,CurrFrmSTResd] = RPE_frame_SLT_coder(s0, PrevFrmSTResd)
    % for one frame
    [LARc, d] = RPE_frame_ST_coder(preprocessing(s0));
    % here d has values for the whole frame
    
    %initialization
    Nc = zeros(1,4);
    bc = Nc;
    CurrFrmExFull = [];
    CurrFrmSTResd = [];
    
    % for each subframe
    for j=0:3
        [N(j+1), b(j+1)] = LTP(d(40*j+1:40*j+40), PrevFrmSTResd);
        [Nc(j+1), bc(j+1)] = LTPparams_quant(N(j+1), b(j+1));
        CurrFrmExFull = [CurrFrmExFull LongTerm_Prediction(d(40*j+1:40*j+40), PrevFrmSTResd, bc(j+1), Nc(j+1))];
        CurrFrmSTResd = [CurrFrmSTResd synthesis(CurrFrmExFull(40*j+1:40*j+40), bc(j+1), Nc(j+1), PrevFrmSTResd)];
        
        PrevFrmSTResd = [PrevFrmSTResd(40*(j+1)+1:end) CurrFrmSTResd];
    end
end