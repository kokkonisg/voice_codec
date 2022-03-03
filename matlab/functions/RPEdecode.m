function e = RPEdecode(Mc, Xmaxc, xc)
    qlb = [-0.875 -0.625 -0.375 -0.125 0.125 0.375 0.625 0.875];
    %decoding values
    xm = qlb(xc+1);
    Xmax = APCM(Xmaxc,'d');
    M=Mc;
    
    x = xm*Xmax*2^-15;
    e = zeros(1,40);
    if M==1
        e(M:3:end-1) = e(M:3:end-1) + x;
    else
        e(M:3:end) = e(M:3:end) + x;
    end
    
    
    
    

end