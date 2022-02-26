function r = ACF(s)
    s = s(:).';
    %compute ACF
    [ACF, ~] = xcorr(s, 8);
    rs = ACF(9:end);
%     r = schurrc(rs);
    
    R(1,:) = [rs(1), rs(2), rs(3), rs(4), rs(5), rs(6), rs(7), rs(8)];
    for i=2:8
        R(i,:) = R(i-1,:);
        R(i,[i-1 i])=R(i,[i i-1]);
    end
    
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