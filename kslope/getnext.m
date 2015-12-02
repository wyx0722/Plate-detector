function [xx,yy] = getnext(imgc, x, y)
    %imgc(y,x)
    
    aux = x;
    auy = y;
    
    for (i=x-1:x+1)
        for (j=y-1:y+1)
            %now = [i,j,imgc(i,j)]
            if (imgc(i,j) == 0)
                aux = i;
                auy = j;
            end
        end
    end
    xx = aux;
    yy = auy;