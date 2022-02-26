function d = Residual(S, a)   
%     d = zeros([length(S) 1]);
%     for i=1:length(d)
%         for k=1:9
%             if i-k>0
%                 d(i) = d(i) + a(k)*S(i-k);
%             end
%         end
%     end
    
    Shut(1:9,:) = ones(9,1)*S;
    for k=0:8
        Shut(k+1,:) = circshift(Shut(k+1,:), k);
        Shut(k+1, 1:k) = 0;
    end
    d = a*Shut;


end