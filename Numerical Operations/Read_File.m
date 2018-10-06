
function array = Read_File(filename)
pattern = "[";
fid = fopen(filename, 'rt');
if fid < 0
    msgbox('error opening file');
end
oneline = fgets(fid);
index = 1 ;
while ischar(oneline)
    array{index}=oneline;
    index = index +1;
    oneline = fgets(fid);
end
for i = 1:size(array,2)
    array{i} = extractBetween(array{i},"|","|");
    array{i} = strtrim(array{i});
    if(contains(array{i},pattern))
        array{i} = extractBetween(array{i},"[","]");
    end
end
array = string(array);
fclose(fid);
end