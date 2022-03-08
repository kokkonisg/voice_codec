clear;
addpath('utils','functions');
[s0,] = audioread("male.wav");
s0 = s0(1:120*160); %trim  audio clip to 2secs

xc = zeros(4,13);
Mc = zeros(1,4);
Xmaxc = Mc;
e = zeros(1,160);
drc = zeros(1, 320);
block = zeros(200,260);
cellblock = cell(200,6);

for i=1:160:length(s0)-159
    % Long Term analysis for one frame
    [LARc, Nc, bc, e, drc(161:320)] = RPE_frame_SLT_coder(s0(i:i+159), drc(1:160));
    for j=0:3
        % calculate subsequence for each subframe
        [Mc(j+1), Xmaxc(j+1), xc(j+1,:)] = RPEencode(e(40*j+1:40*j+40));
    end
    % place (append) data in binary block
    block((i-1)/160+1,:) = params2bin(LARc, Nc, bc, Mc, Xmaxc, xc);
    %cellblock((i-1)/160+1,:) = {LARc, Nc, bc, Mc, Xmaxc, xc};
    drc(1:160)=drc(161:320);
end

drc = zeros(1, 320);
for i=1:160:length(s0)-159
    [LARc, Nc, bc, Mc, Xmaxc, xc] = bin2params(block((i-1)/160+1,:));
%     LARc = cell2mat(cellblock((i-1)/160+1,1));
%     Nc = cell2mat(cellblock((i-1)/160+1,2));
%     bc = cell2mat(cellblock((i-1)/160+1,3));
%     Mc = cell2mat(cellblock((i-1)/160+1,4));
%     Xmaxc = cell2mat(cellblock((i-1)/160+1,5));
%     xc = cell2mat(cellblock((i-1)/160+1,6));
    for j=0:3
        e(40*j+1:40*j+40) = RPEdecode(Mc(j+1), Xmaxc(j+1), xc(j+1,:));
    end
    [s(i:i+159), drc(161:320)] = RPE_frame_SLT_decoder(LARc, Nc, bc, e, drc(1:160));
    drc(1:160)=drc(161:320);
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
audiowrite("coded3.wav",s,8000);



