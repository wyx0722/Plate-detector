
clc
clear all
close all

img = imread('e_5089bzv.jpg');
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


imshow(imb)
r = regionprops(imb,'boundingbox')
a = cat(1, r.BoundingBox);
j = 1;
for i = 1:size(a,1)
    if a(i, 4) >= h && a(i, 3) > a(i, 4) && (a(i, 3)/5) < a(i, 4)
        b(j, :) = a(i,:);
        j = j + 1;
    end
end

hold on

for p = 1:size(b,1)
    rectangle('position', b(p,:), 'Edgecolor', 'r') 
end
hold off



