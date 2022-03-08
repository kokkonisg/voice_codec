function [LARc,Nc,bc,CurrFrmExFull,CurrFrmSTResd] = RPE_frame_SLT_coder(s0, PrevFrmSTResd)
    % short term analysis for one frame
    [LARc, d] = RPE_frame_ST_coder(s0);
    % here d has values for the whole frame
    
    %initialization
    Nc = zeros(1,4);
    bc = Nc;
    CurrFrmExFull = [];
    CurrFrmSTResd = [];
    
    % for each subframe
    for j=0:3
        % calculate Long Term Params and encode then decode them 
        % mimicking the decoder
        [N(j+1), b(j+1)] = LTP(d(40*j+1:40*j+40), PrevFrmSTResd);
        [Nc(j+1), bc(j+1)] = LTP_quant(N(j+1), b(j+1));
        [N(j+1), b(j+1)] = LTP_dequant(Nc(j+1), bc(j+1));
        
        % append prediction and pred. error in each subframe iteration
        CurrFrmExFull = [CurrFrmExFull LongTerm_Prediction(d(40*j+1:40*j+40), PrevFrmSTResd, b(j+1), N(j+1))];
        CurrFrmSTResd = [CurrFrmSTResd synthesis(CurrFrmExFull(40*j+1:40*j+40), b(j+1), N(j+1), PrevFrmSTResd)];
        
        % update values of synth. past values to contain current subframe
        PrevFrmSTResd = [PrevFrmSTResd(40*(j+1)+1:end) CurrFrmSTResd];
    end
end