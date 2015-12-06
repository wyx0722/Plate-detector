function num = vertices(img)
    %img = imread('letters/B.png');

    im = rgb2gray(img);
    g = graythresh(im);
    imb = im2bw(im,g);
    imb = imclearborder(~imb);
    %imb = imopen(imb, strel('square', 3)); 

    skel = bwmorph(imb, 'skel', Inf);
    
    [w, h] = size(skel);
    hh = round(h/2);
    ww = round(w/2);
    
    num(1) = countVertices(skel(1:ww,1:hh));
    num(2) = countVertices(skel(ww:w,1:hh));
    num(3) = countVertices(skel(1:ww,hh:h));
    num(4) = countVertices(skel(ww:w,hh:h));
    
    %imshow(skel(1:ww,1:hh));
end

function num = countVertices(skel)
    [w, h] = size(skel);
    num = 0;
    for i = 1:w
        for j = 1:h
            if isVertice(skel, i, j)
                num = num + 1;
            end
        end
    end
end

function is = isVertice(skel, r, c)
    is = skel(r,c);
    if r-1 == 0 || r+1 > size(skel, 1) || c-1 == 0 || c+1 > size(skel, 2)
        is = 0;
        return
    end
    if is
        top = skel(max(r-1, 1), max(c-1,1):min(c+1,end));
        mid = skel(r, max(c-1,1):min(c+1,end));
        mid(2) = 0;
        bot = skel(min(r+1, end), max(c-1,1):min(c+1,end));
        aT = any(top);
        aM = sum(mid);
        aB = any(bot);
        is = (aT + aM + aB) == 1;
    end
end
