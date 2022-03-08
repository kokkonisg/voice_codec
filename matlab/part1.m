clear;
addpath('utils','functions');
[s0,] = audioread("male.wav");  %choose between male & female voice
s0 = s0(1:480*160); %trim  audio clip to 10secs

LARc = zeros(1,8*mod(length(s0),160));
d = zeros(1,length(s0));

for i=1:160:length(s0)-159
    n=floor(i/20)+1; %index for LAR values (8 LARs per 160-sample frame)
    [LARc(n:n+7), d(i:i+159)] = RPE_frame_ST_coder(s0(i:i+159));
end

for i=1:160:length(s0)-159
    n=floor(i/20)+1; %index for LAR values (8 LARs per 160-sample frame)
    [s(i:i+159)] = RPE_frame_ST_decoder(LARc(n:n+7), d(i:i+159));
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
audiowrite("coded1.wav",s,8000);



