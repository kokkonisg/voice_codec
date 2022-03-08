function d = Residual(S, a)   
    
    % create matrix with 9 rows containing copies of S
    Shut(1:9,:) = ones(9,1)*S;
    
    % for each row shift data right and zero fill
    % this way each row contains the prev values 
    for k=0:8
        Shut(k+1,:) = circshift(Shut(k+1,:), k);
        Shut(k+1, 1:k) = 0;
    end
    
    % matrix multiplication, that way d is the sum of all the k past values
    % of S multiplied with their coefficient.
    d = a*Shut;

    %note: row 0 is not shifted at all and its coefficient a[0]=1
    %which means it is the original S
end