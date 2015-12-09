function[output] = formatPredict(i, prob)
    index = ['0';'1';'2';'3';'4';'5';'6';'7';'8';'9';'B';'C';'D';'F';'G';'H';'J';'K';'L';'M';'N';'P';'R';'S';'T';'V';'W';'X';'Y';'Z'];
    scoreMax = -1;
    maxindex = 1;

    if i <= 4 
        for outindex = 1:10
            if prob(outindex) >= scoreMax
                maxindex = outindex;
                scoreMax = prob(outindex);
            end
        end    
    else 
        for outindex = 11:30
            if prob(outindex) >= scoreMax
                maxindex = outindex;
                scoreMax = prob(outindex);
            end
        end    
    end
    output = index(maxindex);
end