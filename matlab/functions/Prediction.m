function e = Prediction (d, ds, bc, Nc)
    e = zeros(1,length(ds));
    for n=1:length(ds)
        e(n) = d(n) - bc*ds(n-Nc);
    end
end