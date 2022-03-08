function e = LongTerm_Prediction(d, drc, bc, Nc)
    % d is for current subframe
    % bc, Nc also for current subframe only
    % drc is for recreated d of prev subframes
    e = d - bc*drc(end-Nc+1 : end-Nc+40);
end