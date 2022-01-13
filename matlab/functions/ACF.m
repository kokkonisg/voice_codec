function r = ACF(S)
    r=zeros([1 9]);
    for k=1:9
        for i=k:160
            r(k)=r(k)+S(i)*S(i-k+1);
        end
    end
end