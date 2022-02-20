[s0,] = audioread("original.wav");
s0=s0';
% frames = zeros([160 floor(length(s0)/160)]);
% PrevFrmSTResd = zeros(160, 1);
% for i=1:floor(length(s0)/160)
%     frames(:,i)=s0((i-1)*160+1:i*160);
% end

LARc = zeros(1,8*mod(length(s0),160));
d = zeros(1,length(s0));

n=1;
for i=1:160:length(s0)-160
    [LARc(n:n+7), d(i:i+159)] = RPE_frame_ST_coder(preprocessing(s0(i:i+159)));
    n=n+8;
end

n=1;
for i=1:160:length(s0)-160
    s(i:i+159) = RPE_frame_ST_decoder(LARc(n:n+7), d(i:i+159));
    n=n+8;
end

sound(s, 8000);
% audiowrite("coded.wav",s,8000);



