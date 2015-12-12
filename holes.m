function[hof] = holes(img)
    hof = [];
    ho = 0;
    [w,h] = size(img);
    
    im = rgb2gray(img);
    g = graythresh(im);
    imb = im2bw(im,g);
    
    
    %imb = platebin(img,3,1);
    
    imb = imclearborder(imb);
    %imshow (imb)
    %pause
    %hold on

    r = regionprops(imb,'boundingbox');
    a = cat(1, r.BoundingBox);
    
    j = 1;
    for i = 1:size(a,1)        
      if a(i, 4) >= (h*0.05) && a(i, 3) >= (w*0.05)
          %rectangle('position', a(i,:), 'Edgecolor', 'r') 
          ho = ho + 1;
      end
    end
    
    hof = ho;
    
    %pause
    %hold offs