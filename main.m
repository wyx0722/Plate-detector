function main(path,tb)
    img = imread(path);
    lrect = window(img);
    %tb = getTreeBagger;


    for i = 1:size(lrect)
        c = imcrop(img,lrect(i,:));
        %figure
        b = characters(c);
        if size(b,1) ~= 0
            imshow(c)
            hold on
            j = 1;
            for p = 1:size(b,1)
                cwindow = imcrop(c,b(p,:));
                %descriptors(cwindow)
                [pred,prob] = predict(tb,descriptors(cwindow))
                h(p) = formatPredict(p, prob);
                %h(p) = pred;
                rectangle('position', b(p,:), 'Edgecolor', 'r')
                %imshow(cwindow)
                %pause
            end
            h
            %figure('name',h);
            %imshow(c);
            hold off
        end
        %figure('name',h);
        %hold off
    end
end


