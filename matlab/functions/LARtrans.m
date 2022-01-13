function LAR = LARtrans(r)
   LAR = zeros([1 length(r)-1]); 
   for i=2:length(r)
       if abs(r(i)) < 0.675
           LAR(i-1)=r(i);
       elseif abs(r(i)) < 0.95
           LAR(i-1)=sign(r(i))*(2*abs(r(i))-0.675);
       else
           LAR(i-1)=sign(r(i))*(8*abs(r(i))-6.375);
       end
   end
end