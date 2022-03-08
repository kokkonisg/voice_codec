function r = ComputeRC(s)
    s = s(:).';
    %compute ACF values
    [ACF, ~] = xcorr(s, 8);
    
    % xcorr returns values for k = [-8 ,8] 
    % so we trim the first 8 values
    rs = ACF(9:end); 
%     r = schurrc(rs); % schur recursion is used in the original
    

    % creating 8x8 matrix R (equation 4 in project presentation)
    R(1,:) = [rs(1), rs(2), rs(3), rs(4), rs(5), rs(6), rs(7), rs(8)];
    for i=2:8
        R(i,:) = R(i-1,:);
        R(i,[i-1 i])=R(i,[i i-1]);
    end
    
    % calculating weights, transforming them to pass through poly2rc
    % function and clipping the r coefficients just in case
    w = R\rs(2:9).';
    r=poly2rc([1 -w.']);
    for i=1:length(r)
        if r(i) < -1
            r(i) = -1;
        elseif r(i) > 1
            r(i) = 1;
        end
    end
end