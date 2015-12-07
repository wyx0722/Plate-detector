function [imb] = binary(img)
    imc = zonebinary(img,20);
    imd = zonebinary(img,50);
    ime = zonebinary(img,100);
    imb = min(imd(:,:),imc(:,:));
    imb = min(imb(:,:),ime(:,:));
end