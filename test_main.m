
files = dir('examples/*.jpg');
tb = getTreeBagger;
for file = files'
    main(strcat('examples/',file.name),tb);
    pause
end

%{
tb = getTreeBagger;
main('examples/e_5089bzv.jpg',tb);

%}

%h = 27
%h = 19