function r = LARinv(LAR)
    r = zeros(1, length(LAR));
    for i=1:length(LAR)
        if abs(LAR(i)) < 0.675
           r(i)=LAR(i);
       elseif abs(LAR(i)) < 1.225
           r(i)=sign(LAR(i))*(0.5*abs(LAR(i))+0.3375);
        else
           r(i)=sign(LAR(i))*(0.125*abs(LAR(i))+0.796875);
       end
    end
%     for i=1:length(LAR)
%         r(i)=(10^LAR(i)-1)/(10^LAR(i)+1);
%     end
end