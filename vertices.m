function count = vertices(img)
    %img = imread('letters/9.png');

    im = rgb2gray(img);
    g = graythresh(im);
    imb = im2bw(im,g);
    imb = imclearborder(~imb);
    %imb = imopen(imb, strel('square', 3)); 

    skel = bwmorph(imb, 'skel', Inf);
    
    count = 0;
    
    [w, h] = size(skel);
    for i = 1:w
        for j = 1:h
            if isVertice(skel, i, j)
                count = count + 1;
            end
        end
    end
    
    %imshow(skel);
end

function is = isVertice(skel, r, c)
    is = skel(r,c);
    if is
        top = skel(max(r-1, 1), max(c-1,1):min(c+1,end));
        mid = skel(r, max(c-1,1):min(c+1,end));
        mid(2) = 0;
        bot = skel(max(r+1, 1), max(c-1,1):min(c+1,end));
        aT = any(top);
        aM = sum(mid);
        aB = any(bot);
        is = (aT + aM + aB) == 1;
    end
end
