function r = ACF(s)
    ACF=zeros(1,9);
    r=ACF;
    P=r;
    K=P;
    %compute ACF
    for k=1:9
        r(k) = sum(s(k:end).*s(1:end-k+1));
    end
    
    if ACF(1)==0
        r = zeros(1, 8);
        return;
    end
    
    %initialize K, P
    for i=2:8
        K(10-i)=ACF(i);
    end
    for j=1:9
        P(j)=ACF(j);
    end
    
    %compute r
    for n=2:9
        if P(1) < abs(P(2))
            r = [r(1:n-1) zeros(1,9-n+1)];
            break;
        end
        r(n)=abs(P(2))/P(1);
        if P(2) > 0
            r(n)=-r(n);
        end
        if n == 9
            break;
        end

        %Schur recursion
        P(1) = P(1) + P(2)*r(n);
        for m=2:9-n
            P(m)=P(1+m) + r(n)*K(9-m);
            K(9-m) = K(9-m) + r(n)*P(1+m);
        end
    end
    r=r(2:end);
end