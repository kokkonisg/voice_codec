# voice_codec
Voice Coder/Decoder based on ETSI GSM 06.10

###Part 1 ~done
- [LARc,CurrFrmSTResd] = RPE_frame_ST_coder(S): given a frame of 160 samples of the original preprocessed signal S returns the quantized values of LAR and the residual signal d (aka error signal). 
- [s0] = RPE_frame_ST_decoder(LARc, CurrFrmSTResd): givern the quantized values of LAR and the residual signal d (aka error signal) of a single frame (160 samples) returns the frame of the decoded signal. 
