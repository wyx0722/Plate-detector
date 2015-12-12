
files = dir('examples/*.jpg');
tb = getTreeBagger;
for file = files'
    main(strcat('examples/',file.name),tb);
    pause
end