function c = getcontour(img)

%img = rgb2gray(img);
%g = graythresh(img);
%bim = ~im2bw(img,g);

bim = ~im2bw(img);
imo = imclose(bim, strel('square', 5));
w_lap = fspecial('laplacian');
c = ~imfilter(imo, w_lap);