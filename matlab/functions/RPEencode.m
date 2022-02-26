function [Mc, Xmaxc, xc] = RPEencode(e)
    H = 2^13*[-134 -374 0 2054 5741 8192 5741 2054 0 -374 -134];
    x = zeros(1,40);
    xc = zeros(1,13);
    
    for k=1:40
        for i=1:11
            if k+5-i > 0 && k+5-i < 41
                x(k) = x(k) + H(i)*e(k+5-i);
            end
        end
    end
    
    xm(:,1) = x(1:3:end-1);
    for m=2:4
        xm(:,m) = x(m:3:end);
    end
    
    [~, M] = max(sum(xm.^2));
    Mc = M;
    
    Xmax = max(abs(xm(:,M)));
    [Xmaxq, Xmaxc] = APCM(Xmax,'e');
    x = xm(:,M)'./Xmaxq;
    
    
    for i=1:13
        if x(i) < -0.75
            xc(i)=0;
        elseif x(i) < -0.5
            xc(i)=1;
        elseif x(i) < -0.25
            xc(i)=2;
        elseif x(i) < 0
            xc(i)=3;
        elseif x(i) < 0.25
            xc(i)=4;
        elseif x(i) < 0.5
            xc(i)=5;
        elseif x(i) < 0.75
            xc(i)=6;
        elseif x(i) < 1
            xc(i)=7;
        end
    end
end