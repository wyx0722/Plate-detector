function [F] = window(img)
  [w,h] = size(img);
  %{
  im = rgb2gray(img);
  g = graythresh(im);
  imb = im2bw(im,g);
  %}
  F = [];
  
  imb = binary(img);
  
  %{
  imb = imclearborder(imb);    
  imb = imopen(imb, strel('square', 5)); 
  imb = imopen(imb, strel('square', 5));
  imb = imclose(imb, strel('square', 5));
  imb = imclose(imb, strel('square', 5));
  %}
  %imshow(imb);
  %pause
  
  %imshow(imb)
  %pause
  %hold on  

  r = regionprops(imb,'boundingbox')
  a = cat(1, r.BoundingBox);
  j = 1;
  hh = w*0.05;
  for i = 1:size(a,1)      
      if a(i, 3) > (3/2)*a(i, 4) && (a(i, 3)/7) < a(i, 4)
          
          cwindow = imcrop(img,a(i,:));
          bwindow = rgb2gray(cwindow);
          g = graythresh(bwindow);
          cwindow = im2bw(bwindow,g);
          
          suma = sum(cwindow(:));
          [n m] = size(cwindow);
          if (suma/(n*m)) > 0.4 && a(i, 4) > hh
              F(j, :) = a(i,:);
              j = j + 1;
          end
      end
  end
end
