function [xmaxq, xmaxc] = APCM(xmax, mode)
    qlb = [31 63 95 127 159 191 223 255 287 319 351 383 415 447 479 511 575 639 703 767 831 895 959 1023 1151 1279 1407 1535 1663 1791 1919 2047 2303  2559 2815 3071 3327 3583 3839 4095 4607 5119 5631 6143 6655 7167 7679 8191 9215 10239 11263 12287 13311 14335 15359 16383 18431 20479 22527 24575 26623 28671 30719 32767];

    if mode=="e"
        for i=1:length(qlb)
            if xmax<=qlb(i)
                xmaxq = qlb(i);
                xmaxc = i-1;
                return;
            end
        end
        xmaxq = qlb(end);
        xmaxc = length(qlb)-1;
    elseif mode=="d"
        xmaxq = qlb(xmax+1); %here (in decode mode) xmax is actually already encoded
    else
        disp("Choose mode: e for encode or d for decoce");
    end
end
