function LARc = LARquant(LAR)
    LARc = zeros([1 length(LAR)]);
    A = [20 20 20 20 13.637 15 8.334 8.824];
    B = [0 0 4 -5 0.184 -3.5 -0.666 -2.235];
    minLAR = [-32 -32 -16 -16 -8 -8 -4 -4];
    maxLAR = [31 31 15 15 7 7 3 3];
    for i=1:length(LAR)
        LARc(i)=round(A(i)*LAR(i)+B(i));
        if LARc(i) < minLAR(i)
            LARc(i) = minLAR(i);
        elseif LARc(i) > maxLAR(i)
            LARc(i) = maxLAR(i);
        end
    end
end