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
    
    mitja = 0;

    if i <= 4 
        for outindex = 1:10
            mitja = mitja + resprob(outindex);
            if resprob(outindex) >= scoreMax
                maxindex = outindex;
                scoreMax = resprob(outindex);
            end
        end
        mitja = mitja/10 * 1.02;
    else 
        for outindex = 11:30
            mitja = mitja + resprob(outindex);
            if resprob(outindex) >= scoreMax
                maxindex = outindex;
                scoreMax = resprob(outindex);
            end
        end
        mitja = mitja/20 * 1.02;
    end
    
    if (mitja > scoreMax || scoreMax < 0.1)
        output = '*';
    else
        output = index(maxindex);
    end
end