function[output] = formatPredict(i, resprob)
    index = ['0';'1';'2';'3';'4';'5';'6';'7';'8';'9';'B';'C';'D';'F';'G';'H';'J';'K';'L';'M';'N';'P';'R';'S';'T';'V';'W';'X';'Y';'Z'];
    scoreMax = -1;
    maxindex = 1;
    %resprob = zeros(30);
    
    %{
    for q = 1:30
        resprob(q) = prob(q) + prob(q+30) + prob(q+60);
    end
    %}
    

    if i <= 4 
        for outindex = 1:10
            if resprob(outindex) >= scoreMax
                maxindex = outindex;
                scoreMax = resprob(outindex);
            end
        end    
    else 
        for outindex = 11:30
            if resprob(outindex) >= scoreMax
                maxindex = outindex;
                scoreMax = resprob(outindex);
            end
        end    
    end
    output = index(maxindex);
end