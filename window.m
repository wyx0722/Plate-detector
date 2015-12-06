function [F] = window(img)
  [w,h] = size(img);
  h = h*0.01;
  im = rgb2gray(img);
  g = graythresh(im);
  imb = im2bw(im,g);
  
  imb = imclearborder(imb);    
  imb = imopen(imb, strel('square', 5)); 
  imb = imopen(imb, strel('square', 5));
  imb = imclose(imb, strel('square', 5));
  imb = imclose(imb, strel('square', 5));
  
  %imshow(imb)
  %pause
  %hold on  

  r = regionprops(imb,'boundingbox')
  a = cat(1, r.BoundingBox);
  j = 1;
  for i = 1:size(a,1)
      if a(i, 4) >= h && a(i, 3) > a(i, 4) && (a(i, 3)/5) < a(i, 4)
          %rectangle('position', a(i,:), 'Edgecolor', 'r') 
          F(j, :) = a(i,:);
          j = j + 1;
      end
  end
end
