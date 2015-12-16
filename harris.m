function zones = harris(I)
    
    %I = imresize(I, [32 16]);
    I = rgb2gray(I);
    [h w] = size(I);
    hh = floor(h/3);
    ww = floor(w/3);
    zones = zeros(3,3);
    for i = 0:2
        for j = 0:2
            aux = I(i*hh+1:(i+1)*hh,j*ww+1:(j+1)*ww);
            r = corner(aux);
            zones(i+1,j+1) = size(r,1);
        end 
    end
    zones = zones(:)';
end

