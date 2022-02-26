function e = LongTerm_Prediction(d, drc, bc, Nc)
    % d is for current subframe
    % bc, Nc also for current subframe only
    % drc is for prev 4 subframes
    e = d - bc*drc(end-Nc+1 : end-Nc+40);
end