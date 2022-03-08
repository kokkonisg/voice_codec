clear;
addpath('utils','functions');
[s0,] = audioread("male.wav"); %choose between male & female voice
s0 = s0(1:480*160); %trim  audio clip to 10secs

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

drc = zeros(1, 320);
for i=1:160:length(s0)-159
    n=floor(i/20)+1; %index for LAR values (8 LARs per 160-sample frame)
    m=round(n/2); %index for N, b values (4 of each per 160-sample frame)
    [s(i:i+159), drc(i+160:i+319)] = RPE_frame_SLT_decoder...
        (LARc(n:n+7), Nc(m:m+3), bc(m:m+3), e(i:i+159), drc(i:i+159));
end

% ploting
% x=1:length(s);
% figure;
% subplot(3,1,1);
% plot(x,s);
% xlabel("Original Audio");
% subplot(3,1,2);
% plot(x,s-s0','r')
% xlabel("Difference between Original & Reconstracted Audio");
% subplot(3,1,3);
% plot(x,s,x,s-s0','r');
% legend('Original','Difference', 'Location', 'best');

sound(s, 8000);
audiowrite("coded2.wav",s,8000);



