function[c] = getTreeBagger()
  
    %desc = zeros(30,13);
  
    index = ['0';'1';'2';'3';'4';'5';'6';'7';'8';'9';'B';'C';'D';'F';'G';'H';'J';'K';'L';'M';'N';'P';'R';'S';'T';'V';'W';'X';'Y';'Z'];

    files = dir('letters/*.png');
    %Normal Images%
    j = 1;
    for file = files'
        img = imread(strcat('letters/',file.name));
        aux = descriptors(img);
        desc(j,:) = aux;
        j = j+1;
        imshow(img);
    end
    
    files = dir('l/*.png');
    for file = files'
        img = imread(strcat('l/',file.name));
        aux = descriptors(img);
        desc(j,:) = aux;
        j = j+1;
        imshow(img);
    end
    
    files = dir('r/*.png');
    for file = files'
        img = imread(strcat('r/',file.name));
        aux = descriptors(img);
        desc(j,:) = aux;
        j = j+1;
        imshow(img);
    end
  
    
    %Blurred images%
    
    for file = files'
        img = imread(strcat('letters/',file.name));
        w_gaus = fspecial('gaussian',9, 2);
        i_gaus = imfilter(img, w_gaus);
        aux = descriptors(i_gaus);
        desc(j,:) = aux;
        j = j+1;
        imshow(i_gaus);
    end
    
    for file = files'
        img = imread(strcat('l/',file.name));
        w_gaus = fspecial('gaussian',9, 2);
        i_gaus = imfilter(img, w_gaus);
        aux = descriptors(i_gaus);
        desc(j,:) = aux;
        j = j+1;
        imshow(i_gaus);
    end
    
    for file = files'
        img = imread(strcat('r/',file.name));
        w_gaus = fspecial('gaussian',9, 2);
        i_gaus = imfilter(img, w_gaus);
        aux = descriptors(i_gaus);
        desc(j,:) = aux;
        j = j+1;
        imshow(i_gaus);
    end
    
    
    
    
    
    
    
    for file = files'
        img = imread(strcat('letters/',file.name));
        w_gaus = fspecial('gaussian',7, 1);
        i_gaus = imfilter(img, w_gaus);
        aux = descriptors(i_gaus);
        desc(j,:) = aux;
        j = j+1;
        imshow(i_gaus);
    end
    
    for file = files'
        img = imread(strcat('l/',file.name));
        w_gaus = fspecial('gaussian',7, 1);
        i_gaus = imfilter(img, w_gaus);
        aux = descriptors(i_gaus);
        desc(j,:) = aux;
        j = j+1;
        imshow(i_gaus);
    end
    
    for file = files'
        img = imread(strcat('r/',file.name));
        w_gaus = fspecial('gaussian',7, 1);
        i_gaus = imfilter(img, w_gaus);
        aux = descriptors(i_gaus);
        desc(j,:) = aux;
        j = j+1;
        imshow(i_gaus);
    end
    
    
    
    %pixelated characters
    for file = files'
        img = imread(strcat('letters/',file.name));
        w_gaus = fspecial('gaussian',9, 2);
        i_gaus = imfilter(img, w_gaus);
        [h w q] = size(i_gaus);
       	i_gaus = imresize(i_gaus, [15 5]);
        i_gaus = imresize(i_gaus, [h w]);
        aux = descriptors(i_gaus);
        desc(j,:) = aux;
        j = j+1;
        imshow(i_gaus);
    end
    
    for file = files'
        img = imread(strcat('l/',file.name));
        w_gaus = fspecial('gaussian',9, 2);
        i_gaus = imfilter(img, w_gaus);
        [h w q] = size(i_gaus);
       	i_gaus = imresize(i_gaus, [15 5]);
        i_gaus = imresize(i_gaus, [h w]);
        aux = descriptors(i_gaus);
        desc(j,:) = aux;
        j = j+1;
        imshow(i_gaus);
    end
    
    for file = files'
        img = imread(strcat('r/',file.name));
        w_gaus = fspecial('gaussian',9, 2);
        i_gaus = imfilter(img, w_gaus);
        [h w q] = size(i_gaus);
       	i_gaus = imresize(i_gaus, [15 5]);
        i_gaus = imresize(i_gaus, [h w]);
        aux = descriptors(i_gaus);
        desc(j,:) = aux;
        j = j+1;
        imshow(i_gaus);
    end
    
    
    

    %{
    for p = 1:30
      %index(p)
      cwindow = imcrop(jc,b(p,:));
      imshow(cwindow);
      aux = descriptors(cwindow);
      desc(p,:) = aux;
    end
    %}
    ind = vertcat(index,index,index,index,index,index,index,index,index,index,index,index);
    c = TreeBagger(500,desc,ind);

    %predict(c,descriptors(imread('letters/c.png')))
  
end