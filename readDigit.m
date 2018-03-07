function digit = readDigit(x, i)
%Enter a train matrix and the ith row you wish to read
%and this function etrieves it and displays it.
%i must be a number between 0 and 5924.

digit = x(i,:);
digitImage = reshape(digit,28,28);
image(rot90(flipud(digitImage), -1)), colormap(gray(256)), axis square tight off;

end
