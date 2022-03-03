clear;
[s0,] = audioread("original.wav");

LARc = zeros(1,8);
Nc = zeros(1,4);
bc = Nc;
e = zeros(1,160);
drc = zeros(1, 320);
block = zeros(200,260);

for i=1:160:length(s0)-159
    [LARc, Nc, bc, e, drc(161:320)] = RPE_frame_SLT_coder(s0(i:i+159), drc(1:160));
    for j=0:3
        [Mc(j+1), Xmaxc(j+1), xc(j+1,:)] = RPEencode(e(40*j+1:40*j+40));
    end
    block((i-1)/160+1,:) = params2bin(LARc, Nc, bc, Mc, Xmaxc, xc);
    drc(1:160)=drc(161:320);
end
return;
drc = zeros(1, 320);
for i=1:160:length(s0)-159
    [LARc, Nc, bc, Mc, Xmaxc, xc] = bin2params(block((i-1)/160+1,:));
    for j=0:3
        e(40*j+1:40*j+40) = RPEdecode(Mc(j+1), Xmaxc(j+1), xc(j+1));
    end
    [s(i:i+159), drc(161:320)] = RPE_frame_SLT_decoder(LARc, Nc, bc, e, drc(1:160));
    drc(1:160)=drc(161:320);
end

sound(s, 8000);
% audiowrite("coded.wav",s,8000);



