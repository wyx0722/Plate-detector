function [xx,yy,im] = getnextk(imgc, x, y, k)
    aux = x;
    auy = y;
    for (p=1:k)
        [aux, auy] = getnext(imgc, aux, auy);
        imgc(aux, auy) = 1;
    end
    xx = aux;
    yy = auy;
    im = imgc;