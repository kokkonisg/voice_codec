clear;
[s0,] = audioread("original.wav");

LARc = zeros(1,8*mod(length(s0),160));
d = zeros(1,length(s0));

LARc=rand(1,floor((length(s0)-159)/20)+1+7);
for i=1:160:length(s0)-159
    n=floor(i/20)+1; %index for LAR values (8 LARs per 160-sample frame)
    [LARc(n:n+7), d(i:i+159)] = RPE_frame_ST_coder(s0(i:i+159));
end

for i=1:160:length(s0)-159
    n=floor(i/20)+1; %index for LAR values (8 LARs per 160-sample frame)
    [s(i:i+159)] = RPE_frame_ST_decoder(LARc(n:n+7), d(i:i+159));
end

% x=1:length(s);
% subplot(3,1,1);
% plot(x,s);
% subplot(3,1,2);
% plot(x,s-s0','r')
% subplot(3,1,3);
% plot(x,s,x,s-s0','r');

sound(s, 8000);
% audiowrite("coded.wav",s,8000);



