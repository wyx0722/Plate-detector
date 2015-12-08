%{
files = dir('examples/*.jpg');
for file = files'

    img = imread(strcat('examples/',file.name));
    lrect = window(img);  
    
    for i = 1:size(lrect)
        c = imcrop(img,lrect(i,:));
        b = characters(c);
        %figure, title(file.name)
        if (size(b,1) ~= 0)
            imshow(c)
            hold on
            for p = 1:size(b,1)
                rectangle('position', b(p,:), 'Edgecolor', 'r') 
            end
            hold off
            pause(1)
        end
    end    
end
%}

%{
img = imread('examples/e_5089bzv.jpg');
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
imshow(c);
hold on
for p = 1:size(b,1)
    rectangle('position', b(p,:), 'Edgecolor', 'r') 
end
hold off
%%}




