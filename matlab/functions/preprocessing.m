function S = preprocessing(So)
    Sof=zeros([1 160], 'like', So);
    Sof(1)=So(1);
    S=zeros([1 160], 'like', Sof);
    S(1)=Sof(1);
    
    %offset compensation
    for k=2:160
        Sof(k) = So(k)-So(k-1) + 32735*2^(-15) * Sof(k-1);
    end
    
    %Preemphasis
    for k=2:160
        S(k) = Sof(k) - 28180*2^(-15) * Sof(k-1);
    end
end