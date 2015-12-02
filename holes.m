function[ho] = holes(img)
    ho = 0;
    [w,h] = size(img);
    im = rgb2gray(img);
    g = graythresh(im);
    imb = im2bw(im,g);
    imb = imclearborder(imb);
    %imshow (img)
    %hold on

    r = regionprops(imb,'boundingbox');
    a = cat(1, r.BoundingBox);
    
    j = 1;
    for i = 1:size(a,1)        
      if a(i, 4) >= (h*0.1) && a(i, 3) >= (w*0.1)
          rectangle('position', a(i,:), 'Edgecolor', 'r') 
          ho = ho + 1;
      end
    end
    
    %pause
    %hold off