function[output] = descriptors(img)
    %imshow(img)
    d1 =holes(img);
    d2 = regions(img);
    d3 = vertices(img);
    d4 = solidity(img);
    d5 = vskel(img);
    h = HOG(img)';
    m = invmoments(img)*1000;
    ha = harris(img);
    %si = sift(img);
    %haaf = kp_harrislaplace(img);
    %output = horzcat(d1,d2,d3,d4,d5,h);
    %z = zernike(img);
    output = horzcat(d1,d2,d3,d4,d5,m,h,ha);
end
