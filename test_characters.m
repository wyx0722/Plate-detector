%{
files = dir('examples/*.jpg');
for file = files'

    img = imread(strcat('examples/',file.name));
    lrect = window(img);  
    
    for i = 1:size(lrect)
        c = imcrop(img,lrect(i,:));
        b = characters(c);
        imshow(c)
        if (size(b,1) ~= 0)
            %figure, title(file.name)
            %hold on
            for p = 1:size(b,1)
                rectangle('position', b(p,:), 'Edgecolor', 'r') 
            end
            hold off
            pause(2)
        end
        pause(1)
    end    
end
%}

%{
img = imread('examples/7365CDF.jpg');
lrect = window(img);  

for i = 1:size(lrect)
    c = imcrop(img,lrect(i,:));
    b = characters(c);
    if (size(b,1) ~= 0)
    imshow(c);
    hold on
    for p = 1:size(b,1)
        rectangle('position', b(p,:), 'Edgecolor', 'r') 
    end
    hold off
    pause
    end
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




