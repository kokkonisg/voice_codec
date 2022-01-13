[y,] = audioread("test.wav");
frames = zeros([160 floor(length(y)/160)]);
for i=1:floor(length(y)/160)
    frames(:,i)=y((i-1)*160+1:i*160);
end

%prepocess
S = zeros([160 size(frames,2)]);
for i=1:size(frames,2)
    S(:,i)=preprocessing(frames(:,i));
end

S0 = S(:,1);
for i=1:80
    [LARc, d] = RPE_frame_ST_coder(S(:,i));
    [Spred(:,i)] = RPE_frame_ST_decoder(LARc, d);
end



