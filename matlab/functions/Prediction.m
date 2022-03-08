function e = Prediction (d, dprev, b, N)
    %dprev are the recreated values of d
    e = zeros(1,length(dprev));
    for n=1:length(dprev)
        e(n) = d(n) - b*dprev(n-N);
    end
end