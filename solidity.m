function sol = solidity(img)
    im = rgb2gray(img);
    g = graythresh(im);
    imb = im2bw(im,g);
    imb = imclearborder(~imb);
    
    S = regionprops(imb, 'Solidity');
    
    sol = cat(1,S.Solidity);
end