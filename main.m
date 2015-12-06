clc
clear all
close all

img = imread('examples/9935GLL.jpg');

lrect = window(img)

tb = getTreeBagger;


for i = 1:size(lrect)
    c = imcrop(img,lrect(i,:));
    %figure
    %imshow(c)
    %hold on
    b = characters(c);
    for p = 1:size(b,1)
        cwindow = imcrop(c,b(p,:));
        %descriptors(cwindow)
        [pred,prob] = predict(tb,descriptors(cwindow))
        %rectangle('position', b(p,:), 'Edgecolor', 'r') 
        %imshow(cwindow)
        pause
    end
    %hold off
end


