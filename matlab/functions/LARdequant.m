function LAR = LARdequant(LARc)
    LAR = zeros(1, length(LARc));
    A = [20 20 20 20 13.637 15 8.334 8.824];
    B = [0 0 4 -5 0.184 -3.5 -0.666 -2.235];
    minLAR = [-32 -32 -16 -16 -8 -8 -4 -4];
    for i=1:length(LARc)
        LARc(i)=LARc(i)+minLAR(i);
        LAR(i)=(LARc(i)-B(i))/A(i);
    end
end