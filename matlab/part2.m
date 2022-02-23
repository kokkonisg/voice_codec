clear;
[s0,] = audioread("original.wav");
% frames = zeros([160 floor(length(s0)/160)]);
% PrevFrmSTResd = zeros(160, 1);
% for i=1:floor(length(s0)/160)
%     frames(:,i)=s0((i-1)*160+1:i*160);
% end

LARc = zeros(1,8*mod(length(s0),160));
Nc = zeros(1,4*mod(length(s0),160));
bc = Nc;
e = zeros(1,length(s0));
drc = [zeros(1, 160) e];


for i=1:160:length(s0)-159
    n=floor(i/20)+1; %index for LAR values (8 LARs per 160-sample frame)
    m=round(n/2); %index for N, b values (4 of each per 160-sample frame)
    [LARc(n:n+7), Nc(m:m+3), bc(m:m+3), e(i:i+159), drc(i+160:i+319)] = ...
        RPE_frame_SLT_coder(s0(i:i+159), drc(i:i+159));    
end

for i=1:160:length(s0)-159
    n=floor(i/20)+1; %index for LAR values (8 LARs per 160-sample frame)
    m=round(n/2); %index for N, b values (4 of each per 160-sample frame)
    [s(i:i+159), drc(i+160:i+319)] = RPE_frame_SLT_decoder...
        (LARc(n:n+7), Nc(m:m+3), bc(m:m+3), e(i:i+159), drc(i:i+159));
end

sound(s, 8000);
% audiowrite("coded.wav",s,8000);



