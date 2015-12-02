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
        descriptors(imcrop(c,b(p,:)));
        %rectangle('position', b(p,:), 'Edgecolor', 'r') 
        %imshow(b(p,:))
        %pause
    end
    %hold off
end


