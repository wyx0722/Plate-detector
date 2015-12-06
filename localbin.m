clc
clear all
close all

img = imread('2093GSW.jpg');
im = rgb2gray(img)

ni = 31;
nj = 31;
mid = ((ni*nj-1)/2)+1;

sti = ((ni-1)/2);
stj = ((nj-1)/2);

fini = w-sti;
finj = q-stj;

for i = (sti+1):fini
    for j = (stj+1):finj
        if mask(i,j) == 0
            aux = Fc((i-sti):(i+sti), (j-stj):(j+stj));
            aux(mid) = [];
            Fc(i,j) = mean(aux(:));
        end
    end
end