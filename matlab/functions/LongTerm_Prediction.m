function e = LongTerm_Prediction(d, drc, bc, Nc)
    % d is for current subframe
    % drc is for prev 3 subframes
    
    for j=0:3
        e(40*j+1:40*j+40) = d(40*j+1:40*j+40) - bc(j)*drc(end-Nc(j)+1 : end-Nc(j)+40);
    end
end