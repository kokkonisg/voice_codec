function LARc = LARquant(LAR)
    LARc = zeros([1 length(LAR)]);
    A = [20 20 20 20 13.637 15 8.334 8.824];
    B = [0 0 4 -5 0.184 -3.5 -0.666 -2.235];
    for i=1:length(LAR)
        LARc(i)=round(A(i)*LAR(i)+B(i));
    end
end