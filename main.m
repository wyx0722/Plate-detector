
clc
clear all
close all

img = imread('AE123MK.jpg');

lrect = window(img)



for i = 1:size(lrect)
    c = imcrop(img,lrect(i,:));
    b = characters(c);
    imshow(c)
    hold on
    for p = 1:size(b,1)
        rectangle('position', b(p,:), 'Edgecolor', 'r') 
        %imshow(b(p,:))
        %pause
    end
    hold off
    pause
end


