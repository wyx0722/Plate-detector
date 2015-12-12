function count = vskel(img)
    %img = imread('letters/7.png');
    
    im = rgb2gray(img);
    g = graythresh(im);
    imb = ~im2bw(im,g);
    
    %imb = ~platebin(img,3,3);
    %imb = imclearborder(~imb);
    %imb = imopen(imb, strel('square', 3)); 
    
    skel = bwmorph(imb, 'thin', Inf);
    skel = imclearborder(skel);
    skel = bwmorph(bwareaopen(skel, 10), 'thin', Inf);

    %imshow(skel);

    %corn = corner(skel);

    %count = size(corn,1);
    [w,h] = size(skel); 
        
    hh = round(h/3);
    ww = round(w/3);
    
    pr = hh*ww;
    
    I1=skel(1:ww,1:hh);
    I2=skel(ww:(2*ww),1:hh);   
    I3=skel((2*ww):w,1:hh);
    
    I4=skel(1:ww,hh:(2*hh));
    I5=skel(ww:(2*ww),hh:(2*hh));   
    I6=skel((2*ww):w,hh:(2*hh));
        
    I7=skel(1:ww,(2*hh):h);
    I8=skel(ww:(2*ww),(2*hh):h);   
    I9=skel((2*ww):w,(2*hh):h);
    
    count = [sum(I1(:))/pr,sum(I2(:))/pr,sum(I3(:))/pr,sum(I4(:))/pr,sum(I6(:))/pr,sum(I7(:))/pr,sum(I8(:))/pr,sum(I9(:))/pr];
end
