function[output] = descriptors(img)
    %imshow(img)
    d1 =holes(img);
    d2 = regions(img);
    d3 = vertices(img);
    d4 = solidity(img);
    output = horzcat(d1,d2,d3,d4(1));