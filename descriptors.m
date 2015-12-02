function[] = descriptors(img)

    %{
    im = rgb2gray(img);
    g = graythresh(im);
    imb = im2bw(im,g);
    imb = ~imclearborder(~imb);
    imshow(imb)
    pause
    %}
    holes(img);
    
    %getcorners(img);