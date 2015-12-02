function [] = kslope(img, k)
imgc = getcontour(img);
imshow(imgc);
figure
[he,wi] = size(imgc);

%-----------------------------------------------------------------
%find first contour point
nfound = true;
i = 1;
j = 1;
while nfound && i < he
    j = 1;
    while nfound && j < wi
        if (imgc(i,j) == 0)
            nfound = false;
        end
        j = j+1;
    end
    i = i+1;
end
imgc(i-1, j-1) = 1;
result = zeros(1,sum(~imgc(:)));
it = 1;
%-----------------------------------------------------------------


%recorre tots els punts del contorn
%-----------------------------------------------------------------
xs = 0;
ys = 0;
xe = i-1;
ye = j-1;
while (~(xs == xe && ys == ye))
    xs = xe;
    ys = ye;
    [xe,ye,imgc] = getnextk(imgc, xs, ys, k);
    aux = getalpha(xs, ys, xe, ye);
    
    %guarda en result els graus del kslope
    for (l=1:k)
        if (aux > 180)
           aux = -(360-aux);
        end
        result(1,it) = aux;
        it = it+1;
    end
end

%extendre els ultims numeros per evitar retornar un resultat amb NaN's
it = it-k;
for (l=1:k)
    result(1,it) = result(1,it-1);
    it = it+1;
end

plot(result)


