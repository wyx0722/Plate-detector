
files = dir('examples/*.jpg');
for file = files'

    img = imread(strcat('examples/',file.name));
    imshow(img);
    %figure
    hold on
    lrect = window(img);

    for i = 1:size(lrect)
    rectangle('position', lrect(i,:), 'Edgecolor', 'r') 
    end
    hold off
    
    pause

end


%{
img = imread(strcat('examples/','6220GNC.jpg'));
imb = binary(img);
imshow(imb);
hold on

lrect = window(img);

for i = 1:size(lrect)
    rectangle('position', lrect(i,:), 'Edgecolor', 'r') 
end
hold off
%}