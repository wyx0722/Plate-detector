function[re] = regions(img)
    re = []; 
    im = rgb2gray(img);
    g = graythresh(im);
    imb = im2bw(im,g);
    imb = ~imclearborder(~imb);
    %imb = imopen(imb, strel('square', 2)); 
    [w,h] = size(imb); 
        
    hh = round(h/3);
    ww = round(w/3);
    
    pr = hh*ww;
    
    I1=imb(1:ww,1:hh);
    I2=imb(ww:(2*ww),1:hh);   
    I3=imb((2*ww):w,1:hh);
    
    I4=imb(1:ww,hh:(2*hh));
    I5=imb(ww:(2*ww),hh:(2*hh));   
    I6=imb((2*ww):w,hh:(2*hh));
        
    I7=imb(1:ww,(2*hh):h);
    I8=imb(ww:(2*ww),(2*hh):h);   
    I9=imb((2*ww):w,(2*hh):h);
    
    re = [sum(I1(:))/pr,sum(I2(:))/pr,sum(I3(:))/pr,sum(I4(:))/pr,sum(I5(:))/pr,sum(I6(:))/pr,sum(I7(:))/pr,sum(I8(:))/pr,sum(I9(:))/pr];