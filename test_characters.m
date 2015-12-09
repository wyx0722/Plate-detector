%{
files = dir('examples/*.jpg');
for file = files'

    img = imread(strcat('examples/',file.name));
    lrect = window(img);  
    
    for i = 1:size(lrect)
        c = imcrop(img,lrect(i,:));
        b = characters(c);
        if (size(b,1) ~= 0)
            %figure, title(file.name)
            imshow(platebin(c,3))
            %hold on
            for p = 1:size(b,1)
                rectangle('position', b(p,:), 'Edgecolor', 'r') 
            end
            hold off
            pause
        end
    end    
end
%}

%{
img = imread('examples/7365CDF.jpg');
lrect = window(img);  

for i = 1:size(lrect)
    c = imcrop(img,lrect(i,:));
    b = characters(c);
    imshow(c);
    hold on
    for p = 1:size(b,1)
        rectangle('position', b(p,:), 'Edgecolor', 'r') 
    end
    hold off
    pause
end    
%}

%%{
c = imread('fail.jpg');
b = characters(c);
figure
imshow(platebin(c,2));
hold on
for p = 1:size(b,1)
    rectangle('position', b(p,:), 'Edgecolor', 'r') 
end
hold off
%%}




