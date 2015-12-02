function[] = getcorners(img)

    img = imread('5.jpg');
    im = rgb2gray(img);
    g = graythresh(im);
    imb = im2bw(im,g);
    %imshow(imb)
    %pause
    
    c = corner(imb);
    [h w] = size(c);
    
    result = zeros(1,h);
    for (i=2:h)
        aux = getalpha(c(i-1, 1), c(i-1, 2), c(i, 1), c(i, 2));
        if (aux > 180)
           aux = -(360-aux);
        end
        result(1,i) = aux;
    end

    plot(result)
    pause
    