function[re] = regions(img)
    re = []; 
    im = rgb2gray(img);
    g = graythresh(im);
    imb = im2bw(im,g);
    imb = ~imclearborder(~imb);
    [w,h] = size(imb); 
    hh = round(h/2);
    ww = round(w/2);
    
    I1=imb(1:ww,1:hh);
    I2=imb(1:ww,hh:h);
    I3=imb(ww:w,1:hh);
    I4=imb(ww:w,hh:h);
   
    re = [sum(I1(:)),sum(I2(:)),sum(I3(:)),sum(I4(:))];