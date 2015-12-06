function[c] = getTreeBagger()
  jc = imread('examples/test.jpg');
  b = characters(jc);
  
  %desc = zeros(30,13);
  
  index = ['0';'1';'2';'3';'4';'5';'6';'7';'8';'9';'B';'C';'D';'F';'G';'H';'J';'K';'L';'M';'N';'P';'R';'S';'T';'V';'W';'X';'Y';'Z'];

  for p = 1:30
      %index(p)
      cwindow = imcrop(jc,b(p,:));
      %imshow(cwindow)
      aux = descriptors(cwindow);
      desc(p,:) = aux;
      %pause
  end
  
    
  c = TreeBagger(200,desc,index);
  
  %predict(c,descriptors(imread('letters/c.png')))
  
end