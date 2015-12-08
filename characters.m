function[b] = characters(img)
    b = [];
    
    imb = platebin(img);
    
    [h w] = size(img);
    altura = h;
    
    imb(:,:) = not (imb(:,:));
    imb = imclearborder(imb);
    
    %imshow(imb)
    %hold on
       
    r = regionprops(imb,'boundingbox');
    a = cat(1, r.BoundingBox);
    
    j = 1;
    for i = 1:size(a,1)
        if (a(i, 3)*1.2) < a(i, 4) && a(i, 4) > (0.3*altura)
            cp = imcrop(img,a(i,:));
            im = rgb2gray(cp);
            g = graythresh(im);
            cp = im2bw(im,g);
            [hh ww] = size(cp); 
            perc = sum(cp(:))/(ww*hh);
            
            if a(i, 3) <= (a(i, 4)/3)
                hal = cp(:,1:(ww/2));
                har = cp(:,(ww/2):end);                      
                [hr wr] = size(har);
                whr = (hr*wr);
                per = sum(har(:))/whr
                pel = sum(hal(:))/whr
                
                if (per < 0.4) && (pel > 0.4)
                    b(j, :) = [(a(i,1)-1) (a(i,2)-1) (a(i,3)+2) (a(i,4)+2)];
                    j = j + 1;     
                end
                
            elseif (perc <= 0.80 && perc >= 0.25)
                b(j, :) = [(a(i,1)-1) (a(i,2)-1) (a(i,3)+2) (a(i,4)+2)];
                j = j + 1;
            end
        end      
    end
    
    %hold off
    