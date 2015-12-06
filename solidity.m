function sol = solidity(img)
    %img = imread('letters/C.png');
    im = rgb2gray(img);
    g = graythresh(im);
    imb = im2bw(im,g);
    imb = imclearborder(~imb);
    
    S = regionprops(imb, 'BoundingBox', 'Solidity');
    big = [0 0];
    pos = 0;
    for i = 1:size(S)
        if S(i).BoundingBox(3:4) > big
            big = S(i).BoundingBox(3:4);
            pos = i;
        end
    end
    if (size(S) > 1)
        pause
    end
    if pos == 0
        sol = 0;
    else
        sol = S(pos).Solidity;
    end
end