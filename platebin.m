function[imb] = platebin(img)
    [h,w] = size(img);
    im = rgb2gray(img);
    g = graythresh(im);
    %imz = im2bw(im,g);
    imc = im2bw(im,g);
       
    ima = im2bw(im,g*0.7);
    imd = imopen(ima, strel('rectangle', [3 1]));
    
    ima = zonebinary(img,round(h*0.1));
    
    %{
    figure('name','otsu')
    imshow(imc)
    pause    
    
    figure('name','zone binary with steps 10')
    imshow(ima)
    pause
    
    figure('name','otsu at 70% and opened')
    imshow(imd)
    pause
    %}
    
    imb = max(ima(:,:),imc(:,:));
    imb = max(imb(:,:),imd(:,:));
end
