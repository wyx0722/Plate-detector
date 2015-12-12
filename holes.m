function[hof] = holes(img)
    hof = [];
    hu = 0;
    hd = 0;
    [h,w] = size(img);
    
    im = rgb2gray(img);
    g = graythresh(im);
    imb = im2bw(im,g);  
    
    %imb = platebin(img,3,1);
    
    imb = imclearborder(imb);
    %imshow (imb)
    %pause
    %hold on
    
    up = imb(1:round(h/2),:);
    down = imb(round(h/2):end,:);
    
    r = regionprops(up,'boundingbox');
    a = cat(1, r.BoundingBox);
    
    j = 1;
    for i = 1:size(a,1)        
      if a(i, 4) >= (w*0.05) && a(i, 3) >= (h*0.05)
          %rectangle('position', a(i,:), 'Edgecolor', 'r') 
          hu = hu + 1;
      end
    end
    
    
    r = regionprops(down,'boundingbox');
    a = cat(1, r.BoundingBox);
    
    j = 1;
    for i = 1:size(a,1)        
      if a(i, 4) >= (w*0.05) && a(i, 3) >= (h*0.05)
          %rectangle('position', a(i,:), 'Edgecolor', 'r') 
          hd = hd + 1;
      end
    end
    
    hof = [hu,hd];
    
    %pause
    %hold offs