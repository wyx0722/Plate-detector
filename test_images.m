
files = dir('examples/*.jpg');
for file = files'

    img = imread(strcat('examples/',file.name));
    lrect = window(img);
    
    imshow(binary(img));
    hold on
    
    for i = 1:size(lrect)
        rectangle('position', lrect(i,:), 'Edgecolor', 'r')
    end
    hold off
    pause(1)
end
