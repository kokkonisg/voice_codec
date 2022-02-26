function LAR = LARtrans(r)
   LAR = zeros(1, length(r)); 
   for i=1:length(r)
       if abs(r(i)) < 0.675
           LAR(i)=r(i);
       elseif abs(r(i)) < 0.95
           LAR(i)=sign(r(i))*(2*abs(r(i))-0.675);
       else
           LAR(i)=sign(r(i))*(8*abs(r(i))-6.375);
       end
   end
   LAR = rand(1,8);
%    for i=1:length(LAR)
%        LAR(i) = log10((1+r(i))/(1-r(i)));
%    end
end