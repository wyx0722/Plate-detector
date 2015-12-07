function [I] = zonebinary(img,steps)
%{
    close all
    clear all
    clc

    img = imread('examples/0945HVM.jpg');
%}
    im = rgb2gray(img);
    [h,w] = size(im);
    gaux = graythresh(im);
    
    %imb = imopen(imb, strel('square', 2));
    %imb = imopen(imb, strel('square', 2));
    %imb = imclose(imb, strel('square', 2));
    %imo = imerode(imo, strel('disk', 9));

    %steps = round(((w+h)/2)*0.02);
    %steps = 20;
    I = zeros(h,w);
    j = 1;

    gg = 255*gaux;

    while j < h
        fij = min(steps,h-j);
        i = 1;
        while i < w
            fii = min(steps,w-i);
            cp = im(j:(j+fij),i:(i+fii));

            g = 255* (graythresh(cp));

            %imshow(cp);

            for qq = 1:fij
                for ww = 1:fii
                    I(j+qq,i+ww) = im(j+qq,i+ww) >= g;
                end
            end


            i = i + steps;
        end
        j = j + steps;
    end
    %{
    I = imopen(I, strel('square', 5));
    I = imopen(I, strel('square', 5));
    I = imopen(I, strel('square', 2));
    I = imopen(I, strel('square', 2));
    I = imclose(I, strel('square', 2));
    %}
    %I = ~I;
    %{
    I = imopen(I, strel('square', 2));
    I = imerode(I, strel('square', 2));
    I = imerode(I, strel('square', 2));
    I = imdilate(I, strel('rectangle', [3 5]));
    %I = imerode(I, strel('disk', 2));
    I = logical(imfill(I));
    %}
    I = imerode(I, strel('rectangle', [1 3]));
    I = imclearborder(I);
    I = imerode(I, strel('rectangle', [1 3]));
    %I = imclose(I,strel('square',2));
    %I = logical(imfill(I));
    %I = imopen(I,strel('square',2));
    I = logical(I);
    

    %imshow(I);
    %pause;

end
