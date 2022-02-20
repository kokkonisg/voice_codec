function [LARc,Nc,bc,CurrFrmExFull,CurrFrmSTResd] = RPE_frame_SLT_coder(s0, PrevFrmSTResd)
    [LARc, d] = RPE_frame_ST_coder(preprocessing(s0));
    %[N, b] = LTP(d, PrevFrmSTResd);
    [Nc, bc] = LTPparams_quant(LTP(d, PrevFrmSTResd));
    CurrFrmExFull = LongTerm_Prediction(d, PrevFrmSTResd, bc, Nc);
    CurrFrmSTResd = synthesis(CurrFrmExFull, bc, Nc, PrevFrmSTResd);
    
end