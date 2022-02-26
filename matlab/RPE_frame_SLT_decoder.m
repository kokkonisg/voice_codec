function [s0, CurrFrmSTResd] = RPE_frame_SLT_decoder(LARc,Nc,bc,CurrFrmExFull, PrevFrmSTResd)
    
    for j=0:3
        CurrFrmSTResd(40*j+1:40*j+40) = synthesis(CurrFrmExFull(40*j+1:40*j+40), bc(j+1), Nc(j+1), PrevFrmSTResd);
    
        PrevFrmSTResd = [PrevFrmSTResd(40*j+1:end) CurrFrmSTResd];
    end
    
%     for j=0:3
%         d(40*j+1:40*j+40) = CurrFrmExFull(40*j+1:40*j+40) + bc(j+1)* PrevFrmSTResd(end-Nc(j+1)+1 : end-Nc(j+1)+40);
%     end
    
    s0 = RPE_frame_ST_decoder(LARc, CurrFrmSTResd);
    
end