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
        b(j, :) = [(a(i,1)-1) (a(i,2)-1) (a(i,3)+2) (a(i,4)+2)];
        j = j + 1;
        %{
        if a(i, 3) < a(i, 4) && a(i, 4) > (0.2*altura)
            cp = imcrop(imb,a(i,:));
            [w h] = size(cp);
            if ((sum(cp(:))/(w*h)) <= 0.75)
                %rectangle('position', a(i,:), 'Edgecolor', 'r') 
                b(j, :) = [(a(i,1)-1) (a(i,2)-1) (a(i,3)+2) (a(i,4)+2)];
                j = j + 1;
            end
        end
        %}
        
    end
    
    %hold off
    