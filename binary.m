function [imb] = binary(img)
    imc = zonebinary(img,20);
    imd = zonebinary(img,50);
    ime = zonebinary(img,100);
    imb = min(imd(:,:),imc(:,:));
    imb = min(imb(:,:),ime(:,:));
    %imb = imerode(imb, strel('rectangle', [3 5]));
    %imb = imerode(imb, strel('rectangle', [1 3]));
    %imb = imerode(imb, strel('square',2));
    %imb = imopen(imb, strel('square', 1));
end