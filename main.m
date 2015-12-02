clc
clear all
close all

img = imread('0945HVM.jpg');

lrect = window(img)



for i = 1:size(lrect)
    c = imcrop(img,lrect(i,:));
    %figure
    %imshow(c)
    %hold on
    b = characters(c);
    for p = 1:size(b,1)
        cwindow = imcrop(c,b(p,:));
        descriptors(cwindow);
        %rectangle('position', b(p,:), 'Edgecolor', 'r') 
        imshow(cwindow)
        pause
    end
    %hold off
end


