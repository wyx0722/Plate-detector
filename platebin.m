function[imb] = platebin(img,pasos)
    
    %{
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
    %}
       
    blk = 7;
    pasos = pasos+blk;   
    %imshow(imb);
    
    %pasos = 10;
    img = padarray(img,[(pasos+blk) (pasos+blk)]);

    im = rgb2gray(img);
    [h,w] = size(im);
    imb = zeros(h,w);
    fij = h-pasos-1-blk;
    fii = w-pasos-1-blk;
    
    inij = (pasos+1+blk);
    inii = (pasos+1+blk);
    
    for qq = inij:blk:fij
        for ww = inii:blk:fii         
             cp = im((qq+1-pasos):(qq+1+pasos),(ww+1-pasos):(ww+1+pasos));
             g = graythresh(cp)*255;
             
             for x = qq:(qq+blk)
                 for y = ww:(ww+blk)
                     imb(x,y) = (im(x,y) < g);
                 end
             end
        end
    end
    
    %imb = ~imfill(imb);
    [h w p] = size(img);
    imb = ~imb((pasos+1+blk):(h-pasos-blk),(pasos+1+blk):(w-pasos-blk));
    %imshow(imb)
    
end
