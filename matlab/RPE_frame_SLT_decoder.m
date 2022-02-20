function [s0, CurrFrmSTResd] = RPE_frame_SLT_decoder(LARc,Nc,bc,CurrFrmExFull, PrevFrmSTResd)
    CurrFrmSTResd = synthesis(CurrFrmExFull, bc, Nc, PrevFrmSTResd);
    s0 = RPE_frame_ST_decoder(LARc, d);
end