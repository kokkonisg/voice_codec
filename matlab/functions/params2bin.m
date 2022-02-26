function block = params2bin(LARc, Nc, bc, M, Xmax, x)
    block = zeros(1,260);
    block(1:6)   = dec2bin(LARc(1),6)-'0';
    block(7:12)  = dec2bin(LARc(2),6)-'0';
    block(13:17) = dec2bin(LARc(3),5)-'0';
    block(18:22) = dec2bin(LARc(4),5)-'0';
    block(23:26) = dec2bin(LARc(5),4)-'0';
    block(27:30) = dec2bin(LARc(6),4)-'0';
    block(31:33) = dec2bin(LARc(7),3)-'0';
    block(34:36) = dec2bin(LARc(8),3)-'0';
    
    for j=0:3
        s=56*j+37;
        block(s:s+6) = dec2bin(Nc(j+1), 7)-'0';
        block(s+7:s+8) = dec2bin(bc(j+1), 2)-'0';
        block(s+9:s+10) = dec2bin(M(j+1)-1, 2)-'0';
        block(s+11:s+16) = dec2bin(Xmax(j+1), 6)-'0';
        for i=0:12
            block(s+17+3*i:s+19+3*i) = dec2bin(x(j+1,i+1), 3)-'0';
        end
    end
end