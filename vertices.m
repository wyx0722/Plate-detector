function count = vertices(img)
    %img = imread('letters/7.png');

    im = rgb2gray(img);
    g = graythresh(im);
    imb = im2bw(im,g);
    imb = imclearborder(~imb);
    %imb = imopen(imb, strel('square', 3)); 
    
    imshow(imb)

    skel = bwmorph(imb, 'skel', Inf);

    %imshow(skel);

    corn = corner(skel);

    count = size(corn,1);
end