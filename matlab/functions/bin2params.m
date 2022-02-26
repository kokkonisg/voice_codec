function [LARc, Nc, bc, M, Xmax, x] = bin2params(block)
    
    LARc(1) = bin2dec(strjoin(string(block(1:6)),''));
    LARc(2) = bin2dec(strjoin(string(block(7:12)),''));
    LARc(3) = bin2dec(strjoin(string(block(13:17)),''));
    LARc(4) = bin2dec(strjoin(string(block(18:22)),''));
    LARc(5) = bin2dec(strjoin(string(block(23:26)),''));
    LARc(6) = bin2dec(strjoin(string(block(27:30)),''));
    LARc(7) = bin2dec(strjoin(string(block(31:33)),''));
    LARc(8) = bin2dec(strjoin(string(block(34:36)),''));
    
    for j=0:3
        s=56*j+37;
        Nc(j+1) = bin2dec(strjoin(string(block(s:s+6)),''));
        bc(j+1) = bin2dec(strjoin(string(block(s+7:s+8)),''));
        M(j+1) = bin2dec(strjoin(string(block(s+9:s+10)),''));
        Xmax(j+1) = bin2dec(strjoin(string(block(s+11:s+16)),''));
        for i=0:12
            x(j+1,i+1) = bin2dec(strjoin(string(block(s+17+3*i:s+19+3*i)),''));
        end
    end            
end