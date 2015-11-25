function[b] = characters(img)

    im = rgb2gray(img);
    g = graythresh(im);
    imb = im2bw(im,g);
    
    [h w] = size(img);
    altura = h;
    
    imb(:,:) = not (imb(:,:));
    imb = imclearborder(imb);
    
    r = regionprops(imb,'boundingbox');
    a = cat(1, r.BoundingBox);
    
    j = 1;
    for i = 1:size(a,1)        
        if a(i, 3) < a(i, 4) && a(i, 4) > (0.5*altura)
            cp = imcrop(imb,a(i,:));
            imshow(cp)
            pause
            [w h] = size(cp);
            if ((sum(cp(:))/(w*h)) <= 0.70)
                b(j, :) = a(i,:);
                j = j + 1;
            end
        end
    end
    
    
    