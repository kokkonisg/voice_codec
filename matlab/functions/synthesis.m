function drc = synthesis(e, b, N, dprev)
    % drc, e, b ,N are for current subframe
    % d is for the prev subframes that are already recreated
    
    drc = e + b * dprev(end-N+1 : end-N+40);
end